import Foundation

 func findMaxLength(_ nums: [Int]) -> Int {
    var m = [Int: Int]()
    m[0] = -1
    var len = 0
    var count = 0
    var index = 0
    while (index < nums.count) {
        count += ((nums[index] == 1) ? 1 : -1)
        if let v = m[count] {
            len = max(len, index - v)
        } else {
            m[count] = index
        }
        index += 1
    }
    return len
}
