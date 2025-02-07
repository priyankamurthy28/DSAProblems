
import Foundation


//Represtation of graph using Adajacent Matrix space complexity 0(n * n)
//undirectd Graph

func representGraphAdajacentMatrix() {
    var n = 5 // no of nodes
    var m = 6 // no of edges
    var adjMatrix = Array(repeating: Array(repeating: 0, count: n + 1), count: n + 1)
   var edges = [
        (1, 2),
        (1, 3),
        (2, 4),
        (2, 5),
        (3, 4),
        (4, 5)
    ]
    // Populate adjacency matrix with edges
    for (u, v) in edges {
        adjMatrix[u][v] = 1
        adjMatrix[v][u] = 1 // remove this for directed Graph
        
    }
    
    // Output the adjacency matrix (for verification)
    for row in adjMatrix {
        print(row.map {String($0)}.joined(separator: ""))
    }
    
}

representGraphAdajacentMatrix()

// Representation of graph using adjacacent List where space complexity is 0(2E) for undirectedGraph
//1 based array

func representationUsingArray() {
    var n = 5
    var m = 6
    
    var edges = [
         (1, 2),
         (1, 3),
         (2, 4),
         (2, 5),
         (3, 4),
         (4, 5)
     ]
    
    var adjList = Array(repeating: [Int](), count: n + 1)
    // [[], [], [], [], [], []]
    
    for (u, v) in edges {
        
        adjList[u].append(v)
        adjList[v].append(u)
        
       
    }
   // adjList = [[], [2, 3], [1, 4, 5], [1, 4], [2, 3, 5], [2, 4]]

    for (index, value) in adjList.enumerated() {
        // Skip index 0 (1-based indexing)
        if index > 0 {
            print("\(index): \(value)")
        }
        
    }
    
}

representationUsingArray()


// repersentationforDirectusingMatrix

func repgraphUsingMatrixForDirect() {
    var n = 5
    var m = 6
    
    var edges = [
         (1, 2),
         (1, 3),
         (2, 4),
         (2, 5),
         (3, 4),
         (4, 5)
     ]
    
    
    var adjMatrix = Array(repeating: Array(repeating: 0, count:  n + 1), count: n + 1)
    
    for (u, v) in edges {
        adjMatrix[u][v] = 1
        
    }
    
    for row in adjMatrix {
        print(row.map{String($0)}.joined(separator: ""))
    }
    
}
repgraphUsingMatrixForDirect()


//Space complexity is 0(E)
func representGraphUsingListForDirected() {
    var n = 5
    var m = 6
    
    var edges = [
         (1, 2),
         (1, 3),
         (2, 4),
         (2, 5),
         (3, 4),
         (4, 5)
     ]
    
    
    var adjList = Array(repeating: [Int](), count: n + 1)
    
    for (u, v) in edges {
        
        adjList[u].append(v)
    }
    
    for (index, value) in adjList.enumerated() {
        if index > 0 {
            
            print("\(index): \(value)")
        }
        
    }
    
}
representGraphUsingListForDirected()



// Breadth First Search (Level order traversal)
//Problem Statement: Given an undirected graph, return a vector of all nodes by traversing the graph using breadth-first search (BFS).
//
//Pre-req: Graph Representation, Queue STL


//Time Complexity: O(N) + O(2E), Where N = Nodes, 2E is for total degrees as we traverse all adjacent nodes.
//
//Space Complexity: O(3N) ~ O(N), Space for queue data structure visited array and an adjacency list

// represernt graph using adajcent list
// create visitedarray N + 1 and mark 1 as true
// creaate a queque and push the 1 to queue
//create BFS result array and print first element in array
// tranverse all the nodes of the queque element and mark them visited and repeat the process

func bFSMain() {
    var n = 5
    
    var edges = [
         (1, 2),
         (1, 3),
         (2, 4),
         (2, 5),
         (3, 4),
         (4, 5)
     ]
    
    var adjacentList = Array(repeating: [Int](), count: n + 1)
    
    for (u, v) in edges {
        
        adjacentList[u].append(v)
        adjacentList[v].append(u)
    }
    
    BFS(adjacentList, n)
}

func BFS(_ adjacentList: [[Int]], _ V: Int) -> [Int] {
    
    var visitedArray = Array(repeating: false, count: V + 1)
    visitedArray[1] = true
    
    var queue: [Int] = [1]
    var bFSResult = [Int]()
    
    while !queue.isEmpty {
        var node = queue.removeFirst()
        bFSResult.append(node)
        
        for neighbour in adjacentList[node] {
            
            if !visitedArray[neighbour] {
                visitedArray[neighbour] = true
                queue.append(neighbour)
            }
            
            
        }

    }
    
   return bFSResult
}
bFSMain()



