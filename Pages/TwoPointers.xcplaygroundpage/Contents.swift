//: [Previous](@previous)

import Foundation

//Container with Most Water using BruteForce


func maxArea(_ heights: [Int]) -> Int {
    
    var maxArea = 0
    
    
    for i in 0..<heights.count {
        
        for j in (i + 1)..<heights.count {
            
            var width = j - i
            var height = min(heights[i], heights[j])
            
            var area = width * height
            
            
            maxArea = max(maxArea, area)
            
            
        }
    }
    
    return maxArea
    
}


maxArea([1,7,2,5,4,7,3,6])


//Container with Most Water using two pointers


func maxAreaUsingTwoPointers(_ heights: [Int]) -> Int {
    var maxArea = 0
    var left = 0
    var right = heights.count - 1
    
    while(left < right) {
        
        var width = right - left
        
        var minHeight = min(heights[right], heights[left])
        var area = width * minHeight
        
        maxArea = max(maxArea, area)
        
        
        if heights[left] < heights[right] {
            left += 1
        } else {
            right -= 1
        }
        
    }
    
    return maxArea
    
    
    
    
}

maxAreaUsingTwoPointers([1,7,2,5,4,7,3,6])











// three sum using brute force

func threeSum(_ nums: [Int]) -> [[Int]] {
    var resultSet: Set<[Int]> = []
    let n = nums.count

    // Iterate through the array using three nested loops
    for i in 0..<n {
        for j in i+1..<n {
            for k in j+1..<n {
                // Check if the sum of the triplet is zero
                if nums[i] + nums[j] + nums[k] == 0 {
                    // Insert the triplet into the result set
                    resultSet.insert([nums[i], nums[j], nums[k]])
                }
            }
        }
    }
    
    // Convert the set to an array and return it
    return Array(resultSet)
}

let nums = [-1, 0, 1, 2, -1, -4]
let result = threeSum(nums)
print(result)



func threeSum1(_ inputArray: [Int]) -> [[Int]] {
    
    var result = [[Int]]()
    
    var nums = nums.sorted()
    
    for i in 0..<nums.count {
        
        if i > 0 && nums[i] == nums[i - 1] {
            continue
        }
        
        var left = i + 1
        var right = nums.count - 1
        
        while(left < right) {
            
            let sum = nums[i] + nums[left] + nums[right]
            
            if sum == 0 {
                result.append([nums[i], nums[left], nums[right]])
                
                
                while (left < right) && nums[left] == nums[left + 1] {
                    left += 1
                }
                
                while(left < right) && nums[right] == nums[right - 1] {
                    right -= 1
                }
                
                
                left += 1
                right -= 1
                
            } else if sum > 0 {
                left += 1
                
            } else {
                right -= 1
            }
   
        }
        
    }
    return result
}






threeSum1([-1, 0, 1, 2, -1, -4])
//Input: nums = [-1,0,1,2,-1,-4]
//Output: [[-1,-1,2],[-1,0,1]]


