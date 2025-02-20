
import Foundation


//Trees

//types of BT

// 1. full binaryTree: Node has zero or 2 children
//2. complete BT: all levels are completly filled except the last level
//3. perfect BT: all nodes are the same level
//4. Balanced BT: height of tree at a max of log(n)
//5. Degenerate tree or skewedTree(every node has a single child)

// Traversal techinques BFS/ DFS(Inorder, preOrder, postOrder)


// represntation of trees

class Node {
    var value: Int
    var right: Node?
    var left: Node?
    
    init(value: Int, left: Node? = nil, right: Node? = nil) {
        self.value = value
        self.left = left
        self.right = right
    }
    
    

}



// TC 0(n) and sc 0(n) // preoder Traversal
func preOrder(node: Node?) {
    if node == nil {
        return
    }
    
    print(node?.value)
    preOrder(node: node?.left)
    preOrder(node: node?.right)
    
}

// InOrder traversal
func inOder(node: Node?) {
    if node == nil {
        return
    }
    
    inOder(node: node?.left)
    print(node?.value)
    inOder(node: node?.right)
}

//post traversal
func postOrder(node: Node?) {
    
    if node == nil {
        return
    }
    
    postOrder(node: node?.left)
    postOrder(node: node?.right)
    print(node?.value)
}

// Level Order Traversal TC is 0(n) and SC 0(n)
func LevelOrderTraversal(root: Node?) -> [Int] {
    guard let root = root else { return [] }
    var queque = [Node]()
    var result = [Int]()
    
    queque.append(root)
    
    while !queque.isEmpty {
        var node = queque.removeFirst()
        result.append(node.value)
        
        if let leftChild = node.left {
            queque.append(leftChild)
        }
        
        if let rightChild = node.right {
            queque.append(rightChild)
        }
        
        
    }
    return result
    
}


// preoder traversal using stack and array tc is 0(n) and sc is 0(n)

func preOrder(root: Node?) -> [Int] {
    guard let root = root else { return [] }

    var stack = [Node]()
    var result = [Int]()
    
    stack.append(root)
    
    while !stack.isEmpty {
        let node = stack.removeLast() //
        result.append(node.value)
        
        // Push right child first, then left child
        if let rightChild = node.right {
            stack.append(rightChild)
        }
        if let leftChild = node.left {
            stack.append(leftChild)
        }
    }
    
    return result
}

let root = Node(value: 1)
root.left = Node(value: 2)
root.right = Node(value: 3)
root.left?.left = Node(value: 4)
root.left?.right = Node(value: 5)
root.right?.right = Node(value: 6)

LevelOrderTraversal(root: root)
preOrder(node: root)
//print(preOrder(root: root))
//// Expected Output: [1, 2, 4, 5, 3, 6]


// height of a BT or Maximum Depth of a BT
// TC is 0(N)
// SC
//O(N) in the worst case (when the tree is skewed).
//O(log N) in the best case (for a balanced tree).

func MaxDepth(root: Node?) -> Int {
    guard let root = root else {
        return 0
    }
    
    let leftDepth = MaxDepth(root: root.left)
    let rightDepth = MaxDepth(root: root.right)
    
    
    return 1 + max(leftDepth, rightDepth)
}

print(MaxDepth(root: root))
//output is 3


//check is tree is balanced. tree is balanced if left height and right height is less than or equal to 1
//TC is 0(n) and sc is 0(n) for a skewed
    
func checkTreeIsBalanced(root: Node?) -> Bool {
    
    func height(root: Node?) -> Int {
        guard let root = root else {
            return 0
        }
        
        let leftHeight = height(root: root.left)
        let rightHeight = height(root: root.right)
        
        if leftHeight == -1 || rightHeight == -1 {
            return -1
        }
        
        if abs(leftHeight - rightHeight) > 1 {
            return -1
        }
        
        return 1 + max(rightHeight, leftHeight)
    }
   return height(root: root) != -1
    
}


checkTreeIsBalanced(root: root)



// Diameter of Tree

func diameterOfTree(root: Node?) -> Int {
    var diameter = 0
    height(root: root)
    return diameter
    
    func height(root: Node?) -> Int {
        guard let root = root else {
            return 0
        }
        let leftHeight = height(root: root.left)
        let rightHeight = height(root: root.right)
        
        diameter = max(diameter, leftHeight + rightHeight)
        return 1 + max(leftHeight, rightHeight)
    }
}

diameterOfTree(root: root)


// InvertBinarytree

func invertTree(root: Node?) -> Node? {
    guard let root = root else {
        return nil
    }
    
    (root.left, root.right) = (root.right, root.left)
    invertTree(root: root.left)
    invertTree(root: root.right)
    return root
    
}

invertTree(root: root)

// check is tree are identical
// tc 0(n) and sc 0(N)

func sameTree(_ p: Node?, _ q: Node?) -> Bool {
    
    if p == nil && q == nil {
        return true
    }
    
    if p == nil || q == nil {
        return false
    }
    
    return (p?.value == q?.value) && sameTree(p?.left, q?.left) && sameTree(p?.right, q?.right)
    
}

sameTree(root, root)


// SubTree of another tree
//TC  is 0(n *m ) and SC is best case 0(logn) and worst for skewed 0(n)

func isSubTree(root: Node?, subRoot: Node?) -> Bool {
    
    if root == nil { return false }
    
    if isSameTree(root, subRoot) {
    return true
    }
    return isSubTree(root: root?.left, subRoot: subRoot) || isSubTree(root: root?.right, subRoot: subRoot)
    
    func isSameTree(_ p: Node?, _ q: Node?) -> Bool {
        
        if p == nil && q == nil {
            return true
        }
        
        if p == nil || q == nil {
            return false
        }
        
        return (p?.value == q?.value) && isSameTree(p?.left, q?.left) && isSameTree(p?.right , q?.right)
        
        
    }
    
    
    
}

isSubTree(root: root, subRoot: root)
