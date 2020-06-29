 // 62. Unique Paths
  
 class UniquePaths {
     func uniquePaths(_ m: Int, _ n: Int) -> Int {
        let reduce = { (from: Int, to: Int) -> Int in
            if (from > to) {
                return 1
            }
            return (from...to).reduce(1, *)
        }
        let dx = max(m, n)
        let dy = min(m, n)
        return reduce(dx, m + n - 2) / reduce(1, dy - 1)
    }
 }

// uniquePaths(1, 2) // 1
// uniquePaths(23, 12) //  193536720
// uniquePaths(3, 2)  // 3
