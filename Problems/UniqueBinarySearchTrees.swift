
// 96. Unique Binary Search Trees

/**
* Taking 1~n as root respectively:
*      1 as root: # of trees = F(0) * F(n-1)  // F(0) == 1
*      2 as root: # of trees = F(1) * F(n-2)
*      3 as root: # of trees = F(2) * F(n-3)
*      ...
*      n-1 as root: # of trees = F(n-2) * F(1)
*      n as root:   # of trees = F(n-1) * F(0)
*
* So, the formulation is:
*      F(n) = F(0) * F(n-1) + F(1) * F(n-2) + F(2) * F(n-3) + ... + F(n-2) * F(1) + F(n-1) * F(0)
*/


class UniqueBinarySearchTrees {
    func numTrees(_ n: Int) -> Int {
        if (n <= 0) {
            return 0
        }
        if (n == 1) {
            return 1
        }
        var dp = Array(repeating: 1, count: n + 1)
        for i in 2...n {
            dp[i] = 0
            for j in 1...i {
                dp[i] += dp[j - 1] * dp[i - j]
            }
        }
        return dp[n]
    }
}

