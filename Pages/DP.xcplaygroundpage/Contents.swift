//: [Previous](@previous)

import Foundation

// print subsequences

func printSubsequences<T>(_ array: [T], _ index: Int = 0, _ output: inout [T]) {
    // Base case: when the index reaches the end of the array
    if index >= array.count {
        print(output)
        return
    }
    // Recursive step: include the current element
    // Backtrack
    output.append(array[index]) // Add the current element
    printSubsequences(array, index + 1, &output)
    output.removeLast()
    
    
    // Recursive step: exclude the current element
    printSubsequences(array, index + 1, &output)
    
    
}

// Example usage
let inputArray = [3, 1, 2]
var outputArray: [Int] = []
printSubsequences(inputArray, 0, &outputArray)



// house robber problem
//You are given an integer array nums where nums[i] represents the amount of money the ith house has. The houses are arranged in a straight line, i.e. the ith house is the neighbor of the (i-1)th and (i+1)th house.


// using Recurssive tc 2^n and sc is 0(n)
func robber(_ nums: [Int], _ index: Int) -> Int {
    
    if index == 0 {
        return nums[index]
    }
    
    if index == -1 {
        return 0
    }
    
    var pick = nums[index] + robber(nums, index - 2)
    var notPick = 0 + robber(nums, index - 1)
    var result = max(pick, notPick)
    return result
    
}
var array1 = [2,1,4,9]
robber(array1, array1.count - 1)




// using Dp memo tc is 0(n) and sc is 0(n)
func robberUsingMemo(_ num: [Int], _ index: Int, _ memo:  inout [Int]) -> Int {
    
    if index == 0 {
        return num[index]
    }
    
    if index == -1 {
        return 0
    }
    
    if memo[index] != -1 {
            return memo[index]
        }
    
   var pick = num[index] + robberUsingMemo(num, index - 2, &memo)
    var notPick = 0 + robberUsingMemo(num, index - 1, &memo)
    var result =  max(pick, notPick)
    
    memo[index] = result
    
    return memo[index]
}

var robberArray = [2,1,4,9]
var memo = Array(repeating: -1, count: robberArray.count)
robberUsingMemo(robberArray, robberArray.count - 1, &memo)


func robberUsingTabulation(_ nums: [Int]) -> Int {
    
    // no house to rob
    if nums.count == 0 {
        return 0
    }
    
        // rob first house
    if nums.count == 1 {
        return nums[0]
    }
    
    var dp = [Int](repeating: 0, count: nums.count + 1)
    
    //basecase
    dp[0] = nums[0]
    dp[1] = max(nums[0], nums[1])
    
    
    for i in 2..<nums.count {
        
        dp[i] = max(dp[i - 1], nums[i] + dp[i - 2])
        
        
    }
    return dp[nums.count - 1]
    
}

let robberArray1 = [2, 1, 4, 9]
let maxRobbedAmount = robberUsingTabulation(robberArray1)
//print("Maximum amount that can be robbed: \(maxRobbedAmount)") // Output: 12


//climbing stairs
//You are given an integer n representing the number of steps to reach the top of a staircase. You can climb with either 1 or 2 steps at a time.
//
//Return the number of distinct ways to climb to the top of the staircase.


// using recusrive
func climbingStairs(_ n: Int) -> Int {
    
    if n == 0 || n == 1 {
        return 1
    }
    
    return climbingStairs(n - 1) + climbingStairs(n - 2)
    
}

// using memo
func climbingStairsusingMemo(_ n: Int, _ memo: inout [Int: Int]) -> Int {
    
    if n == 0 || n == 1 {
        return 1
    }
    
    if let result = memo[n] {
        return result
    }
    
    memo[n] = climbingStairsusingMemo(n - 1, &memo) + climbingStairsusingMemo(n - 2, &memo)
    
    return memo[n]!
    
}


// using tabulation

func climbingStairsUsingTabluation(_ n: Int) -> Int {
    
    if n == 0 || n == 1 {
        return 1
    }
    
    var dp = [Int](repeating: 0, count: n + 1)
    
    dp[1] = 1
    dp[0] = 1
    
    
    for i in 2...n {
        
        dp[i] = dp[n - 2] + dp[n - 1]
       
    }
    return dp[n]
}




//longest common subsequence
// in DP problem try to convert to Index
//perform on index and try to get results

// substring should be contigious
// should follow order
//subsequence should not be contingious and should follow order

