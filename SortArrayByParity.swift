// 905. Sort Array By Parity

// 60ms
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


/*
// 80ms
class Solution {
    func sortArrayByParity(_ A: [Int]) -> [Int] {
        return A.sorted {
            return ($0 % 2 - $1 % 2) < 0
        }        
    }
}
*/