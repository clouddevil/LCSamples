
// 75. Sort Colors

class SortColors {

    func sortColors(_ nums: inout [Int]) {
        let swap = { (_ nums: inout [Int], _ a: Int, _ b: Int) in
            let temp = nums[a];
            nums[a] = nums[b];
            nums[b] = temp;
        }
    
        var low = 0
        var mid = 0
        var high = nums.count - 1
        while (mid <= high) {
            if(nums[mid] == 0){
                swap(&nums, mid, low)
                low += 1
                mid += 1
            }
            else if(nums[mid] == 1) {
                mid += 1
            }
            else if(nums[mid] == 2) {
                swap(&nums, mid, high)
                high -= 1
            }
        }
    }
    
    func sortColors1(_ nums: inout [Int]) {
        var r = 0
        var w = 0
        var b = 0
        for v in nums {
            if v == 0 {
                r += 1
            } else if v == 1 {
                w += 1
            } else if v == 2 {
                b += 1
            }
        }
        for i in 0 ..< r {
            nums[i] = 0
        }
        for i in r ..< (r + w) {
            nums[i] = 1
        }

        for i in (r + w) ..< (r + w + b) {
            nums[i] = 2
        }
    }

    func sortColors0(_ nums: inout [Int]) {
        nums.sort()
    }
}
