
// 137. Single Number II
// https://leetcode.com/problems/single-number-ii/discuss/43295/Detailed-explanation-and-generalization-of-the-bitwise-operation-method-for-single-numbers

class SingleNumber2 {
    func singleNumber(_ nums: [Int]) -> Int {
        var x1 = 0
        var x2 = 0
        var mask = 0
        for v in nums {
            x2 ^= x1 & v
            x1 ^= v
            mask = ~(x1 & x2)
            x2 &= mask
            x1 &= mask
        }
        return x1
    }
}

//var s = SingleNumber2()
//s.singleNumber([0,1,0,1,0,1,99])
//s.singleNumber([2,2,3,2])

