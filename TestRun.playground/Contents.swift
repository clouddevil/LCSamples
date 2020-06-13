import UIKit

class LargestDivisibleSubset {
    func largestDivisibleSubset(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        guard !nums.isEmpty else {
            return result
        }
        var maxValue = 0
        let list = nums.sorted()
        var dims = Array(repeating: 1, count: nums.count)
        var i = 0
        while i < list.count {
            var j = i - 1
            while j >= 0  {
                if (list[i] % list[j] == 0) {
                    dims[i] = max(dims[i], dims[j] + 1)
                }
                j -= 1
            }
            if dims[i] > maxValue {
                maxValue = dims[i]
                result.append(list[i])
            }
            i += 1
        }
        
        // O(n^2)
        return result
    }
}

var s = LargestDivisibleSubset()
print(s.largestDivisibleSubset([1, 2, 3]))
print(s.largestDivisibleSubset([1, 2, 3, 4]))
