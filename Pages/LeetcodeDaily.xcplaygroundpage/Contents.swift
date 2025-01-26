//: [Previous](@previous)

import Foundation


// word subsets
//You are given two string arrays words1 and words2.
//
//A string b is a subset of string a if every letter in b occurs in a including multiplicity.
//
//For example, "wrr" is a subset of "warrior" but is not a subset of "world".
//A string a from words1 is universal if for every string b in words2, b is a subset of a.
//
//Return an array of all the universal strings in words1. You may return the answer in any order.

 

func wordSubsets(_ words1: [String], _ words2: [String]) -> [String] {
    
    var dict1 = [Character: Int]()
    var dict2 = [Character: Int]()
    var maxFrequency = [Character: Int]()
    var result = [String]()
    
    func findfrequency(_ word: String) -> [Character: Int] {
        var frequency = [Character: Int]()
        for char in word {
            if frequency[char] == nil {
                frequency[char] = 1
            } else {
                frequency[char, default: 0] += 1
            }
            
        }
        
        return frequency
    }
    
    for word in words2 {
        
        dict2 = findfrequency(word)
        
        for(char, count) in dict2 {
            
            maxFrequency[char] = max(maxFrequency[char, default: 0], count)
        }
        
        
    }
    
    for word in words1 {
        var isUniversal = true
        dict1 = findfrequency(word)
        for(char, count) in maxFrequency {
            
            if dict1[char, default: 0] < count {
                isUniversal = false
                break
            }
            
        }
        if isUniversal {
            result.append(word)
        }
        
    }
    
    return result
    
}

var words1 = ["amazon","apple","facebook","google","leetcode"]
var words2 = ["l","e"]
//Output: ["apple","google","leetcode"]
//var words1 = ["amazon","apple","facebook","google","leetcode"]
//var words2 = ["e","o"]
wordSubsets(words1 , words2)


// Construct K Palindrome Strings
//Given a string s and an integer k, return true if you can use all the characters in s to construct k palindrome strings or false otherwise.

func canConstruct(_ str: String, _ k: Int) -> Bool {
    
    var count = [Character: Int]()
    var oddCount = 0
    
    for char in str {
        if count[char] == nil {
            count[char] = 1
        } else {
            count[char, default: 0] += 1
        }
    }
    for values in count.values {
        
        if values % 2 != 0 {
            oddCount += 1
        }
        
    }
    
    return oddCount <= k && k <= str.count
    
}

canConstruct("annabelle", 2)
//leetcode, k 3
//tc//The first loop takes O(n), where n is the length of the string s.
//The second loop runs O(1) because there are at most 26 unique characters in s.
//sc charCount dictionary: It stores counts for up to 26 unique characters, which takes constant space, O(1).
// a = 2, n = 2, b = 1, e= 2, l= 2 == true
//l = 1, e = 2, t= 1,c= 1


//Valid Parnethsis String with Astrk using Recurssion brute force
//tc is 3^n and sc is 0(n)

func isvalidParenthisStringBrute(_ str1: String, _ index: Int, _ count: Int) -> Bool {
    if count < 0 {
        return false
    }
    
    if index == str1.count {
        
        return count == 0
    }
    
    let iIndex = str1.index(str1.startIndex, offsetBy: index)
    if str1[iIndex] == "(" {
      return isvalidParenthisStringBrute(str1, index + 1, count + 1)
    } else if str1[iIndex] == ")" {
        return isvalidParenthisStringBrute(str1, index + 1, count - 1)
    } else {
        return isvalidParenthisStringBrute(str1, index + 1, count + 1) || isvalidParenthisStringBrute(str1, index + 1, count - 1) || isvalidParenthisStringBrute(str1, index + 1, count)
        
    }
}

isvalidParenthisStringBrute("(*((", 0,  0)
//false
isvalidParenthisStringBrute("(*()", 0,  0)
// true


// isValidParenthisis using linear usin min and max and timeComplxity 0(n) and sc 0(1)


func isValidParenthis(_ str1: String) -> Bool {
    var min = 0
    var max = 0
    
    for i in 0..<str1.count {
        let iIndex = str1.index(str1.startIndex, offsetBy: i)
        
        if str1[iIndex] == "(" {
            min = min + 1
            max = max + 1
            
        } else if str1[iIndex] == ")" {
            min = min - 1
            max = max + 1
        } else {
            min = min - 1
            max = max + 1
        }
        if min < 0 {
            min = 0
        }
        if max < 0 {
            return false
        }
        
        
    }
    
    return min == 0
    
    
}

//isValidParenthis("(*()")
//true
isValidParenthis("(*((")


//Check if a Parentheses String Can Be Valid
//A parentheses string is a non-empty string consisting only of '(' and ')'. It is valid if any of the following conditions is true:
//
//It is ().
//It can be written as AB (A concatenated with B), where A and B are valid parentheses strings.
//It can be written as (A), where A is a valid parentheses string.
//You are given a parentheses string s and a string locked, both of length n. locked is a binary string consisting only of '0's and '1's. For each index i of locked,
//
//If locked[i] is '1', you cannot change s[i].
//But if locked[i] is '0', you can change s[i] to either '(' or ')'.
//Return true if you can make s a valid parentheses string. Otherwise, return false.


