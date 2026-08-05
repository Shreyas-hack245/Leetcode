/*14. Longest Common Prefix

Write a function to find the longest common prefix string amongst an array of strings.

If there is no common prefix, return an empty string "".

 

Example 1:

Input: strs = ["flower","flow","flight"]
Output: "fl"
Example 2:

Input: strs = ["dog","racecar","car"]
Output: ""
Explanation: There is no common prefix among the input strings.*/

//solution:

var longestCommonPrefix = function(strs) {
    if (!strs || strs.length === 0) return "";
    
     strs.sort();
    
    let first = strs[0];
    let last = strs[strs.length - 1];
    let i = 0;
    
     while (i < first.length && i < last.length && first[i] === last[i]) {
        i++;
    }
    
     return first.substring(0, i);
};
