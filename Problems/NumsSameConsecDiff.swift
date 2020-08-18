
// 967. Numbers With Same Consecutive Differences

final class NumsSameConsecDiff_BFS {
    
    func numsSameConsecDiff(_ N: Int, _ K: Int) -> [Int] {
        var queue = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        if (N <= 1) {
            return queue + [0]
        }

        for _ in 1..<N {
            var nextQueue = [Int]()
            for val in queue {

                let lastDigit = val % 10
                let nplus = lastDigit + K

                if nplus < 10 {
                    let insert = 10 * val + nplus
                    nextQueue.append(insert)
                }
                if (K != 0) {
                    let nminus = lastDigit - K
                    if nminus >= 0 {
                        let insert = 10 * val + nminus
                        nextQueue.append(insert)
                    }
                }
            }
            queue = nextQueue
        }
        return queue
    }
}

final class NumsSameConsecDiff_DFS {

    var k = 0
    var res = [Int]()
    
    func numsSameConsecDiff(_ N: Int, _ K: Int) -> [Int] {
        res = [Int]()
        k = K
        if N <= 1 { res.append(0) }
        for i in 1...9 {
            dfs(i, N - 1)
        }
        return res
    }

    private func dfs(_ val: Int, _ count: Int) {
        if count == 0 {
            res.append(val)
            return
        }
        let lastDigit = val % 10
        let nplus = lastDigit + k
        
        if nplus < 10 {
            dfs(val * 10 + nplus, count - 1)
        }
        
        if (k != 0) {
            let nminus = lastDigit - k
            if nminus >= 0 {
                dfs(val * 10 + nminus, count - 1)
            }
        }
    }
}
