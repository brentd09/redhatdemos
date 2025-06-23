#!/bin/bash

declare -a arr1 arr2
arr1=('bill' 'ben' 'brian')
arr2=('brown' 'stokes' 'solly')
if [[ ${#arr1[@]} -eq   ${#arr2[@]}]]; then
  for index in ${!arr1[@]}; do
    echo "${arr1[$index] - ${arr2[$index]}}"
  done
fi
