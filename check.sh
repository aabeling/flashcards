#!/bin/bash

#
# validates a flashcards file 
#
# each line must contain a tab character
#
# arguments: <filename>
#

function validate() {

  if [[ $1 == "*"* ]]; then
    # ignore comments
    return
  fi

  count=`echo "$1" | fold -1 | grep -c $'\t'`
  if [[ $count != 1 ]]; then
    echo "zu wenig Tabs: $1"
  fi
}

while IFS='' read -r line || [[ -n "$line" ]]; do
    validate "$line"
done < "$1"
