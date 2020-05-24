import Foundation


func numIslands(_ grid: [[Character]]) -> Int {
    var numOfIsland = 0
    var gridClone = grid
    for j in 0..<grid.count {
        let gLine = grid[j]
        for i in 0..<gLine.count {
            if grid[j][i] == "1" {
                numOfIsland += dfs(&gridClone, j, i)
            }
        }
    }
    return numOfIsland
}


func dfs( _  grid: inout [[Character]], _ j: Int, _ i: Int) -> Int {
    if (j < 0) || (j >= grid.count) {
        return 0
    }
    if (i < 0) || (i >= grid[j].count) {
        return 0
    }
    if (grid[j][i] == "0") {
        return 0
    }
    grid[j][i] = "0"
    _ = dfs(&grid, j + 1, i)
    _ = dfs(&grid, j - 1, i)
    _ = dfs(&grid, j, i + 1)
    _ = dfs(&grid, j, i - 1)
    return 1
}


//let s = [1, 2, 3, 4]
let s: [[Character]] =
        [["0", "0", "0", "0"],
         ["0", "0", "1", "0"],
         ["1", "1", "1", "0"],
         ["0", "0", "0", "0"]]

//print(numIslands(s))
