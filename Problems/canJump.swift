import Foundation

func canJump(_ nums: [Int]) -> Bool {
    let lastIndex = nums.count - 1
    var maxIndex = 0
    var index = 0
    while (index <= maxIndex) {
        maxIndex = max(index + nums[index], maxIndex)
        if (lastIndex <= maxIndex) {
            return true
        }
        index += 1
    }
    return false
}


//print(canJump([2,3,1,1,4]))
//print(canJump([3,2,1,0,4]))
