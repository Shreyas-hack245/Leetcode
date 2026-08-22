/* 11. Container With Most Water

You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).

Find two lines that together with the x-axis form a container, such that the container contains the most water.

Return the maximum amount of water a container can store.*/

//solution:

class Solution {
  int maxArea(List<int> height) {
    int maxWater = 0;
    int left = 0;
    int right = height.length - 1;

    while (left < right) {
       int width = right - left;
      
       int currentHeight = height[left] < height[right] ? height[left] : height[right];
      
       int currentArea = width * currentHeight;
      
       if (currentArea > maxWater) {
        maxWater = currentArea;
      }

       if (height[left] < height[right]) {
        left++;
      } else {
        right--;
      }
    }

    return maxWater;
  }
}

