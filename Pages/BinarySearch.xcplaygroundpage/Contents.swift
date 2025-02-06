//: [Previous](@previous)

import Foundation

func minimumInARotatedSortedArrayUsingBinarySearch(_ nums: [Int]) -> Int {
    
    var low = 0
    var high = nums.count - 1
    
    var ans = Int.max
    
    while(low <= high) {
        var mid = low + (high - low) / 2
        
        
        if nums[low] <= nums[mid] {
            ans = min(ans, nums[low])
            low = mid + 1
            
        } else {
            
            ans = min(ans, nums[mid])
            high = mid - 1
        }
        
    }
    
    return ans
    
}

// in the rotated sorted [4, 5, 6, 7, 0, 1, 2] in this example left is sorted and since it is sorted smaller will be the first value and elliminate the first half  [4 5  6 7] O(log n).
minimumInARotatedSortedArrayUsingBinarySearch([4, 5, 6, 7, 0, 1, 2])



//Search in Rotated Sorted Array

// since its sorted and search in the question remember to use the binary search
// in binary search first identify  middle element and the portion which is sorted and ellimnate the left/right half which is sorted

func rotatedSortedArray(_ nums: [Int], _ target: Int) -> Int {
    var low = 0
    var high = nums.count - 1
    
    while(low <= high) {
        var mid = low + (high - low) / 2
        
        if nums[mid] == target {
            return mid
        }
        if nums[low] <= nums[mid] {
            if nums[low] <= target && target <= nums[mid] {
                high = mid - 1
            } else {
                low = mid + 1
            }
                 
        } else {
            if nums[mid] <= target && target <= nums[high] {
                low = mid + 1
                
            } else {
                high = mid - 1
            }
        }
        
    }
    
    
   return -1
    
}

//nums = [4, 5, 6, 7, 0, 1, 2], target = 0
//return the index 4
rotatedSortedArray([3,4,5,6,1,2], 1)




