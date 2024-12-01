hooray () {
  echo "\n# $@" >> ${SHELLBOOKMARKFILE:-~/saved.sh}
  history | tail -n 1 | awk '{$1=""; print substr($0,2)}' >> ${SHELLBOOKMARKFILE:-~/saved.sh}
}
