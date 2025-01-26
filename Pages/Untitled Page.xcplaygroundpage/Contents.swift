import UIKit

var greeting = "Hello, playground"


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
            return [char]
        }
        
    }
    return nil
}


FrequencyofRepatedCharcatersInArray(inputArray: ["man", "movea", "morea"])


func groupAnagrams(_ inputString: [String]) -> [[String]] {
    var resultAnangrams = [String: [String]]()
    
    
    for str in inputString {
    
        var count = [Int](repeating: 0, count: 26)
        
        for char in str {
            
            let index = Int(char.asciiValue! - Character("a").asciiValue!)
                count[index] += 1
        }
        
        let key = count.map { String($0) }.joined(separator: ",")
        
        if resultAnangrams[key] == nil {
            resultAnangrams[key] = [str]
            
        }
        resultAnangrams[key]?.append(str)
        
        }
        
    return Array(resultAnangrams.values)
        
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


// binary search
//Find Minimum In Rotated Sorted Array


func minimumInARotatedSortedArraybrute(_ nums: [Int]) -> Int {
    
    var mimimumValue = nums[0]
    
    for num in nums {
        
        if num < mimimumValue {
            mimimumValue = num
        }
        
    }
    
    return mimimumValue
    
}


minimumInARotatedSortedArraybrute([4, 5, 6, 7, 0, 1, 2])


// Find Minimum In Rotated Sorted Array using binary search


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


// reverse linked list using a stack


class ListNode: Hashable {
    var val: Int
    var next: ListNode?
    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
    
    func hash(into hasher: inout Hasher) {
           hasher.combine(ObjectIdentifier(self)) // Use the node's memory address
       }
       
       static func == (lhs: ListNode, rhs: ListNode) -> Bool {
           return lhs === rhs // Compare memory addresses
       }
}

//func reverseLinkedListUsingStack(_ head: ListNode?) -> ListNode? {
//    guard let head = head else { return nil } // Handle empty list
//
//    var stack: [ListNode] = []
//    var current: ListNode? = head
//
//    // Push all nodes onto the stack
//    while current != nil {
//        stack.append(current!)
//        current = current?.next
//    }
//
//    // Pop nodes from the stack and rebuild the list
//    let newHead = stack.popLast()
//    var newCurrent = newHead
//
//    while !stack.isEmpty {
//        newCurrent?.next = stack.popLast()
//        newCurrent = newCurrent?.next
//    }
//
//    newCurrent?.next = nil // Set the last node's next to nil
//    return newHead
//}





// Creating a sample linked list: 1 -> 2 -> 3 -> nil



func reverseLinkList(_ head: ListNode?) -> ListNode? {
    var current = head
    var prev: ListNode? = nil

    while current != nil {
        var temp = current?.next
         current?.next = prev
        prev = current
        current = temp



    }
    return prev


}
func printLinkedList(_ head: ListNode?) {
    var current = head
    while let node = current {
        print(node.val, terminator: " -> ")
        current = node.next
    }
    print("nil")
}

let head = ListNode(1)
head.next = ListNode(2)
head.next?.next = ListNode(3)
head.next?.next?.next = ListNode(4)
head.next?.next?.next?.next = ListNode(5)

//print("Original Linked List:")
//printLinkedList(head)
//let reversedLinkList = reverseLinkList(head)
//print("Reversed Linked List:")
//printLinkedList(reversedLinkList)


// linked list cycle detection
// return true is the linked list having loop use tortoise and hare ago(fast movies 2 steps and slow moves one step)
// if slow and fast pointer meets then it is having a loop
// tc nlogn ans space o(n) for naive



func hasCycleUsingNaive(_ head: ListNode?) -> Bool {
    var temp = head
    var seen = Set<ListNode>()

    while temp != nil {
        if seen.contains(temp!) { // Check if the node is already in the set
            return true
        }
        seen.insert(temp!)        // Add the node to the set
        temp = temp?.next         // Move to the next node
    }
    return false // If we exit the loop, no cycle exists
}

hasCycleUsingNaive(head)


// TC 0(n) and space is 0(1)
func hasCycleUsingFastAndSlowPointer(_ head: ListNode?) -> Bool {
    var slow = head
    var fast = head

    while fast != nil && fast?.next != nil {
        slow = slow?.next           // Move `slow` one step
        fast = fast?.next?.next     // Move `fast` two steps

        if slow === fast {          // Check if `slow` and `fast` meet
            return true
        }
    }

    return false // If we exit the loop, no cycle exists
}

hasCycleUsingFastAndSlowPointer(head)



// Remove Node From End of Linked List
//tc 0(n) and space is 0(1)

func removeNthNodeUsingbruteForce(_ head: ListNode?, _ node: Int) -> ListNode? {

    var temp = head
    var count = 0

    while(temp != nil) {

        count += 1
        temp = temp?.next


    }

    if node == count {
        var newHead = head?.next
        return newHead

    }

    var result = count - node
    temp = head
    while(temp != nil ) {

        result -= 1

        if result == 0 {
            break
        }
        temp = temp?.next

    }
    temp?.next = temp?.next?.next
    return head
}


//let removeNthNodeLinkedList = removeNthNodeUsingbruteForce(head, 2)
//print("Reversed Linked List:")
//printLinkedList(removeNthNodeLinkedList)



    //remove Nth Node
    // tc 0(n) and sc 0(1)
    
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {

       var slow = head
       var fast = head

          for i in 0..<n {
           fast = fast?.next
          }

          if fast == nil {
           return head?.next
          }

          while(fast != nil && fast?.next != nil) {
           fast = fast?.next
           slow = slow?.next
          }
          slow?.next = slow?.next?.next
          return head

       }
   
//Time Complexity: O(n)
//
//The list is traversed once with the two pointers.
//Space Complexity: O(1)

//Only pointers are used; no additional space is allocated.
//head = [1, 2, 3, 4, 5], n = 2
//Updated list: [1, 2, 3, 5].
//let removeNthFromEnd1 = removeNthFromEnd(head, 2)
//print("removeNthNodeUsingFastAndSlow:")
//printLinkedList(removeNthFromEnd1)




func reorderList(_ head: ListNode?) -> ListNode? {
    
    var slow = head
    var fast = head
    
    // find the middle Element
    while(fast != nil && fast?.next != nil) {
        
        slow = slow?.next
        fast = fast?.next?.next
        
    }
    
    // reverse the second half
    var prev: ListNode? = nil
    var current = slow?.next
    slow?.next = nil
    while(current != nil) {
        var temp = current?.next
        current?.next = prev
        prev = current
        current = temp
    }
    
    // merge the two list
    
    var first = head
    var second = prev
    while(second != nil) {
        let temp1 = first?.next
        let temp2 = second?.next
        
        first?.next = second
        second?.next = temp1
        
        first = temp1
        second = temp2
    }
    
    return head
    
    
}

//[1, 2, 3, 4, 5]
//[1, 5, 2, 4, 3]

let reorderList1 = reorderList(head)
print("REORDED Linked List:")
printLinkedList(reorderList1)


// combination sum using recursive(pick or not pick) here in this problem we can use array[index] multiple times
// backtracking when combination applu operation on idex

func findCombination(_ index: Int,_ target: Int, _ array: [Int], _ ans: inout [[Int]], _ current: inout [Int]
  ){
    
    if index == array.count {
                if target == 0 {
                    ans.append(current)
                }
                return
            }
            
            // Pick the current element
            if array[index] <= target {
                current.append(array[index])
                findCombination(index, target - array[index], array, &ans, &current)
                current.removeLast() // Backtrack
            }
            
            // Skip the current element
            findCombination(index + 1, target, array, &ans, &current)
        }

func combinationSum(_ array: [Int], _ target: Int) -> [[Int]] {
    
    var ans = [[Int]]()
    var current = [Int]()

    
    findCombination(0, target, array, &ans, &current)
           return ans
    
}

let result1 = combinationSum([2, 3, 6, 7], 7)
print(result1)
// [[2,2,3], [7]]


//Word Search using DFS
//given a 2-D grid of characters board and a string word, return true if the word is present in the grid, otherwise return false.
//
//For the word to be present it must be possible to form it with a path in the board with horizontally or vertically neighboring cells. The same cell may not be used more than once in a word.
//Input:
//board = [
//  ["A","B","C","D"],
//  ["S","A","A","T"],
//  ["A","C","A","E"]
//],
//word = "CAT" output true
 
func wordSearch(board: [[Character]], word: String) -> Bool {
    let rows = board.count
    let cols = board[0].count
    let wordArray = Array(word)
    var board = board // Create a mutable copy of the board

    // Iterate over every cell in the grid
    for row in 0..<rows {
        for col in 0..<cols {
            // Start DFS from the cell if the first character matches
            if dfs(row, col, 0) {
                return true
            }
        }
    }
    
    return false // Return false if no path matches the word

    // DFS helper function
    func dfs(_ row: Int, _ col: Int, _ index: Int) -> Bool {
        // If we've matched all characters in the word
        if index == wordArray.count {
            return true
        }
        
        // Check boundary conditions and character match
        if row < 0 || col < 0 || row >= rows || col >= cols || board[row][col] != wordArray[index] {
            return false
        }
        
        // Temporarily mark the cell as visited
        let temp = board[row][col]
        board[row][col] = "#"
        
        // Explore all 4 possible directions
        let directions = [(0, 1), (1, 0), (0, -1), (-1, 0)]
        for dir in directions {
            let newRow = row + dir.0
            let newCol = col + dir.1
            if dfs(newRow, newCol, index + 1) {
                return true
            }
        }
        
        // Backtrack and restore the cell's original value
        board[row][col] = temp
        return false
    }
}

let board: [[Character]] = [
    ["A", "B", "C", "E"],
    ["S", "F", "C", "S"],
    ["A", "D", "E", "E"]
]
let word = "CAT"

wordSearch(board: board, word: word)


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
