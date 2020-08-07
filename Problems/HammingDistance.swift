
// 461. Hamming Distance

class HammingDistance {
    func hammingDistance(_ x: Int, _ y: Int) -> Int {
        var count = 0
        var n = x ^ y
        
        while n > 0 {
            n &= n - 1
            count += 1
        }
        
        return count
    }

    func hammingDistance0(_ x: Int, _ y: Int) -> Int {
        return (x ^ y).nonzeroBitCount
    }
}
