import Foundation


func intervalIntersection(_ A: [[Int]], _ B: [[Int]]) -> [[Int]] {
    var res = [[Int]]()
    var i = 0
    var j = 0
    while (i < A.count && j < B.count) {
        let l = max(A[i][0], B[j][0])
        let h = min(A[i][1], B[j][1])
        if (l <= h) {
            res.append([l, h])
        }
        if (A[i][1] < B[j][1]) {
            i += 1
        } else {
            j += 1
        }
    }
    
    return res
}


//let a = [[0,2],[5,10],[13,23],[24,25]]
//let b = [[1,5],[8,12],[15,24],[25,26]]
//
//intervalIntersection(a, b)
//
//
//let A = [[0,2],[5,10],[13,23],[24,25]]
//let B = [[1,5],[8,12],[15,24],[25,26]]
//
//intervalIntersection(A, B)
