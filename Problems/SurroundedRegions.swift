// 130. Surrounded Regions

class SurroundedRegions {
    func solve(_ board: inout [[Character]]) {
        let rows = board.count
        if rows == 0 {
            return
        }
        let cols = board[0].count
        if cols == 0 {
            return
        }
        for r in 0..<rows {
            dfs(&board, r, 0)
            dfs(&board, r, cols - 1)
        }
        for c in 0..<cols {
            dfs(&board, 0, c)
            dfs(&board, rows - 1, c)
        }
        for r in 0..<rows {
            for c in 0..<cols {
                if (board[r][c] == "O") {
                    board[r][c] = "X"
                } else if (board[r][c] == "E") {
                    board[r][c] = "O"
                }
            }
        }
    }
    
    private func dfs(_ board: inout [[Character]], _ row: Int, _ col: Int) {
        if (row < 0) || ((row >= board.count)) {
            return
        }
        if ((col < 0) || (col >= board[0].count)) {
            return
        }
        if (board[row][col] != "O") {
            return 
        }
        
        board[row][col] = "E"
        dfs(&board, row, col + 1)
        dfs(&board, row + 1, col)
        dfs(&board, row, col - 1)
        dfs(&board, row - 1, col)
    }
}

