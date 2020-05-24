import Foundation



func productExceptSelf(_ nums: [Int]) -> [Int] {
    if nums.isEmpty {
        return nums
    }
    let len = nums.count
    var result = nums
    result[0] = 1
    for i in 1..<len {
        result[i] = result[i - 1] * nums[i - 1]
    }
    var D = 1
    var i = len - 1
    while (i >= 0) {
        result[i] = D * result[i]
        D *= nums[i]
        i -= 1
    }
    return result
}
