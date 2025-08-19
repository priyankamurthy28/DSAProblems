//: [Previous](@previous)

import Foundation


//Given an integer array nums, return true if any value appears more than once in the array, otherwise return false.
//Input: nums = [1, 2, 3, 3]
//
//Output: true


func duplicateFind(inputArray: [Int]) -> Bool {
    var dictCount = [Int:Bool]()
    
    for num in inputArray {
        
        if dictCount[num] == nil {
            dictCount[num] = false
        } else {
            return true
        }
    }
    
    return false
    
}

duplicateFind(inputArray: [1,2,4,3,2])

func findTheDuplicateNumber(inputArray: [Int]) -> [Int] {
    var dictCount = [Int : Int]()
    var result = [Int]()
    for num in inputArray {
        if dictCount[num] == nil {
            dictCount[num] = 1
        } else {
            dictCount[num, default: 0] += 1
                   
        }
    }
    
    for (num, key) in dictCount {
        print(num)
        print(key)
        print(dictCount[num])
        if dictCount[num] == 1 {
            result.append(num)
        }
    }
    
    return result.sorted()
    
}

findTheDuplicateNumber(inputArray: [1,2,4,3,3,1,5,6])



// Valid Anagram

//Given two strings s and t, return true if the two strings are anagrams of each other, otherwise return false.

func isValidAnagram(str1: String, str2: String) -> Bool {
    
    var str1Count = [Character:Int]()
    var str2Count = [Character: Int]()
    
    
    for character in str1 {
        if str1Count[character] == nil {
            str1Count[character] = 1
        } else {
            str1Count[character, default: 0] += 1
        }
    }
    
    for character in str2 {
        if str2Count[character] == nil {
            str2Count[character] = 1
        } else {
            str2Count[character, default: 0] += 1
        }
        
    }
    
    return str1Count == str2Count
    
    
}

//str1Count = ["r":3, "a":2, c:2, "e: 1)
//str2Count = ["r":3, "a":2, c:2, "e: 1)
isValidAnagram(str1: "racecar", str2: "carrace")



func twoSum(inputArray: [Int], k: Int) -> (Int, Int)? {
    
    var left = 0
    var right = inputArray.count - 1
   
    while(left < right) {
        if inputArray[left] + inputArray[right] ==  k {
            print("left:\(left)", "right:\(right)")
            return (left, right)
        } else if inputArray[left] + inputArray[right] >  k {
            
            right -= 1
        } else {
            left += 1
        }
    }
    
    return nil
}

func twoSum1(_ nums: [Int], _ target: Int) -> [Int]? {
        var prevMap = [Int: Int]()  // value -> index

    for (index, num) in nums.enumerated() {
        
        var diff = target - num
        
        if let index1 = prevMap[diff] {
            print("i:\(index)", "index1:\(index1)")
            return [index1, index]
        }
        
        
        prevMap[num] = index
    }
    return nil
    }
twoSum(inputArray: [2,5,7,6,4], k: 9)

twoSum1([2,7,5,6], 9)




func FrequencyofRepatedCharcatersInArray(inputArray: [String]) -> [Character]? {
    
    var str1 = inputArray[0]
    var str2 = inputArray[1]
    var str3 = inputArray[2]
    
    var dict1 = [Character: Int]()
    var dict2 = [Character: Int]()
    var dict3 = [Character: Int]()

    var resultArray = [Character]()
    
    
    for char in str1 {
        
        if dict1[char] == nil {
            dict1[char] = 1
        }else {
                dict1[char, default: 0] += 1
            }
            
        }
    for char in str2 {
        if dict2[char] == nil {
         dict2[char] = 1
            
        }
        else {
       dict2[char,default: 0] += 1
        }
    }
    for char in str3 {
        if dict3[char] == nil {
            dict3[char] = 1
        } else {
            dict3[char, default: 0] += 1
        }
        
    }
    
    print("dict keys, \(dict1.keys)")
    for char in dict1.keys {
        
        if dict2[char] != nil && dict3[char] != nil {
             resultArray.append[char]
        }
        
    }
    return resultArray
}


FrequencyofRepatedCharcatersInArray(inputArray: ["man", "movea", "morea"])


func groupAnagrams(_ inputString: [String]) -> [[String]] {
    var resultAnagrams = [String: [String]]()
    
    
    for str in inputString {
        var count = [Int](repeating: 0, count: 26)
        
        for char in str {
            
            let index = Int(char.asciiValue! - Character("a").asciiValue!)
            count[index] += 1
        }
        
        var key = count.map{String($0)}.joined(separator: "")
        
        if resultAnagrams[key] == nil {
            resultAnagrams[key] = [str]
        } else {
            resultAnagrams[key]?.append(str)
        }
        
        
    }
    
    return Array(resultAnagrams.values)
    
        
  }

