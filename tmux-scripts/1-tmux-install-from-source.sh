#!/usr/bin/env bash

set -e

currdir=$( dirname $0 )

source "${currdir}/../utils.sh"
source "${currdir}/tmux-utils.sh"

TMUX_MINOR_VERSION=1.9
TMUX_PATCHLEVEL=a
TMUX_VERSION="${TMUX_MINOR_VERSION}${TMUX_PATCHLEVEL}"
TMUX_SOURCE_TARBALL="${HOME}/Downloads/tmux-${TMUX_VERSION}.tar.gz"
TMUX_SOURCE_DIR="tmux-${TMUX_VERSION}"
TMUX_SOURCE_PATH="${HOME}/Downloads/tmux-${TMUX_VERSION}"
TMUX_DOWNLOAD_URL="http://downloads.sourceforge.net/project/tmux/tmux/tmux-${TMUX_MINOR_VERSION}/tmux-${TMUX_VERSION}.tar.gz"

echo
echo "--- [step 1] Download source ---"
echo

get_source_from_tarball "${TMUX_DOWNLOAD_URL}" \
                        "${TMUX_SOURCE_TARBALL}" \
                        "${TMUX_SOURCE_PATH}" \

echo
echo "--- [step 2] Remove tmux packages ---"
echo

remove_tmux_packages

echo
echo "--- [step 3] Install dependencies ---"
echo

install_dependencies "${currdir}/tmux-deps-build-precise.txt"

echo
echo "--- [step 4] Compile and install tmux ---"
echo

tmux_configure_and_make "${TMUX_SOURCE_PATH}"

make_install_default "${TMUX_SOURCE_PATH}"

echo "Installed tmux version $(tmux -V) at $(which tmux)"

echo
echo "--- [step 5] Backup compiled source and cleanup ---"
echo

archive_source  "${TMUX_SOURCE_PATH}" \
                "tmux" \
                "${TMUX_VERSION}"

echo
echo "--- [step 6] Setup tmux.conf file ---"
echo

echo "Some of the features require specific configuration."
echo "Your tmux.conf will be backed up."

read -p "Do you want to link to the tmux.conf provided? [y/N]: " -r
echo

if [[ $REPLY =~ ^[Yy] ]]; then
  if [[ -e ~/.tmux.conf && ! -L ~/.tmux.conf ]]; then
    echo "Backup original vimrc"
    mv -v ~/.tmux.conf ~/tmux.conf.original
  fi

  ln -vsf "${HOME}/.vim/bundle/bouncing-vim/rc-files/tmux.conf" "${HOME}/.tmux.conf"
else
  echo "Inspect the provided tmux.conf for more info."
  echo "-> ${HOME}/.vim/bundle/bouncing-vim/rc-files/tmux.conf"
fi