func canBeValid(_ s: String, _ locked: String) -> Bool {
    var modifiedString = Array(s)
        let lockedArray = Array(locked)
    if s.count == 1 {
        return false
    }
        
        for i in 0..<modifiedString.count {
            if lockedArray[i] == "0" {
                modifiedString[i] = "*" // Replace unlocked character with '*'
            } else {
                modifiedString[i] = s[s.index(s.startIndex, offsetBy: i)]
            }
        }
    
    var modifidString = String(modifiedString)
    var min = 0
    var max = 0
    
    for i in 0..<modifidString.count {
        let iIndex = modifidString.index(modifidString.startIndex, offsetBy: i)
        
        if modifidString[iIndex] == "(" {
            min = min + 1
            max = max + 1
            
        } else if modifidString[iIndex] == ")" {
            min = min - 1
            max = max + 1
        } else {
            min = min - 1
            max = max + 1
        }
        if min < 0 {
            min = 0
        }
        if max < 0 {
            return false
        }
        
        
    }
    
    
    return min == 0
    
    }

canBeValid("))()))", "010100")
// true
//Input: s = ")", locked = "0"


class Solution1 {
    func canBeValid(_ s: String, _ locked: String) -> Bool
    {
        if s.count % 2 != 0 { return false }

        var min = 0
        var max = 0

        for (char, lock) in zip(s, locked)
        {
            if lock == "0"
            {
                if min > 0 { min -= 1 }
                max += 1
            }
            else
            {
                if char == "("
                {
                    min += 1
                    max += 1
                }
                else // ")"
                {
                    if min > 0 { min -= 1 }
                    max -= 1
                    if max < 0 { return false }
                }
            }
        }
        return min == 0
    }
}


//Minimum Length of String After Operations

//You are given a string s.
//
//You can perform the following process on s any number of times:
//
//Choose an index i in the string such that there is at least one character to the left of index i that is equal to s[i], and at least one character to the right that is also equal to s[i].
//Delete the closest character to the left of index i that is equal to s[i].
//Delete the closest character to the right of index i that is equal to s[i].
//Return the minimum length of the final string s that you can achieve.


//Input: s = "abaacbcbb"
//
//Output: 5
//
//Explanation:
//We do the following operations:
//
//Choose index 2, then remove the characters at indices 0 and 3. The resulting string is s = "bacbcbb".
//Choose index 3, then remove the characters at indices 0 and 5. The resulting string is s = "acbcb".


func minimumLength(_ s: String) -> Int {
    var dict = [Character: Int]()
    
    for char in s {
        if dict[char] == nil {
            dict[char] = 1
        } else {
            dict[char, default: 0] += 1
            // dict =[a: 3, b= 4, c=2]
        }
    }
    var count = 0
    var ans = 0
    for (_, value )in dict {
        count = value
        while count >= 3 {
            count -= 2
            
        }
        ans += count
        
    }
    return ans
    }
 
minimumLength("abaacbcbb")



//that, given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.
//
//For example, given A = [1, 3, 6, 4, 1, 2], the function should return 5.
//
//Given A = [1, 2, 3], the function should return 4.
//
//Given A = [−1, −3], the function should return 1.
//
//Write an efficient algorithm for the following assumptions:
//
//N is an integer within the range [1..100,000];
//each element of array A is an integer within the range [−1,000,000..1,000,000].


public func solution(_ inputArray :  inout [Int]) -> Int {
    
  //  [1, 3, 6, 4, 1, 2]
    var currentElement = 0

    
    inputArray.sorted()
    
    //[1,2,3,4,6]
    
    for i in 0..<inputArray.count {
        
        if inputArray[i] < 0 {
            return 1
        }
        
        while(inputArray.contains(currentElement + 1)) {
            currentElement += 1
        }
        
        
    }
     return currentElement + 1

            
        }
    
    var array123 = [-1, -2]

solution(&array123)
    
//Make Lexicographically Smallest Array by Swapping Elements Make Lexicographically Smallest Array by Swapping Elements
//Input: nums = [1,5,3,9,8], limit = 2
//Output: [1,3,5,8,9]
//Explanation: Apply the operation 2 times:
//- Swap nums[1] with nums[2]. The array becomes [1,3,5,9,8]
//- Swap nums[3] with nums[4]. The array becomes [1,3,5,8,9]
//We cannot obtain a lexicographically smaller array by applying any more operations.
//Note that it may be possible to get the same result by doing different operations


//for this problems [1 5 3 9 8] and limit is 2
//first sort the array [1 3 5 8 9] after sorting group the array whoes limit is less than or equal to 2 [[1,3,5][8,9]]
//map the number with index [1: 0, 3:0, 5:0, 8:1,9:1]
// create a result array []
// loop the orginnal array and check the index in map for example [1 5 3 9 8] index for 1 is 0 5 is 0 and 9 is 1 and 8 is 1 and pop the first element based on the index [1 5 3 9 8] [[1,3,5][8,9]]   [1,3,5,8,9]
//tc 0(nlogn) and sc 0(n)
func lexicographicalSmallestArray(_ array: [Int], _ limit: Int) -> [Int] {
    
    var groups = [[Int]]()
    var maps = [Int: Int]()
    var result = [Int]()
    
    for num in array.sorted() {
        
        if groups.isEmpty || abs(num - groups.last!.last!) > limit {
            groups.append([])
        }
        
        groups[groups.count - 1].append(num)
        maps[num] = groups.count - 1
        
    }
    
    for num in array {
        if let index = maps[num] {
            let firstElement = groups[index].removeFirst()
            result.append(firstElement)
            
        }
    }
    
    return result
    
    
}

lexicographicalSmallestArray([1, 5, 3, 9, 8], 2)