// time complexity is exponential 2^(N *m ) n and m are str1 and str2
    // sc Space Complexity:0(n + m)


func LCS(_ str1: String, _ str2: String, _ index1: Int, _ index2: Int) -> Int {
    
    if index1 < 0 || index2 < 0 {
        return 0
    }
    
   let indx1 = str1.index(str1.startIndex, offsetBy: index1)
    let indx2 = str2.index(str2.startIndex, offsetBy: index2)

     if str1[indx1] == str2[indx2] {
         
         return 1 + LCS(str1, str2, index1 - 1, index2 - 1)
        
     } else {
         
        let leftHalf =  LCS(str1, str2, index1 - 1, index2)
         let rightHalf = LCS(str1, str2, index1, index2 - 1)
        return  max(leftHalf, rightHalf)
     }

    
}
func findLongestCommonSubSequence(_ str1: String, _ str2: String) -> Int {
   return LCS(str1, str2, str1.count - 1, str2.count - 1)
    
}

let s1 = "abcdef"
let s2 = "zbcdf"
findLongestCommonSubSequence(s1, s2)
//bdf

// longest common subsequence using memoization


func longestCommonSubsequenceUsingMemo(_ str1: String, _ str2: String, _ index1: Int, _ index2: Int, _ memo: inout [[Int]]) -> Int {
    
    if index1 < 0 || index2 < 0 {
        return 0
    }
    
    if memo[index1][index2] != -1 {
            return memo[index1][index2]
        }
    
    let indx1 = str1.index(str1.startIndex, offsetBy: index1)
    let indx2 = str2.index(str2.startIndex , offsetBy: index2)
    
    if str1[indx1] == str2[indx2] {
        memo[index1][index2] = 1 + longestCommonSubsequenceUsingMemo(str1, str2, index1 - 1, index2 - 1, &memo)
    } else {
        let lefthalf = longestCommonSubsequenceUsingMemo(str1, str2, index1 - 1, index2, &memo)
        let righthalf = longestCommonSubsequenceUsingMemo(str1, str2, index1, index2 - 1, &memo)

        
        memo[index1][index2] = max(lefthalf, righthalf)
    }
    return memo[index1][index2]
    
}


func findLCSUsingMemo(_ str1: String, _ str2: String) -> Int {
    
    var memo = Array(repeating: Array(repeating: -1, count: str2.count), count: str1.count)
    
    return longestCommonSubsequenceUsingMemo(str1, str2, str1.count - 1, str2.count - 1, &memo)
}
let s1memo = "abcdef"
let s2memo = "zbcdf"

findLCSUsingMemo(s1memo, s2memo)


// using tabulation

