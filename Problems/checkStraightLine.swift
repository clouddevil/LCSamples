import Foundation


func onLine(_ p0: [Int], _ p1: [Int], _ p2: [Int]) -> Bool {
    return (p0[1] - p1[1]) * (p2[0] - p1[0]) == (p2[1] - p1[1]) * (p0[0] - p1[0])
}

func checkStraightLine(_ coordinates: [[Int]]) -> Bool {
    if (coordinates.count <= 2) {
        return true
    }
    let p0 = coordinates[0]
    let p1 = coordinates[1]
    for i in 2..<coordinates.count {
        let p2 = coordinates[i]
        if (!onLine(p0, p1, p2)) {
            return false
        }
    }
    return true
}

//checkStraightLine([[1,2],[2,3],[3,4],[4,5],[5,6],[6,7]])
//
//checkStraightLine([[1,2],[2,3],[2,3]])
