
// 287. Find the Duplicate Number

class FindDuplicateNumber {
    func findDuplicate(_ nums: [Int]) -> Int {
        if nums.count < 2 {
            return -1
        }
        var tortoise = nums[0]
        var hare = nums[0]
        while true {
            tortoise = nums[tortoise]
            hare = nums[nums[hare]]
            if tortoise == hare {
                break
            }
        }
        tortoise = nums[0]
        while tortoise != hare {
            tortoise = nums[tortoise]
            hare = nums[hare]
        }
        return hare
    }
}