//DFS
//TC is  O(N) + O(2E)
//SC is O(3N) ~ O(N)

class Solution {
    // Helper function for DFS
    private func dfs(node: Int, adj: [[Int]], visited: inout [Bool], result: inout [Int]) {
        // Mark the node as visited
        visited[node] = true
        // Add the node to the result
        result.append(node)
        
        // Traverse all its neighbors
        for neighbor in adj[node] {
            if !visited[neighbor] {
                dfs(node: neighbor, adj: adj, visited: &visited, result: &result)
            }
        }
    }
    
    // Function to return a list containing the DFS traversal of the graph
    func dfsOfGraph(_ V: Int, _ adj: [[Int]]) -> [Int] {
        // Initialize the visited array
        var visited = Array(repeating: false, count: V + 1) // Adjust for 1-based indexing
        // List to store the DFS result
        var result: [Int] = []
        
        // Start DFS from node 1
        dfs(node: 1, adj: adj, visited: &visited, result: &result)
        return result
    }
}

// Helper function to add edges to the adjacency list
func addEdge(_ adj: inout [[Int]], _ u: Int, _ v: Int) {
    adj[u].append(v)
    adj[v].append(u) // Remove this line for directed graph
}

// Helper function to print the result
func printResult(_ result: [Int]) {
    for node in result {
        print(node, terminator: " ")
    }
    print()
}

// Main function
func main() {
    let V = 5 // Number of vertices
    var adj: [[Int]] = Array(repeating: [], count: V + 1) // Adjacency list (1-based index)
    
    // Add edges
    addEdge(&adj, 1, 2)
    addEdge(&adj, 2, 4)
    addEdge(&adj, 1, 3)
    addEdge(&adj, 1, 5)
    
    let solution = Solution()
    let dfsResult = solution.dfsOfGraph(V, adj)
    
    // Print the DFS result
    printResult(dfsResult)
}

main()


func numberOfIslands(grid: [[Character]]) -> Int {
    
    
    var mutableGrid = grid
    let rows = mutableGrid.count
    let cols = mutableGrid[0].count
    var isIsland = 0
    
    for row in 0..<rows {
        for col in 0..<cols {
            if mutableGrid[row][col] == "1" {
                isIsland += 1
                dfs(row, col)
            }
                
    }
}
    func dfs( _ row: Int, _ col: Int ) {
        if row < 0 || col < 0 || row >= rows || col >= cols || mutableGrid[row][col] == "0" {
         return
        }
        
        mutableGrid[row][col] = "0"
        dfs(row - 1, col)
        dfs(row + 1, col)
        dfs(row, col + 1)
        dfs(row, col - 1)
    }
    
    return isIsland
}


numberOfIslands(grid: [
["1", "1", "0", "0", "0"],
["1", "1", "0", "0", "0"],
["0", "0", "1", "0", "0"],
["1", "1", "0", "0", "1"]
])


//547. Number of Provinces
//Medium
//Topics
//Companies
//There are n cities. Some of them are connected, while some are not. If city a is connected directly with city b, and city b is connected directly with city c, then city a is connected indirectly with city c.
//
//A province is a group of directly or indirectly connected cities and no other cities outside of the group.
//
//You are given an n x n matrix isConnected where isConnected[i][j] = 1 if the ith city and the jth city are directly connected, and isConnected[i][j] = 0 otherwise.
//
//Return the total number of provinces.

//tc 0(n) + 0(V + 2E)
// sc 0(n) 

func numberOfProvince(_ numbers: [[Int]]) -> Int {
    var V = numbers.count
    var adjList = [[Int]](repeating: [], count: V)
    var vistedArray = [Bool](repeating: false, count: V)
    var count = 0
    
    for i in 0..<V {
        for j in 0..<V {
            
            if numbers[i][j] == 1 && i != j {
                adjList[i].append(j)
                adjList[j].append(i)
            }
        }
    }
    
    for i in 0..<V {
        if !vistedArray[i] {
            count += 1
            dfs(i, adjList, &vistedArray)
            
        }
        
    }
    
    func dfs(_ node: Int, _ adjList:   [[Int]], _ visted: inout [Bool]) {
        visted[node] = true
        for neighbour in adjList[node] {
            
            if !visted[neighbour] {
                dfs(neighbour, adjList, &visted)
            }
            
        }
        
    }
    return count
}

