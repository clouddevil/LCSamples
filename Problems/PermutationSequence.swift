
// 60. Permutation Sequence

class PermutationSequence {
    func getPermutation(_ n: Int, _ k: Int) -> String {
        var sArray = [Character]()
        var nums = [Int]()
        var fact = 1
        for i in 1...n {
            fact *= i
            nums.append(i)
        }
        var i = 0
        var l = k - 1
        let offset: Int = Int(Character("0").asciiValue!)
        while (i < n) {
            fact /= (n - i)
            let index = l / fact
            let ch = Character(UnicodeScalar(nums.remove(at: index) + offset)!)
            sArray.append(ch)
            l -= index * fact
            i += 1
        }
        return String(sArray)
    }
}

//let s = PermutationSequence()
//s.getPermutation(3, 3)
//s.getPermutation(4, 9)

