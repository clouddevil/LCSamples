
// 35. Search Insert Position

class SearchInsertPosition {
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var l = 0
        var r = nums.count - 1
        var m = 0
        while (l <= r) {
            m = (l + r) / 2
            let v = nums[m]
            if (v == target) {
                return m
            } else if (v > target) {
                r = m - 1
            } else {
                l = m + 1
            }
        }
        return l
    }
}