func LCsUsingTabulation(_ str1: String, _ str2: String) -> Int {
    if str1.isEmpty || str2.isEmpty {
            return 0
        }
        
    var dp = Array(repeating: Array(repeating: 0, count: str2.count + 1), count: str1.count + 1)
    
    if dp[0][0] == 0 {
        return 0
    }
    
    for i in 1...str1.count {
            for j in 1...str2.count {
                // Convert indices to work with string characters
                let iIndex = str1.index(str1.startIndex, offsetBy: i - 1)
                let jIndex = str2.index(str2.startIndex, offsetBy: j - 1)
                
                // If characters match, add 1 to the diagonal value
                if str1[iIndex] == str2[jIndex] {
                    dp[i][j] = 1 + dp[i - 1][j - 1]
                } else {
                    // If characters don't match, take the max of left or top cell
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }
        }
    return dp[str1.count][str2.count]
}

func findLongestCommonSubSequenceUsingTabluation(_ str1: String, _ str2: String) -> Int {
    
    return LCsUsingTabulation(str1, str2)
    
}
let s1tab = "abcdef"
let s2tab = "zbcdf"

findLCSUsingMemo(s1tab, s2tab)




func LCSSubseqeunce12(_ str1: String, _ str2: String, _ index1: Int, _ index2: Int, _ count: Int) -> Int {
    if index1 < 0 || index2 < 0 {
        return count
    }
    
    let indx1 = str1.index(str1.startIndex, offsetBy: index1)
    let indx2 = str2.index(str2.startIndex, offsetBy: index2)
    
    var currentCount = count
    if str1[indx1] == str2[indx2] {
        currentCount = LCSSubseqeunce12(str1, str2, index1 - 1, index2 - 1, count + 1)
    }
    
    let left = LCSSubseqeunce12(str1, str2, index1 - 1, index2, 0)
    let right = LCSSubseqeunce12(str1, str2, index1, index2 - 1, 0)
    
    return max(currentCount, left, right)
}

func findLongestCommonSubsq(_ str1: String, _ str2: String) -> Int {
    return LCSSubseqeunce12(str1, str2, str1.count - 1, str2.count - 1, 0)
}

// Example Usage
let str1 = "abcdef"
let str2 = "zbcdf"
let LCSseq2 = findLongestCommonSubsq(str1, str2)
print("Length of Longest Common Substring: \(LCSseq2)")


//Longest Palindromic subsequence


func longestSubSequence1(_ str1: String, _ str2: String) -> (Int, String) {
    
    let n = str1.count
    let m = str2.count
    
    var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
    
   
    for i in 1...n {
        for j in 1...m {
            var indx1 = str1.index(str1.startIndex, offsetBy: i - 1)
            var indx2 = str2.index(str2.startIndex, offsetBy: j - 1)
            if str1[indx1] == str2[indx2] {
                dp[i][j] = 1 + dp[i - 1][j - 1]
                
            } else
                {
                    // If characters don't match, take the max of left or top cell
                    dp[i][j] = max(dp[i - 1][j], dp[i][j - 1])
                }
            }

        }
    
    var lps = ""
    var i = n
    var j = m
    
    while i > 0 && j > 0 {
        var indx1 = str1.index(str1.startIndex, offsetBy: i - 1)
        var indx2 = str2.index(str2.startIndex, offsetBy: j - 1)
        
        if str1[indx1] == str2[indx2] {
            lps.insert(str1[indx1], at: str1.startIndex)
            i -= 1
            j -= 1
        }else if dp[i - 1][j] >= dp[i][j - 1]{
         i -= 1
        } else {
            j -= 1
        }
        
        
    }
    
    
    return (dp[n][m], lps)

    }
    

func longestSubsequencePalindrome(_ str1: String) -> String {
    
    let str2 = String(str1.reversed())
        
        // Get both length and the actual string of LPS
        let (_, lps) = longestSubSequence1(str1, str2)
        return lps
}

let plaindrome = "BBABCBCAB"
let lps = longestSubsequencePalindrome(plaindrome)
print("The longest palindromic subsequence is: \(lps)")
//The longest palindromic subsequence is: BABCBAB




class Solution {
    func longestPalindromeSubseq(_ s: String) -> Int {
        let s2 = String(s.reversed())
        return lcs(s, s2)
    }

    func lcs(_ str1: String, _ str2: String) -> Int {
        let n = str1.count
        let m = str2.count

        // Use two rows for space optimization
        var prev = Array(repeating: 0, count: m + 1)
        var curr = Array(repeating: 0, count: m + 1)

        for i in 1...n {
            for j in 1...m {
                let indx1 = str1.index(str1.startIndex, offsetBy: i - 1)
                let indx2 = str2.index(str2.startIndex, offsetBy: j - 1)

                if str1[indx1] == str2[indx2] {
                    curr[j] = 1 + prev[j - 1]
                } else {
                    curr[j] = max(prev[j], curr[j - 1])
                }
            }
            // Update previous row
            prev = curr
        }
        return curr[m]
    }
}


// LCS(longest common subsequence using space optimization and converting it to the array)


func lcsUsingSpaceOptimization(_ s1: String, _ s2: String) -> Int {
    var char1 = Array(s1)
    var char2 = Array(s2)
    
    var n = char1.count
    var m = char2.count
    
    // Create two arrays to store the previous and current rows of the DP table
    
    var prev = Array(repeating: 0, count: m + 1)
    var curr = Array(repeating: 0, count: n + 1)
    
    for i in 1...n {
        for j in 1...m {
            
            if char1[i - 1] == char2[j - 1] {
                
                curr[j] = 1 + prev[j - 1]
            } else {
                
                curr[j] = max(prev[j], curr[j - 1])
                
            }
            
            prev = curr
            
        }
    }

    return prev[m]
    
}

lcsUsingSpaceOptimization("abc", "acb")
// o/p = 2


// tc is 0(n *m)
func longestSubsequencePalindromeUsingSpace(_ str1: String) -> Int {
    var str2 = String(str1.reversed())
    
    var char1 = Array(str1)
    var char2 = Array(str2)
    
    var n = char1.count
    var m = char2.count
    
    
    var prev = Array(repeating: 0, count: m + 1)
    var curr = Array(repeating: 0, count: m + 1)
    
    for i in 1...n {
        for j in 1...m {
            
            if char1[i - 1] == char2[j - 1] {
                
                curr[j] = 1 + prev[j - 1]
                
            } else {
                
                curr[j] = max(prev[j], curr[j - 1])
                
            }
            
        }
        prev = curr

    }
    
    
    return prev[m]
    
    
    
}


longestSubsequencePalindromeUsingSpace("bbbab")
// o/p = 4



// longest substring

func longestSubStrings(_ str1: String, _ str2: String) -> Int {
    
    var n = str1.count
    var m = str2.count
    
    var dp = Array(repeating: Array(repeating: 0, count: m + 1), count: n + 1)
    var ans = 0
    
    
    for i in 1...n {
        for j in 1...m {
            
            var iIndex = str1.index(str1.startIndex, offsetBy: i - 1)
            var jIndex = str2.index(str2.startIndex, offsetBy: j - 1)

            
            if str1[iIndex] == str2[jIndex] {
                dp[i][j] = 1 + dp[i - 1][j - 1]
                ans = max(ans, dp[i][j])
                
            } else {
                
                dp[i][j] = 0
            }
            
        }
        
    }
    
    return ans
    
}

longestSubStrings("ABCDGH", "AEDFHR")


func longestSubStringsUsingSpaceItimization(_ str1: String, _ str2: String) -> Int {
    
    
    var char1 = Array(str1)
    var char2 = Array(str2)
    
    var n = char1.count
    var m = char2.count
    
    var prev = Array(repeating: 0, count: m + 1)
    var curr = Array(repeating: 0, count: m + 1)
    var ans = 0
    
    for i in 1...n {
        
        for j in 1...m {
            
            if char1[i - 1] == char2[j - 1] {
                
                curr[j] = 1 + prev[j - 1]
                ans = max(curr[j], ans)
            } else {
                
                curr[j] = 0
            }
            
            
        }
        
        prev = curr
    }
    
    return ans
    
}
    
longestSubStringsUsingSpaceItimization("ABCDGH", "AEDFHR")


// longest plaindromic substring return string

func longestPalindromicSubstringUsingDP(_ str1: String) -> String {
    let n = str1.count
    let charArray = Array(str1)

    // DP table to store palindrome status
    var dp = Array(repeating: Array(repeating: false, count: n), count: n)

    var start = 0
    var maxLength = 1

    // Every single character is a palindrome
    for i in 0..<n {
        dp[i][i] = true
    }

    // Check for substrings of length 2
    for i in 0..<n-1 {
        if charArray[i] == charArray[i+1] {
            dp[i][i+1] = true
            start = i
            maxLength = 2
        }
    }

    // Check for substrings of length 3 or more
    for length in 3...n {
        for i in 0...(n-length) {
            let j = i + length - 1
            if charArray[i] == charArray[j] && dp[i+1][j-1] {
                dp[i][j] = true
                start = i
                maxLength = length
            }
        }
    }

    return String(charArray[start..<start + maxLength])
}

longestPalindromicSubstringUsingDP("babad")


//Minimum Insertions to Make String Palindrome
//tc is 0(n2)
//sc is 0(n)

func minimumInsertion(_ str1: String) -> Int {
    
    let lcp = longestCommonPlaindromeforMinInsertion(str1)
    let n = str1.count
    
    return n - lcp
    
    
}

func longestCommonPlaindromeforMinInsertion(_ str1: String) -> Int {
    
    var str2 = String(str1.reversed())
    var char1 = Array(str1)
    var char2 = Array(str2)
    var n = char1.count
    var m = char2.count
    
    var prev = Array(repeating: 0, count: m + 1)
    var curr = Array(repeating: 0, count: m + 1)
    
    for i in 1...n {
        for j in 1...m {
            
            if char1[i - 1] == char2[j - 1] {
                
                curr[j] = 1 + prev[j - 1]
                
            } else {
                
                curr[j] = max(prev[j], curr[j - 1])
                
            }
            
        }
        prev = curr

    }
    
    return prev[m]
}

minimumInsertion("zzazz")


// Longest Increasing Subsequence
//Given an integer array nums, return the length of the longest strictly increasing
//subsequence
//Input: nums = [10,9,2,5,3,7,101,18]
//Output: 4
//Explanation: The longest increasing subsequence is [2,3,7,101], therefore the length is 4.


func longestIncreasingSubsequence(_ array: [Int], _ index: Int, _ prevIndex: Int) -> Int {
 
 var longest = 0
 
 if index == array.count {
     return 0
 }
 
 
  longest =  0 + longestIncreasingSubsequence(array, index + 1, prevIndex)
 
 
 if prevIndex == -1 || array[index] > array[prevIndex] {
      longest = max(longest, 1 + longestIncreasingSubsequence(array, index + 1, index))
 }
 
 
 return longest
}

//longestIncreasingSubsequence([10,9,2,5,3,7,101,18], 0, -1)
// lenght = 4
//longestIncreasingSubsequence([7,7,7,7,7,7,7], 0, -1)
//1
longestIncreasingSubsequence([0,1,0,3,2,3], 0, -1)


//TC 0(n^2) and sc 0(n^2)
func longestIncreasingSubsequenceUsingMemo (_ array: [Int], _ index: Int, _ prevIndex: Int, _ memo: inout [[Int]]) -> Int {
 
 var longest = 0
 
 if index == array.count {
     return 0
 }
 
 if memo[index][prevIndex + 1] != -1 {
     return memo[index][prevIndex + 1]
 }
  longest =  0 + longestIncreasingSubsequenceUsingMemo(array, index + 1, prevIndex, &memo)
 
 
 if prevIndex == -1 || array[index] > array[prevIndex] {
      longest = max(longest, 1 + longestIncreasingSubsequenceUsingMemo(array, index + 1, index, &memo))
 }
 memo[index][prevIndex + 1] = longest
 
 return longest
}

func longestIncreasingSubsequence1(_ array: [Int]) -> Int {
 let n = array.count
 var memo = Array(repeating: Array(repeating: -1, count: n + 1), count: n)
 return longestIncreasingSubsequenceUsingMemo(array, 0, -1, &memo)
}

longestIncreasingSubsequence1([0,1,0,3,2,3])


// knapsack using recursive


func knapRecusrive(_ values: [Int],_ weights: [Int], _ capacity: Int, _ n: Int) -> Int {
    
    if n == 0 || capacity == 0 {
        return 0
    }
    
    if weights[n - 1] <= capacity {
        
        return max(values[n - 1] + knapRecusrive(values, weights, capacity - weights[n - 1], n - 1), knapRecusrive(values, weights, capacity, n - 1))
    } else {
        return knapRecusrive(values, weights, capacity, n - 1)
    }
    
}

var weights = [1,2,3]
knapRecusrive([1, 4, 5], weights, 5, weights.count)


//KnapSack using memo
func knapsackusingMemo(_ values: [Int], _ weights: [Int], _ capacity: Int, n: Int) -> Int {
    
    var memo = Array(repeating: Array(repeating: -1, count: capacity + 1), count: n + 1)
    
    if n == 0 || capacity == 0 {
     return 0
    }
    if memo[n][capacity] != -1 {
        return memo[n][capacity]
    }
    
    if weights[n - 1] <= capacity {
        memo[n][capacity] = max(values[n - 1] + knapsackusingMemo(values, weights, capacity - weights[n - 1], n: n - 1), knapsackusingMemo(values, weights, capacity, n: n - 1))
    } else {
        memo[n][capacity] = knapsackusingMemo(values, weights, capacity, n: n - 1)
    }
    
    return memo[n][capacity]
    
}

var weights1 = [1,2,3]
knapsackusingMemo([1, 4, 5], weights, 5, n: weights.count)


func knapsackUsingTabulation(_ values: [Int], _ weights: [Int], _ capacity: Int) -> Int {
    var n = weights.count
   var dp = Array(repeating: Array(repeating: 0, count: capacity + 1), count: n + 1)
    
    for i in 0...n {
        for j in 0...capacity {
            
            if i == 0 || j == 0 {
                dp[i][j] = 0
            }
            
            
        }
    }
    
    for i in 1...n  {
        for j in 1...capacity  {
            
            if weights[i - 1] <= j {
                
                dp[i][j] = max(values[i - 1] + dp[i - 1][j - weights[i - 1]], dp[i - 1][j])
            } else {
                dp[i][j] = dp[i - 1][j]
            }
            
        }
    }
    
    return dp[n][capacity]
}

var weights2 = [1,2,3]
knapsackUsingTabulation([1, 4, 5], weights2, 5)
