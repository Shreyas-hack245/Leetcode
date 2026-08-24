/* 14. Longest Common Prefix

Write a function to find the longest common prefix string amongst an array of strings.

If there is no common prefix, return an empty string "".*/

//solution:

class Solution {
  String longestCommonPrefix(List<String> strs) {
    if (strs.isEmpty) return "";

    String prefix = strs[0];
    for (int i = 1; i < strs.length; i++) {
      while (!strs[i].startsWith(prefix)) {
        prefix = prefix.substring(0, prefix.length - 1);
        if (prefix.isEmpty) return "";
      }
    }
    return prefix;
  }
}