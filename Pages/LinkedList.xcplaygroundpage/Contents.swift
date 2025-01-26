//: [Previous](@previous)

import Foundation


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


import UIKit

class Node {
    var key: Int
    var value: Int
    var prev: Node?
    var next: Node?


    init(_ key: Int, _ value: Int) {
        self.key = key
        self.value = value

    }


}

class LRUCache {

    var capacity: Int
    var cache: [Int: Node]
    var head: Node?
    var tail: Node?


    init(_ capacity: Int) {
        self.capacity = capacity
        self.cache = [:]
        self.head = Node( -1,  -1)
        self.tail = Node( -1,  -1)
        self.head?.next = tail
        self.tail?.prev = head
    }

    func addNode(_ node: Node) {

        var nextNode = head?.next
        head?.next = node
        node.prev = head
        node.next = nextNode
        nextNode?.prev = node

    }

    func removeNode(_ node: Node) {

        let nextNode = node.next
        let prevNode = node.prev

        prevNode?.next = nextNode
        nextNode?.prev = prevNode

    }


    func get(_ key: Int) -> Int {
        guard let node = cache[key] else {
            return -1
        }
        removeNode(node)
        addNode(node)
        return node.value
    }


    func put(_ key: Int, _ value: Int) {

        if let node = cache[key] {
            node.value = value
            removeNode(node)
            addNode(node)

        } else  {
            var newNode = Node(key, value)
            cache[key] = newNode
            addNode(newNode)

        }

        if cache.count > capacity {

            if let lruNode = tail?.prev {
                removeNode(lruNode)
                cache.removeValue(forKey: lruNode.key)


            }

        }


    }

}

let cache = LRUCache(2)

cache.put(1, 1)
cache.put(2, 2)
print(cache.get(1)) // Output: 1
cache.put(3, 3)     // Removes key 2
print(cache.get(2)) // Output: -1
cache.put(4, 4)     // Removes key 1
print(cache.get(1)) // Output: -1
print(cache.get(3)) // Output: 3
print(cache.get(4)) // Output: 4







