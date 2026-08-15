/*3. Longest Substring Without Repeating Characters

Given a string s, find the length of the longest substring without duplicate characters.*/

//solution:

class Solution {
  int lengthOfLongestSubstring(String s) {
    int maxLength = 0;
    int left = 0;
    
     Map<String, int> charMap = {};

    for (int right = 0; right < s.length; right++) {
      String currentChar = s[right];

       if (charMap.containsKey(currentChar) && charMap[currentChar]! >= left) {
        left = charMap[currentChar]! + 1;
      }

       charMap[currentChar] = right;

       int currentLength = right - left + 1;
      if (currentLength > maxLength) {
        maxLength = currentLength;
      }
    }

    return maxLength;
  }
}
