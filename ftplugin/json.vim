" `-m json.tool` does not allow to customise the indentation, it fixes to 4
command! -nargs=0 Format execute ':%! python -c "import sys, json; print json.dumps(json.load(sys.stdin), indent=2)"'
