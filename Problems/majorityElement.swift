import Foundation


func majorityElement(_ nums: [Int]) -> Int {
    var hmap = [Int: Int]()
    let vCount = nums.count / 2
    for v in nums {
        let s = hmap[v, default: 0] + 1
        if (s > vCount) {
            return v
        }
        hmap[v] = s
    }
    fatalError()
}
//
//majorityElement([3,2,3])
//majorityElement([2,2,1,1,1,2,2])
