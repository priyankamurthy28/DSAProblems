//: [Previous](@previous)

import Foundation

// Assign Cookie
//Assume you are an awesome parent and want to give your children some cookies. But, you should give each child at most one cookie.
//
//Each child i has a greed factor g[i], which is the minimum size of a cookie that the child will be content with; and each cookie j has a size s[j]. If s[j] >= g[i], we can assign the cookie j to the child i, and the child i will be content. Your goal is to maximize the number of your content children and output the maximum number.

// tc o(n) and sc 0(1)

func AssignCookie(_ greed: [Int], _ s: [Int]) -> Int {
    
    var n = greed.count
    var m = s.count
    var left = 0
    var right = 0
    
    while(left < m && right < n) {
        
        if s[left] >= greed[right] {
            
            right += 1
        }
        
        left += 1
        
    }
    
    return right
    
}

    // tc is O(nlogn+mlogm)
// sc O(1) (or 0(n + m)
AssignCookie([1,2,3], [1, 1])
//o/p is 1

//let g = [10, 9, 8, 7]
//let s = [5, 6, 7, 8]


func findContentChildren(_ g: [Int], _ s: [Int]) -> Int {
    var greed = g.sorted()
    var cookies = s.sorted()
    
    var cookieIndex = 0
    var satifisedChild = 0
    
    
    for childGreed in greed {
        
        while cookieIndex < cookies.count && cookies[cookieIndex] < childGreed {
            cookieIndex += 1
        }
        if cookieIndex < cookies.count {
            satifisedChild += 1
            cookieIndex += 1
        }
        
    }
    return satifisedChild

}


let g = [10, 9, 8, 7]
let s = [5, 6, 7, 8]
//[7,8,9,10]
//[5,6,7,8]
print(findContentChildren(g, s))
//0/p is 2


//lemonade change
//At a lemonade stand, each lemonade costs $5. Customers are standing in a queue to buy from you and order one at a time (in the order specified by bills). Each customer will only buy one lemonade and pay with either a $5, $10, or $20 bill. You must provide the correct change to each customer so that the net transaction is that the customer pays $5.
//
//Note that you do not have any change in hand at first.
//
//Given an integer array bills where bills[i] is the bill the ith customer pays, return true if you can provide every customer with the correct change, or false otherwise.
// tc 0(n) and sc 0(1)

func lemondaeChange(_ bills: [Int]) -> Bool {
    var five = 0
    var ten = 0
    
    for i in 0..<bills.count {
        
        if bills[i] == 5 {
            five += 1
            
        } else if bills[i] == 10 {
            if five >= 1 {
                ten += 1
                five -= 1
                
            } else {
                return false
            }
        } else {
            
            if (ten >= 1) && (five >= 1) {
                ten -= 1
                five -= 1
                
            } else if five >= 3 {
                five -= 3
            } else {
                return false
            }
            
            
        }
        
        
        
        
    }
    
    return true
    
}

//lemondaeChange([5,5,5,10,20])
// true

lemondaeChange([5,5,10,10,20])
// false


//    . Jump Game
//    Medium
//    Topics
//    Companies
//    You are given an integer array nums. You are initially positioned at the array's first index, and each element in the array represents your maximum jump length at that position.
//
//    Return true if you can reach the last index, or false otherwise.


func jumpGame(_ nums: [Int]) -> Bool {
    
    var n = nums.count
    var maxIndex = 0
    
    for i in 0..<n {
        
        if i > maxIndex {
            return false
        } else {
            
            maxIndex = max(maxIndex, i + nums[i])
        }
        
        
    }
    
    return true
    
}

//jumpGame([2,3,1,1,4])
// true

jumpGame([3,2,1,0,4])
//false
