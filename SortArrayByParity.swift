// 905. Sort Array By Parity


class Solution {
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        var odd = [Int]()
        var even = [Int]()
        for v in A {
            if (v % 2 == 0) {
                even.append(v)
            } else {
                odd.append(v)
            }
        }
        return even + odd
    }
}



