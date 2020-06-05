
// 528. Random Pick with Weight

class RandomPickWithWeight {
    var s: [Int]

    init(_ w: [Int]) {
        s = w
        for i in 1 ..< w.count {
            s[i] += s[i - 1]
        }
    }

    func pickIndex() -> Int {
        let i = Int.random(in: 1 ... s[s.count - 1])
        var l = 0, r = s.count - 1

        while l < r {
            let m = (l + r) / 2

            if s[m] == i {
                return m
            } else if s[m] < i {
                l = m + 1
            } else {
                r = m
            }
        }
        return l
    }
}

/**
 * Your Solution object will be instantiated and called as such:
 * let obj = Solution(w)
 * let ret_1: Int = obj.pickIndex()
 */
