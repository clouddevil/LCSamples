
// 1029. Two City Scheduling

class TwoCityScheduling {
    func twoCitySchedCost(_ costs: [[Int]]) -> Int {
        let count = costs.count
        let n = count / 2
        var ans = 0
        var v = Array(repeating: 0, count: count)
        for i in 0..<count {
            ans += (costs[i][0] + costs[i][1])
            v[i] = (costs[i][0] - costs[i][1])
        }
        v.sort()
        for i in 0..<n {
            ans += v[i]
        }
        for i in n..<count {
            ans -= v[i]
        }
        return ans / 2
    }
}

// [[10,20],[30,200],[400,50],[30,20]]
