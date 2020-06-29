
// 279. Perfect Squares

class PerfectSquares {
    
    // 550ms
    func numSquares(_ n: Int) -> Int {
        if n <= 0 {
            return 0
        }
        var squares = Array(repeating: Int.max, count: n + 1)
        squares[0] = 0
        var i = 1
        while i <= n {
            var j = 1
            while j * j <= i {
                squares[i] = min(squares[i], squares[i - j * j] + 1)
                j += 1
            }
            i += 1
        }
        return squares.last!
    }

    // TLE
    func numSquares0(_ n: Int) -> Int {
        if n <= 0 {
            return 0
        }
        var squares = Array(repeating: Int.max, count: n + 1)
        squares[0] = 0
        for i in 1 ... n {
            for j in 1 ... n where j * j <= i {
                squares[i] = min(squares[i], squares[i - j * j] + 1)
            }
        }
        return squares.last!
    }
}

/*
 
 // TODO: теорема лагранжа о 4 и лежандра о 3 квадаратах
 
 func numSquares(_ n: Int) -> Int {
        var n = n

        while n.isMultiple(of: 4) { n /= 4 }
        if n % 8 == 7 { return 4 }

        let sqrt = Int(Double(n).squareRoot())
        if n == sqrt * sqrt { return 1 }

        var a = 1, b = sqrt
        while a <= b {
            switch a * a + b * b {
            case ..<n:
                a += 1
            case (n + 1)...:
                b -= 1
            default:
                return 2
            }
        }

        return 3
    }
 
 
 */
