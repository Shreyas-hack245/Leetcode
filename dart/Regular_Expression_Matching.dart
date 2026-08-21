/* 10. Regular Expression Matching

Given an input string s and a pattern p, implement regular expression matching with support for '.' and '*' where:

'.' Matches any single character.​​​​
'*' Matches zero or more of the preceding element.
Return a boolean indicating whether the matching covers the entire input string (not partial).*/

//solution:

class Solution {
  bool isMatch(String s, String p) {
    int m = s.length;
    int n = p.length;
    
     List<List<bool>> dp = List.generate(
      m + 1, 
      (_) => List.filled(n + 1, false)
    );
    
     dp[0][0] = true;
    
     for (int j = 1; j <= n; j++) {
      if (p[j - 1] == '*') {
        dp[0][j] = dp[0][j - 2];
      }
    }
    
     for (int i = 1; i <= m; i++) {
      for (int j = 1; j <= n; j++) {
        if (p[j - 1] == s[i - 1] || p[j - 1] == '.') {
          dp[i][j] = dp[i - 1][j - 1];
        } else if (p[j - 1] == '*') {
           dp[i][j] = dp[i][j - 2];
          
           if (p[j - 2] == s[i - 1] || p[j - 2] == '.') {
            dp[i][j] = dp[i][j] || dp[i - 1][j];
          }
        }
      }
    }
    
    return dp[m][n];
  }
}
