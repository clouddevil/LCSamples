import Foundation


func findJudge(_ N: Int, _ trust: [[Int]]) -> Int {
    var items = Array(repeating: 0, count: N + 1)
    for v in trust {
        let (a, b) = (v[0], v[1])
        items[a] -= 1
        items[b] += 1
    }
    
    for i in 1...N {
        if items[i] == N - 1 {
            return i
        }
    }
    return -1
}

//findJudge(2, [[1,2]])   //2
//findJudge(3, [[1,3],[2,3]]) // 3
//findJudge(3, [[1,3],[2,3],[3,1]]) // -1
//findJudge(4, [[1,3],[1,4],[2,3],[2,4],[4,3]]) // 3
