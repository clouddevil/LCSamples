
// 442. Find All Duplicates in an Array

class FindDuplicates {
    func findDuplicates(_ nums: [Int]) -> [Int] {
        var nums = nums
        var result = [Int]()
        for i in 0..<nums.count {
            let index = abs(nums[i]) - 1
            if nums[index] < 0 {
                result.append(index + 1)
            } else {
                nums[index] = 0 - nums[index]
            }
        }
        return result
    }
}

//let f = FindDuplicates()
//f.findDuplicates([4,3,2,7,8,2,3,1])
