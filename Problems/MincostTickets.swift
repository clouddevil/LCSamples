
// 983. Minimum Cost For Tickets

class MincostTickets
{
    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        var dp = Array(repeating: Int.max, count: days.count)
        dp[0] = costs.min()!
        let costs = zip([1, 7, 30], costs)

        for (i, day) in days.enumerated().dropFirst() {
            for (duration, cost) in costs {
                var j = i
                while j >= 0 && (day - days[j]) < duration {
                    j -= 1
                }
                dp[i] = min(dp[i], (j >= 0 ? dp[j] : 0) + cost)
            }
        }

        return dp.last ?? 0
    }
}

class MincostTickets0 {
    var costs = [Int]()
    var days = Set<Int>()
    var memo = Array(repeating: 0, count: 366)

    func mincostTickets(_ days: [Int], _ costs: [Int]) -> Int {
        self.costs = costs
        self.days = Set(days)
        return dp(1)
    }

    func dp(_ i: Int) -> Int {
        if (i > 365) {
            return 0
        }
        if (memo[i] != 0) {
            return memo[i]
        }
        var ans = 0
        if days.contains(i) {
            ans = min(dp(i + 1) + costs[0], dp(i + 7) + costs[1], dp(i + 30) + costs[2])
        } else {
            ans = dp(i + 1)
        }
        memo[i] = ans
        return ans
    }
}

//let v = MincostTickets()
//v.mincostTickets([1, 4, 6, 7, 8, 20], [2, 7, 15])


