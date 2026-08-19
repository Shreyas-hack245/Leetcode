/* 7. Reverse Integer

Given a signed 32-bit integer x, return x with its digits reversed.
If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.*/

//solution:


class Solution {
  int reverse(int x) {
    int reversed = 0;
    
     const int INT_MAX = 2147483647;       
    const int INT_MIN = -2147483648;     

    while (x != 0) {
       int pop = x % 10;
      
      if (x < 0 && pop > 0) {
        pop -= 10;
      }
      
        x = x ~/ 10;

       if (reversed > INT_MAX ~/ 10 || (reversed == INT_MAX ~/ 10 && pop > 7)) {
        return 0;
      }
      
       if (reversed < INT_MIN ~/ 10 || (reversed == INT_MIN ~/ 10 && pop < -8)) {
        return 0;
      }

       reversed = reversed * 10 + pop;
    }

    return reversed;
  }
}
