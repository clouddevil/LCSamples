
// 174. Dungeon Game

class DungeonGame {
    init() {}
    
    func calculateMinimumHP(_ dungeon: [[Int]]) -> Int {
        let m = dungeon.count
        let n = (m == 0) ? 0 : dungeon[0].count
        let boardRow = Array(repeating: Int.max, count: n + 1)
        var board = Array(repeating: boardRow, count: m + 1)
        board[m][n - 1] = 1
        board[m - 1][n] = 1
        
        //print (board)
        var i = m - 1
        while (i >= 0) {
            var j = n - 1
            while (j >= 0) {
                let needed = min(board[i + 1][j], board[i][j + 1]) - dungeon[i][j]
                board[i][j] = max(needed, 1)
                j -= 1
            }
            i -= 1
        }
        
        return board[0][0]
    }
}
