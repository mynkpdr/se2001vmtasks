#!/bin/bash

arr=($colors)
result=""
for color in "${arr[@]}"; do
        result+="${color//[aeiou]/} "
done
echo "${result% }"

