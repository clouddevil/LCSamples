
// 338. Counting Bits
// https://leetcode.com/problems/counting-bits/

class CountBits {
    func countBits(_ num: Int) -> [Int] {
        var v = Array(repeating: 0, count: num + 1)
        for i in 0...num {
            v[i] = v[i / 2] + i % 2
        }
        return v
    }
}
