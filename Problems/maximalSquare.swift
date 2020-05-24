import Foundation


func maximalSquare(_ matrix: [[Character]]) -> Int {
    let rows = matrix.count
    if (rows == 0) {
        return 0
    }
    let cols = matrix[0].count
    if (cols == 0) {
        return 0
    }
    
    var res = 0
    let r = Array<Int>(repeating: 0, count: cols + 1)
    var items = Array(repeating: r, count: rows + 1)

    for i in 1...rows {
        for j in 1...cols {
            if matrix[i - 1][j - 1] == "1" {
                items[i][j] = min(items[i - 1][j - 1], min(items[i - 1][j], items[i][j - 1])) + 1
                res = max(res, items[i][j])
            }
        }
    }
    return res * res
}

func maximalSquareS(_ matrix: [[String]]) -> Int {
    var s = [[Character]]()
    for i in 0..<matrix.count {
        var row = [Character]()
        for j in 0..<matrix[0].count {
            row.append(Character(matrix[i][j]))
        }
        s.append(row)
    }
    print(s)
    return maximalSquare(s)
}



//let s = [["1", "0", "1", "0", "0"], ["1", "0", "1", "1", "1"], ["1", "1", "1", "1", "1"], ["1", "0", "0", "1", "0"]]
////let s = [["1"]]
//maximalSquareS(s)
//
