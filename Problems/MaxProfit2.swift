// 123. Best Time to Buy and Sell Stock III

class MaxProfit2 {
    
    func maxProfit(_ prices: [Int]) -> Int {
        var buy1 = Int.max
        var buy2 = Int.max
        var sell1 = 0
        var sell2 = 0
        for i in 0..<prices.count {
            let p = prices[i]
            buy1 = min(buy1, p)
            sell1 = max(sell1, p - buy1)
            buy2 = min(buy2, p - sell1)
            sell2 = max(sell2, p - buy2)
        }
        return sell2
    }
    
    func maxProfit1(_ prices: [Int]) -> Int {
        if prices.count < 1 {
            return 0
        }
        let row = Array(repeating: 0, count: prices.count)
        var dp = Array(repeating: row, count: 3)
        for k in 1...2 {
            var minPrice = prices[0]
            for i in 1..<prices.count {
                minPrice = min(minPrice, prices[i] - dp[k - 1][i - 1])
                dp[k][i] = max(dp[k][i - 1], prices[i] - minPrice)
            }
        }
        return dp[2][prices.count - 1]
    }
    
    // TLE
    func maxProfit0(_ prices: [Int]) -> Int {
        if prices.count < 1 {
            return 0
        }
        let row = Array(repeating: 0, count: prices.count)
        var dp = Array(repeating: row, count: 3)
        var j = 0
        for k in 1...2 {
            for i in 1..<prices.count {
                j = 1
                var minPrice = prices[0]
                while (j <= i) {
                    minPrice = min(minPrice, prices[j] - dp[k - 1][j - 1])
                    j += 1
                }
                dp[k][i] = max(dp[k][i - 1], prices[i] - minPrice)
            }
        }
        return dp[2][prices.count - 1]
    }
}

//let s = MaxProfit2()
//s.maxProfit([3,3,5,0,0,3,1,4])
//s.maxProfit([1,2,3,4,5])

