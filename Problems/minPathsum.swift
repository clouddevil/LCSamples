import Foundation

//let s = [
//  [1,3,1],
//  [1,5,9],
//  [4,2,1]
//]

func newPath(_ grid: inout [[Int]], _ j: Int, _ i: Int) {
    if (i == 0) && (j == 0) {
        return
    }
    if (i == 0) {
        grid[j][i] += grid[j - 1][i]
    } else if (j == 0) {
        grid[j][i] += grid[j][i - 1]
    } else {
        grid[j][i] += min(grid[j][i - 1], grid[j - 1][i])
    }
}

func minPathSum(_ grid: [[Int]]) -> Int {
    var gridPaths = grid
    
    for j in 0..<grid.count {
        for i in 0..<grid[j].count {
            newPath(&gridPaths, j, i)
        }
    }
    return gridPaths[grid.count - 1][grid[0].count - 1]
}

//print (minPathSum(s))
