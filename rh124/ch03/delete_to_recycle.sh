#! /bin/bash

mkdir ~/.Deleted &> /dev/null

delfile() {
  if [[ -z $1 ]]; then
    echo "Usage: delfile <filename>"
    return 1
  fi  
  if [[ ! -f $1 ]]; then
    echo "Error: $1 does not exist"
    return 2
  fi
  mv -f $1 ~/.Deleted/
}
