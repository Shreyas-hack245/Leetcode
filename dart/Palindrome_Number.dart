/*9 Palindrome Number

Given an integer x, return true if x is a palindrome, and false otherwise.*/

//solution:

class Solution {
  bool isPalindrome(int x) {
     if (x < 0 || (x % 10 == 0 && x != 0)) {
      return false;
    }

    int reversedNumber = 0;
    
     while (x > reversedNumber) {
      int pop = x % 10;
      reversedNumber = (reversedNumber * 10) + pop;
      x = x ~/ 10; 
    }

      return x == reversedNumber || x == reversedNumber ~/ 10;
  }
}
