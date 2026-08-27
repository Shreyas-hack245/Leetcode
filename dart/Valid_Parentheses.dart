/* 20. Valid Parentheses

Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.

An input string is valid if:

Open brackets must be closed by the same type of brackets.
Open brackets must be closed in the correct order.
Every close bracket has a corresponding open bracket of the same type.*/

//solution:

class Solution {
  bool isValid(String s) {
    List<String> stack = [];
    
     Map<String, String> closeToOpen = {
      ')': '(',
      '}': '{',
      ']': '['
    };
    
     for (int i = 0; i < s.length; i++) {
      String char = s[i];
      
       if (closeToOpen.containsKey(char)) {
         String topElement = stack.isNotEmpty ? stack.removeLast() : '#';
        
         if (closeToOpen[char] != topElement) {
          return false;
        }
      } else {
         stack.add(char);
      }
    }
    
     return stack.isEmpty;
  }
}
