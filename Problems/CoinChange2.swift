
// 518. Coin Change 2

class CoinChange2 {
    func change(_ amount: Int, _ coins: [Int]) -> Int {
        var res = Array(repeating: 0, count: amount + 1)
        res[0] = 1
        for c in coins {
            if c <= amount {
                for i in c ... amount {
                    res[i] += res[i - c]
                }
            }
        }
        return res[amount]
    }
}

// 322. Coin Change

class CoinChange {
    func coinChange(_ amount: Int, _ coins: [Int]) -> Int {
        guard amount > 0 && !coins.isEmpty else { return -1 }
        var res = Array(repeating: amount + 1, count: amount + 1)
        res[0] = 0
        for c in coins {
            for i in 1 ... amount where i >= c {
                res[i] = min(res[i], res[i - c] + 1)
            }
        }
        return res[amount] > amount ? -1 : res[amount]
    }
}
