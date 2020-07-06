
// 66. Plus One

class PlusOne {
    func plusOne(_ digits: [Int]) -> [Int] {
		var nums = digits
		for i in (0..<digits.count).reversed() {
			let n = digits[i]
			if (n < 9) {
				nums[i] += 1
				return nums
			}
			nums[i] = 0
		}
		if nums.first == 0 {
			nums.insert(1, at: 0)
		}
		return nums
	}
}