var isConnected = [[1,1,0],[1,1,0],[0,0,1]]
numberOfProvince(isConnected)


//Flood Fill Algorithm - Graphs
//
//
//Problem Statement: An image is represented by a 2-D array of integers, each integer representing the pixel value of the image. Given a coordinate (sr, sc) representing the starting pixel (row and column) of the flood fill, and a pixel value newColor, "flood fill" the image.
//
//To perform a "flood fill", consider the starting pixel, plus any pixels connected 4-directionally to the starting pixel of the same colour as the starting pixel, plus any pixels connected 4-directionally to those pixels (also with the same colour as the starting pixel), and so on. Replace the colour of all of the aforementioned pixels with the newColor.

    // Pre-req: Connected Components, Graph traversal techniques

//Input: [[1 1 1], [2 2 0], [2 2 2]]
//
//sr = 2, sc = 0, newColor = 3
//
//Output: = [[1 1 1][3 3 0][3 3 3]]


//tc 0(n * m)
//sc 0(n * m ) + 0(n * m)
func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
    
    var mutableImage = image
    var rows = mutableImage.count
    var cols = mutableImage[0].count
    let originalColor = mutableImage[sr][sc]

    if originalColor == color {
                return mutableImage
            }
    
        dfs(sr, sc)
        
        func dfs(_ row: Int, _ col: Int) {
            
            if row < 0 || col < 0 || row >= rows || col >= cols || mutableImage[sr][sc] != originalColor {
                return
            }
            
            mutableImage[row][col] = color

                   dfs(row - 1, col) // Up
                   dfs(row + 1, col) // Down
                   dfs(row, col - 1) // Left
                   dfs(row, col + 1) // Right
            
        }
        
        
    
    return mutableImage
}

floodFill([[1,1,1],[1,1,0],[1,0,1]], 1, 1, 2)



//Dijkstra’s Algorithm - Using Priority Queue
// Priority Queue implementation
struct PriorityQueue<T> {
    private var heap: [T] = []
    private let sort: (T, T) -> Bool
    
    init(sort: @escaping (T, T) -> Bool) {
        self.sort = sort
    }
    
    var isEmpty: Bool { heap.isEmpty }
    
    mutating func enqueue(_ element: T) {
        heap.append(element)
        heapifyUp(heap.count - 1)
    }
    
    mutating func dequeue() -> T? {
        guard !heap.isEmpty else { return nil }
        heap.swapAt(0, heap.count - 1)
        let element = heap.removeLast()
        heapifyDown(0)
        return element
    }
    
    private mutating func heapifyUp(_ index: Int) {
        var child = index
        var parent = (child - 1) / 2
        while child > 0 && sort(heap[child], heap[parent]) {
            heap.swapAt(child, parent)
            child = parent
            parent = (child - 1) / 2
        }
    }
    
    private mutating func heapifyDown(_ index: Int) {
        var parent = index
        while true {
            let left = 2 * parent + 1
            let right = 2 * parent + 2
            var candidate = parent
            if left < heap.count && sort(heap[left], heap[candidate]) {
                candidate = left
            }
            if right < heap.count && sort(heap[right], heap[candidate]) {
                candidate = right
            }
            if candidate == parent { return }
            heap.swapAt(parent, candidate)
            parent = candidate
        }
    }
}


func dijkstra(_ V: Int, _ adj: [[[Int]]], _ S: Int) -> [Int] {
    
    var pq = PriorityQueue<(Int, Int)>(sort: {($0.0 < $1.0)})
    var disTo = [Int](repeating: Int.max, count: V)
    
    disTo[S] = 0
    
    pq.enqueue((0, S))
    
    while !pq.isEmpty {
        
        let (dis, node) = pq.dequeue()!
        
        for edge in adj[node] {
            
            let v = edge[0]
            let w = edge[1]
            
            
            if dis + w < disTo[v] {
                disTo[v] = dis + w
                pq.enqueue((disTo[v], v))
                
            }
            
        }
    }
    
    
    return disTo
}






let V = 3, S = 2
let adj: [[[Int]]] = [
    [[1, 1], [2, 6]], // Edges from node 0
    [[2, 3], [0, 1]], // Edges from node 1
    [[1, 3], [0, 6]]  // Edges from node 2
]


let result = dijkstra(V, adj, S)
print(result)
