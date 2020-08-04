

// 463. Island Perimeter

var perimeter = 0
        for (row, rows) in grid.enumerated() {
            for (cell, cellVal) in rows.enumerated() where cellVal == 1 {
                
                // top
                if row == 0 { perimeter += 1 }
                else if grid[row - 1][cell] == 0 { perimeter += 1 }

                // bottom
                if row == grid.count - 1 { perimeter += 1 }
                else if grid[row + 1][cell] == 0 { perimeter += 1 }

                // left
                if cell == 0 { perimeter += 1 }
                else if grid[row][cell - 1] == 0 { perimeter += 1 }

                // right
                if cell == rows.count - 1 { perimeter += 1 }
                else if grid[row][cell + 1] == 0 { perimeter += 1 }
            }
        }
        return perimeter

/////////////////////////////////////////////////////////////////

var result = 0
    for i in 0..<grid.count {
      for j in 0..<grid[i].count {
        if grid[i][j] == 1 {
          if i == 0 || grid[i - 1][j] == 0 {
            result += 1
          }
          if i == grid.count - 1 || grid[i + 1][j] == 0 {
            result += 1
          }
          if j == 0 || grid[i][j - 1] == 0 {
            result += 1
          }
          if j == grid[i].count - 1 || grid[i][j + 1] == 0 {
            result += 1
          }
        }
      }
    }
    
    return result

