// 344. Reverse String

class ReverseString {
    func reverseString(_ s: inout [Character]) {
        s.reverse()
    }

//    func reverseString(_ s: inout [Character]) {
//        var pointer1 = 0
//        var pointer2 = s.count - 1
//        while pointer1 < pointer2 {
//            let temp = s[pointer1]
//            s[pointer1] = s[pointer2]
//            s[pointer2] = temp
//            pointer1 += 1
//            pointer2 -= 1
//        }
//    }
}