groupAnagrams(["eat", "tea", "tan", "ate", "nat", "bat"])





    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var count = [Int: Int]()
        
        // Count frequencies of each number
        for num in nums {
            count[num, default: 0] += 1
        }

        // Create a min-heap (priority queue) based on frequency
        var heap: [(Int, Int)] = []

        for (num, frequency) in count {
            heap.append((frequency, num))
            // Ensure the heap does not grow beyond 'k' elements
            if heap.count > k {
                heap.sort { $0.0 < $1.0 } // Sort by frequency (min-heap behavior)
                heap.removeFirst() // Remove the element with the smallest frequency
            }
        }

        // Extract the top k frequent elements
        return heap.sorted { $0.0 > $1.0 }.map { $0.1 }
    }







//(4: 3, 6: 2, 5:2,2:1, 1:1)
topKFrequent([1,2,4,4,5,6,6,4,5], 3)

//ouptu = [4,,6,5]
 

func findThirdLargestElementInArray(_ inputArray: [Int], K: Int) -> Int? {
    
    var heap = [Int]()
    
    for num in  inputArray { // 100, 99
        heap.append(num)    //100,99
        heap.sort()
        
        if heap.count > K {
            heap.removeLast()
        }
        
    }
return heap.last
}

findThirdLargestElementInArray([100,99,97,4,3], K: 3)





func findTheSecondSmallestElementInAnArray(_ inputArray: [Int], k: Int) -> Int {
    
    var heap = [Int]()
    
    for num in inputArray {
        heap.append(num)
        heap.sort(by: >)
        
        if heap.count > k {
            heap.removeFirst()
        }
        
    }
    return heap.first ?? -1
    
    
}

findTheSecondSmallestElementInAnArray([100,99,97,4,3], k: 2)



func topKFrequency(_ InputArray: [Int]) -> [Int] {
    
    var dict = [Int: Int]()
    var k = 2
    for num in InputArray {
        
        if dict[num] == nil {
            dict[num] = 1
        } else {
            dict[num, default: 0] += 1
        }
    }
    
    var heap = [(Int, Int)]()
    for(num, frequency) in dict {
        heap.append((frequency, num))
        
        if heap.count > k {
            heap.sort {$0.0 < $1.0}
            heap.removeFirst()
            
        }
        
        
    }
    
    return heap.sorted {$0.0 > $1.0}.map { $0.1}
    
    
    
}

topKFrequency([2,5,5,6,6,7,7,8])


let array = [1, 2, 3, 4, 5]

// Generate all prefixes
var prefixes = [[Int]]()
for i in 1...array.count {
    print(Array(array.prefix(i)))
    let prefix = Array(array.prefix(i))
    
    prefixes.append(prefix)
}
print(prefixes)


func productsExceptSelf(_ array: [Int]) -> [Int] {
    
    var prefix = 1
    var result = Array(repeating: 1, count: array.count)

    for i in 0..<array.count {
        
        result[i] = prefix
        
        prefix *= array[i]
    }
   
    var suffix = 1
    
    for i in (0..<array.count).reversed() {
        
        result[i] *= suffix
        
        suffix *= array[i]
    }
    print(result)
    return result
}

//Input: nums = [1,2,3,4]
//Output: [24,12,8,6]


// using brute force n2

func longestConsecutiveSequence(_ nums: [Int]) -> Int {
    var longest = 0
    
    for num in  nums {
        
        if !nums.contains(num - 1) {
            var currentElement = num
            var count = 1
            
            while(nums.contains(currentElement + 1)) {
                currentElement += 1
                count += 1

            }
            
        longest = max(longest, count)
        }
        
        
        
    }
    
    
    return longest
    
    
}

longestConsecutiveSequence( [200,2,4,3,1,100])


// using sort tc nlogn

func longestConsecutiveSequenceUsingSort(_ nums: [Int]) -> Int {
    
    
    var sortedArray = nums.sorted()
    var count = 1
    var longest = 1
    
    for i  in 1..<sortedArray.count {
        
        if sortedArray[i] != sortedArray[i - 1] {
            
            if sortedArray[i] == sortedArray[i - 1] + 1 {
                count += 1
                
            } else {
                longest = max(longest, count)
                count = 1
                           
            }
            
        }
        
        
        
    }
    
    
    
    return longest
    
}

longestConsecutiveSequenceUsingSort([100,200,4,5,3,2,1,6])



// longestConsecutiveSequenceUsingSET 0(n)

func longestConsecutiveSequenceUsingSET(_ nums: [Int]) -> Int {
    
    var numSet = Set(nums)
    var longest = 0
    
    for num in numSet {
        
        if !numSet.contains(num - 1) {
            var count = 1
            var currentElement = num
            
            
            while(numSet.contains(currentElement + 1)) {
                currentElement += 1
                count += 1
            }
            
            longest = max(longest, count)
        }
        
    }
    
    return longest
    
    
    
}

longestConsecutiveSequenceUsingSET([100,200,4,5,3,2,1,6])

