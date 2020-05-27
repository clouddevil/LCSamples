
func maxUncrossedLines(_ A: [Int], _ B: [Int]) -> Int {
    let b = Array(repeating: 0, count: B.count + 1)
    var dp = Array(repeating: b, count: A.count + 1)
    
    for i in (0..<A.count).reversed() {
        for j in (0..<B.count).reversed() {
            dp[i][j] = ((A[i] == B[j])
                ? dp[i + 1][j + 1] + 1 :
                max(dp[i][j + 1], dp[i + 1][j]))
        }
    }
    return dp[0][0]
}
