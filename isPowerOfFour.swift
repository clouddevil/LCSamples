// 342. Power of Four

class Solution {
    func isPowerOfFour(_ num: Int) -> Bool {
        if num == 1 { return true }
        
        return (num & (num-1) == 0) && (num % 3) == 1
    }
}


class Solution1 {
    func isPowerOfFour(_ num: Int) -> Bool {
        return num > 0 && (num&(num-1)) == 0 && (num & 0x55555555) != 0
    }
}