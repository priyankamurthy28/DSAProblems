//: [Previous](@previous)

import Foundation

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
