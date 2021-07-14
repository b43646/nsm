#!/bin/bash

my_array=(
"ls"
"ls -l"
)

for i in {0..1}
do
  echo "---- ${my_array[$i]} ---"
  bash -c "${my_array[$i]}"
done
