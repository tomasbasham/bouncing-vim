#!/usr/bin/env bash

get_github_basename () {
  echo "$1" | sed -E 's|.+\/(.+)$|\1|g'
}

utc_timestamp () {
  date -u +"%Y%m%dT%H%M%SZ"
}

backup_copy () {
  original_fullpath=$1
  bkp_path="${original_fullpath}.$(utc_timestamp).bkp"

  if [[ -L "${original_fullpath}" ]]; then
    echo "[skip] The destination is already a symlink, no need to backup."
  elif [[ -e "${original_fullpath}" ]]; then
    printf "[backup] " && mv -v "${original_fullpath}" "${bkp_path}"
  else
    echo "[skip] No existing version of ${original_fullpath} to backup."
  fi
}

link_rcfile () {
  local rcfile=$1
  local accepted_link_message=$2
  local no_link_message=$3

  local rcfile_fullpath="${HOME}/.${rcfile}"
  local source_rcfile="${HOME}/.vim/bundle/bouncing-vim/rc-files/${rcfile}"

  if [[ $(readlink $rcfile_fullpath) == $source_rcfile ]]; then
    echo "[skip] $rcfile is already linking to the provided rcfile"
    return 0
  fi

  echo "
Some of the features require specific configuration, provided by
${source_rcfile}
You can now link to the ${rcfile} provided (your ${rcfile} will be backed up if present).
Do you want to create a symlink? [y/N]: "

  read -r

  if [[ $REPLY =~ ^[Yy] ]]; then
    backup_and_symlink "${source_rcfile}" "${rcfile_fullpath}"
    echo "${accepted_link_message}"
  else
    echo "[Info] Inspect the provided ${rcfile} for more info."
    echo "${source_rcfile}"
    echo "${no_link_message}"
  fi
}

backup_and_symlink() {
  local source_rcfile=$1
  local rcfile_fullpath=$2

  backup_copy "${rcfile_fullpath}"
  printf "[symlink] " && ln -sfv "${source_rcfile}" "${rcfile_fullpath}"
}

clone_to_bundle_with_home () {
  local github_project=$1
  local home_dir=$2

  local github_basename=$(get_github_basename $github_project)
  local plugin_dir="${home_dir}/.vim/bundle/$github_basename"

  if [[ -d "${plugin_dir}" ]]; then
    echo "[skip] $github_project -> (already installed)"
  else
    echo "[install] $github_project -> ${plugin_dir}"
    git clone -q "https://github.com/${github_project}.git" "${plugin_dir}"
  fi
}

_get_std_plugin_dir () {
  local github_project=$1
  local github_basename=$(get_github_basename $github_project)
  echo "${HOME}/.vim/bundle/${github_basename}"
}

_get_tmp_plugin_dir () {
  local github_project=$1
  local github_basename=$(get_github_basename $github_project)
  echo "${HOME}/.vim/bundle/bouncing-vim-tmp-${github_basename}"
}

install_plugin_with_pathogen () {
  local github_project=$1
  local std_plugin_dir=$(_get_std_plugin_dir "${github_project}")
  local tmp_plugin_dir=$(_get_tmp_plugin_dir "${github_project}")

  if [[ -d "${std_plugin_dir}" ]]; then
    echo "[skip] $github_project -> already installed"
  elif [[ -d "${tmp_plugin_dir}" ]]; then
    echo "[rename] tmp location: ${tmp_plugin_dir} -> ${std_plugin_dir}"
    mv "${tmp_plugin_dir}" "${std_plugin_dir}"
  else
    echo "[install] $github_project -> ${std_plugin_dir}"
    git clone -q "https://github.com/${github_project}.git" "${std_plugin_dir}"
  fi
}

install_tmp_plugin_with_pathogen () {
  local github_project=$1

  local std_plugin_dir=$(_get_std_plugin_dir "${github_project}")
  local tmp_plugin_dir=$(_get_tmp_plugin_dir "${github_project}")

  if [[ -d "${std_plugin_dir}" || -d "${tmp_plugin_dir}" ]]; then
    echo "[skip] $github_project -> already installed"
  else
    echo "[install] $github_project -> ${tmp_plugin_dir}"
    git clone -q "https://github.com/${github_project}.git" "${tmp_plugin_dir}"
  fi
}

has_pathogen () {
  if [[ -e "${HOME}/.vim/autoload/pathogen.vim" ]]; then
    return 0
  else
    return 1
  fi
}

install_pathogen () {
  if has_pathogen; then
    echo "[skip] pathogen.vim is already installed"
    return 0
  fi

  # Install pathogen to handle your plugins, as a normal plugin,
  # so it can be easily updated.
  clone_to_bundle_with_home "tpope/vim-pathogen" "${HOME}"

  printf "[symlink] " && ln -sfv \
    "${HOME}/.vim/bundle/vim-pathogen/autoload/pathogen.vim" \
    "${HOME}/.vim/autoload/pathogen.vim"
}

ls_tmp_plugins () {
  find "${HOME}/.vim/bundle/" -type d -iname 'bouncing-vim-tmp-*'
}

archive_tmp_plugins () {
  local tmp_plugin_name=

  mkdir -p "${HOME}/.vim/_disabled_plugins"

  ls_tmp_plugins | while read tmp_plugin; do
    tmp_plugin_name=$(basename $tmp_plugin)
    mv -v \
      "${tmp_plugin}" \
      "${HOME}/.vim/_disabled_plugins/${tmp_plugin_name}-$(utc_timestamp)"
  done
}

ensure_vim_dir_structure () {
  echo "[mkdir] Ensure a complete ~/.vim dir structure"
  mkdir -v -p ~/.vim/{bundle,autoload,colors,undo,swap,_disabled_plugins}
}
