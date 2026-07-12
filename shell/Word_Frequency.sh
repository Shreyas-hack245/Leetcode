#!/bin/bash

# LeetCode 192. Word Frequency
#
# Write a bash script to calculate the frequency of each word
# in a text file words.txt.
#
# Assumptions:
# - words.txt contains only lowercase letters and spaces.
# - Each word consists of lowercase letters only.
# - Words are separated by one or more whitespace characters.
#
# Example:
# Input (words.txt):
# the day is sunny the the
# the sunny is is
#
# Output:
# the 4
# is 3
# sunny 2
# day 1

#script:

cat words.txt | tr -s ' ' '\n' | sort | uniq -c | sort -nr | awk '{print $2, $1}'