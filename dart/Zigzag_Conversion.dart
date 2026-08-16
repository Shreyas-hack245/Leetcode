/* 6. Zigzag Conversion

The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this: (you may want to display this pattern in a fixed font for better legibility)

P   A   H   N
A P L S I I G
Y   I   R
And then read line by line: "PAHNAPLSIIGYIR"

Write the code that will take a string and make this conversion given a number of rows:

string convert(string s, int numRows);*/

//solution:

class Solution {
  String convert(String s, int numRows) {
     if (numRows == 1 || s.length <= numRows) {
      return s;
    }

     List<StringBuffer> rows = List.generate(numRows, (_) => StringBuffer());
    
    int currentRow = 0;
    bool goingDown = false;

     for (int i = 0; i < s.length; i++) {
      rows[currentRow].write(s[i]);
      
       if (currentRow == 0 || currentRow == numRows - 1) {
        goingDown = !goingDown;
      }
      
       currentRow += goingDown ? 1 : -1;
    }

     StringBuffer result = StringBuffer();
    for (StringBuffer row in rows) {
      result.write(row.toString());
    }

    return result.toString();
  }
}
