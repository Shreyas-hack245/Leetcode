/* 22. Generate Parentheses

Given n pairs of parentheses, write a function to generate all combinations of well-formed parentheses.*/

//solution

class Solution {
  List<String> generateParenthesis(int n) {
    List<String> result = [];
    _backtrack(result, "", 0, 0, n);
    return result;
  }

  void _backtrack(List<String> result, String currentString, int open, int close, int max) {
     if (currentString.length == max * 2) {
      result.add(currentString);
      return;
    }

     if (open < max) {
      _backtrack(result, currentString + "(", open + 1, close, max);
    }

     if (close < open) {
      _backtrack(result, currentString + ")", open, close + 1, max);
    }
  }
}
