/* 4. Median of Two Sorted Arrays

Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.

The overall run time complexity should be O(log (m+n)).

 

Example 1:

Input: nums1 = [1,3], nums2 = [2]
Output: 2.00000
Explanation: merged array = [1,2,3] and median is 2.
Example 2:

Input: nums1 = [1,2], nums2 = [3,4]
Output: 2.50000
Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.*/

//solution:

var findMedianSortedArrays = function(nums1, nums2) {
     if (nums1.length > nums2.length) {
        return findMedianSortedArrays(nums2, nums1);
    }
    
    const m = nums1.length;
    const n = nums2.length;
    let low = 0;
    let high = m;
    
    while (low <= high) {
         const partitionX = Math.floor((low + high) / 2);
        const partitionY = Math.floor((m + n + 1) / 2) - partitionX;
        
         const maxLeftX = (partitionX === 0) ? -Infinity : nums1[partitionX - 1];
        const minRightX = (partitionX === m) ? Infinity : nums1[partitionX];
        
        const maxLeftY = (partitionY === 0) ? -Infinity : nums2[partitionY - 1];
        const minRightY = (partitionY === n) ? Infinity : nums2[partitionY];
        
         if (maxLeftX <= minRightY && maxLeftY <= minRightX) {
             if ((m + n) % 2 !== 0) {
                return Math.max(maxLeftX, maxLeftY);
            }
             return (Math.max(maxLeftX, maxLeftY) + Math.min(minRightX, minRightY)) / 2;
        } 
         else if (maxLeftX > minRightY) {
            high = partitionX - 1;
        } 
         else {
            low = partitionX + 1;
        }
    }
    
    throw new Error("Input arrays are not sorted.");
};
