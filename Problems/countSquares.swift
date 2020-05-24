import Foundation

func countSquares(_ matrix: [[Int]]) -> Int {
    var m = matrix
    var result = 0
    
    for i in 0..<m.count  {
        for j in 0..<m[0].count {
            if (i == 0) || (j == 0) {
            }
            else if (m[i][j] == 1) {
                m[i][j] = min(m[i - 1][j - 1], m[i][j - 1], m[i - 1][j]) + 1
            }
            result += m[i][j]
        }
    }
    
    return result
}
