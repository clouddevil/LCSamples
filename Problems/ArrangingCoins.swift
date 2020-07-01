
// 441. Arranging Coins

class ArrangingCoins {
    
    // 8ms
    func arrangeCoins(_ n: Int) -> Int {
        if (n <= 0) {
            return 0
        }
        return Int((2.0 * Double(n) + 0.25).squareRoot() - 0.5)
    }

    // 32ms
    func arrangeCoins1(_ n: Int) -> Int {
        var start = 0
        var end = n
        var mid = 0

        while (start <= end) {
            mid = start + (end - start) / 2

            if (mid * (mid + 1) <= 2 * n) {
                start = mid + 1
            } else {
                end = mid - 1
            }
        }

        return start - 1
    }

    // 80ms
    func arrangeCoins0(_ n: Int) -> Int {
        var n = n
        var k = 0
        while true {
            n = n - k
            if n - k <= 0 {
                break
            }
            k += 1
        }
        return k
    }
}

//ArrangingCoins().arrangeCoins(5)
//ArrangingCoins().arrangeCoins(8)
//ArrangingCoins().arrangeCoins(-8)
