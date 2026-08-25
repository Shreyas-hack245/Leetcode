/* 15. 3Sum

Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.

Notice that the solution set must not contain duplicate triplets.*/

//solution:

class Solution {
  List<List<int>> threeSum(List<int> nums) {
    List<List<int>> result = [];
    
     nums.sort();
    
    for (int i = 0; i < nums.length - 2; i++) {
        if (nums[i] > 0) break;
      
       if (i > 0 && nums[i] == nums[i - 1]) continue;
      
      int left = i + 1;
      int right = nums.length - 1;
      
      while (left < right) {
        int sum = nums[i] + nums[left] + nums[right];
        
        if (sum == 0) {
          result.add([nums[i], nums[left], nums[right]]);
          
           while (left < right && nums[left] == nums[left + 1]) {
            left++;
          }
           while (left < right && nums[right] == nums[right - 1]) {
            right--;
          }
          
           left++;
          right--;
        } else if (sum < 0) {
          left++;  
        } else {
          right--;  
        }
      }
    }
    
    return result;
  }
}
