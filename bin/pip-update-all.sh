#!/usr/bin/env bash

pip_update_all () {
  pip_list="$($pip_binary list | cut -d' ' -f1)"
  echo "$pip_list" |
  while read line; do
    $pip_binary install --upgrade $line
  done
}

pip_exists="$(which pip 2>&1 >/dev/null; echo $?)"

if [ "$pip_exists" -ne "0" ]; then
  echo "ERROR: unable to locate pip." && exit 1
else
  pip_binary="$(which pip)"
fi

if [ ! -x "$pip_binary" ]; then
  echo "ERROR: pip is missing or we do not have permission to execute it."
  exit 1
fi

pip_update_all

exit 0
