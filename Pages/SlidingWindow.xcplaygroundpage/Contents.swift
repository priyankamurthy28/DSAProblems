//: [Previous](@previous)

import Foundation


func longestSubstringWithoutRepeating(_ s: String) -> Int {
    var seen = Set<Character>() // Tracks unique characters in the current window
    var maxLength = 0
    var left = 0 // Start of the sliding window
    let charArray = Array(s) // Convert string to array of characters for indexing

    for right in 0..<charArray.count {
        while seen.contains(charArray[right]) {
            // Remove the leftmost character until there's no duplicate
            seen.remove(charArray[left])
            left += 1
        }

        // Add the current character to the set
        seen.insert(charArray[right])

        // Update the maximum length
        maxLength = max(maxLength, right - left + 1)
    }

    return maxLength
}


longestSubstringWithoutRepeating("abcabcbb")
//Input: s = "abcabcbb"
//Output: 3
//Explanation: The answer is "abc", with the length of 3.






func longestSubstringWithoutRepeatingBrute(_ s: String) -> Int {
    
    var seen = Set<Character>()
    var maxLenght = 0
    var char = Array(s)
    
    for i in 0..<char.count {
        
        for j in i..<char.count {
            
            if seen.contains(char[j]) {
                break
            }
            
            seen.insert(char[j])
            let lenght = j - i + 1
            maxLenght = max(lenght, maxLenght)
            
            
            
        }
        
    }
    
    
    
   return maxLenght
    
    
}

longestSubstringWithoutRepeatingBrute("abcabcbb")



    //best time to buy and sell
func maxProfit(_ prices: [Int]) -> Int {
    
    var maxProfit = 0
    
    var left = 0
    var right = 1
    
    while(right < prices.count) {
        
        if prices[left] < prices[right] {
            var profit = prices[right] - prices[left]
          maxProfit =  max(profit, maxProfit)
            
            
        } else {
            left = right
        }
        
        right += 1
        
    }
    
    return maxProfit
    
}



//Input: prices = [7,1,5,3,6,4]
//Output: 5
//Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
maxProfit([10,1,5,6,7,1])



func characterReplacementBruteForce(_ s: String, _ k: Int) -> Int {
    let charArray = Array(s)
    let n = charArray.count
    var maxLength = 0

    for i in 0..<n {
        var charCount = [Character: Int]() // Dictionary to track frequency of characters
        var maxFreq = 0

        for j in i..<n {
            // Increment the count of the current character
            charCount[charArray[j], default: 0] += 1
            // Track the maximum frequency of any character in the current substring
            maxFreq = max(maxFreq, charCount[charArray[j]]!)

            // Calculate the number of replacements needed
            let replacementsNeeded = (j - i + 1) - maxFreq

            // If replacements are within the limit, update maxLength
            if replacementsNeeded <= k {
                maxLength = max(maxLength, j - i + 1)
            } else {
                break
            }
        }
    }

    return maxLength
}


func characterReplacement(_ s: String, _ k: Int) -> Int {
    let charArray = Array(s)
    var maxLength = 0
    var left = 0
    var charCount = [Character: Int]()
    var maxFreq = 0

    for right in 0..<charArray.count {
        // Update the frequency of the current character
        let char = charArray[right]
        charCount[char, default: 0] += 1

        // Track the maximum frequency of any character in the current window
        maxFreq = max(maxFreq, charCount[char]!)

        // Calculate the number of replacements needed
        let windowLength = right - left + 1
        let replacementsNeeded = windowLength - maxFreq

        // If replacements exceed `k`, shrink the window
        if replacementsNeeded > k {
            let leftChar = charArray[left]
            charCount[leftChar]! -= 1
            left += 1
        }

        // Update the maximum length of the valid window
        maxLength = max(maxLength, right - left + 1)
    }

    return maxLength
}
