import Foundation





func subarraySum(_ nums: [Int], _ k: Int) -> Int {
    var hmap = [0 : 1]
    var result = 0
    var sum = 0
    for i in 0..<nums.count {
        sum += nums[i]
        result += (hmap[sum - k] ?? 0)
        hmap[sum] = (hmap[sum] ?? 0) + 1
    }
    return result
}

//let s = [3, 4, 7, 2, -3, 1, 4, 2]
//
//print(subarraySum(s, 7))
//
