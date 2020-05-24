import Foundation



 class MaxSubbarray {
    public init() {}
    
    public func maxSubArray(_ nums: [Int]) -> Int {
        
        var sum = Int.min
        var prevSum = 0
        for i in 0..<nums.count {
            let s = nums[i]
            prevSum = max(prevSum + s, s)
            if (sum < prevSum) {
                sum = prevSum
            }
        }
        return sum
    }
    
    //print(s.maxSubArray([-2,1,-3,4,-1,2,1,-5,4]))
    //print(s.maxSubArray([-2]))
}
