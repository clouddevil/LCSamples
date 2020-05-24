import Foundation

public class MoveZeroes {
    
    public init() {}
    
    public func moveZeroes(_ nums: inout [Int]) {
        let len = nums.count
        var c = 0
        for i in 0 ..< len {
            let v = nums[i]
            if (v != 0) {
                nums[c] = v
                c += 1
            }
        }
        while (c < len) {
            nums[c] = 0
            c += 1
        }
    }
}

