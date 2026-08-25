/* 16. 3Sum Closest

Given an integer array nums of length n and an integer target, find three integers at distinct indices in nums such that the sum is closest to target.

Return the sum of the three integers.

You may assume that each input would have exactly one solution.*/

//solution:

class Solution {
  int threeSumClosest(List<int> nums, int target) {
     nums.sort();
    
     int closestSum = nums[0] + nums[1] + nums[2];
    
    for (int i = 0; i < nums.length - 2; i++) {
      int left = i + 1;
      int right = nums.length - 1;
      
      while (left < right) {
        int currentSum = nums[i] + nums[left] + nums[right];
        
         if (currentSum == target) {
          return currentSum;
        }
        
         if ((currentSum - target).abs() < (closestSum - target).abs()) {
          closestSum = currentSum;
        }
        
         if (currentSum < target) {
          left++;
        } else {
          right--;
        }
      }
    }
    
    return closestSum;
  }
}
