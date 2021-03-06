// 368. Largest Divisible Subset


class LargestDivisibleSubset {

   // 100ms
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
    
    //  700ms
    func largestDivisibleSubset0(_ nums: [Int]) -> [Int] {
        var result = [Int]()
        guard !nums.isEmpty else {
            return result
        }
        var maxIndex = 0
        let list = nums.sorted()
        var dims = Array(repeating: 1, count: nums.count)
        for i in 1..<list.count {
            for j in (0..<i).reversed() {
                if (list[i] % list[j] == 0) {
                    dims[i] = max(dims[i], dims[j] + 1)
                    if (dims[i] > dims[maxIndex]) {
                        maxIndex = i
                    }
                }
            }
        }
        
        var v = list[maxIndex]
        var cc = dims[maxIndex]
        for i in (0...maxIndex).reversed() {
            if ((v % list[i] == 0) && (dims[i] == cc)) {
                result.append(v)
                v = list[i]
                cc -= 1
            }
        }
        
        // O(n^2)
        return result
    }
}
