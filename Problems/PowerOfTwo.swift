// 231. Power of Two

class PowerOfTwo {
    func isPowerOfTwo(_ n: Int) -> Bool {
        return (n != 0) && ((n & (n - 1)) == 0)
    }

//    func isPowerOfTwo(_ n: Int) -> Bool {
//        var k = 1
//        while k < n {
//            k <<= 1
//        }
//        return k == n
//    }
}
