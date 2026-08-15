/*1. Two Sum

You are given an array of integers nums and an integer target, return indices of the two numbers such that they add up to target.

You may assume that each input would have exactly one solution, and you may not use the same element twice.

You can return the answer in any order.*/

//solution:

class Solution {
  List<int> twoSum(List<int> nums, int target) {
     final Map<int, int> numMap = {};

    for (int i = 0; i < nums.length; i++) {
      int complement = target - nums[i];

       if (numMap.containsKey(complement)) {
        return [numMap[complement]!, i];
      }

       numMap[nums[i]] = i;
    }

     return [];
  }
}
