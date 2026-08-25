/* 17. Letter Combinations of a Phone Number

Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.

A mapping of digits to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.*/

//solution:

class Solution {
   static const Map<String, String> phoneMap = {
    '2': 'abc',
    '3': 'def',
    '4': 'ghi',
    '5': 'jkl',
    '6': 'mno',
    '7': 'pqrs',
    '8': 'tuv',
    '9': 'wxyz',
  };

  List<String> letterCombinations(String digits) {
    List<String> result = [];
    
     if (digits.isEmpty) {
      return result;
    }

     void backtrack(int index, String currentCombination) {
       if (index == digits.length) {
        result.add(currentCombination);
        return;
      }

       String digit = digits[index];
      String letters = phoneMap[digit] ?? "";

       for (int i = 0; i < letters.length; i++) {
        backtrack(index + 1, currentCombination + letters[i]);
      }
    }

     backtrack(0, "");
    return result;
  }
}
