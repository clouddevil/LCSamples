import Foundation


func largestNumber(_ nums: [Int]) -> String {
    if (!nums.contains(where: { $0 != 0 })) {
        return "0"
    }
    let strs = nums.map { String( $0 ) }
    let sortedNums = strs.sorted { (a , b) -> Bool in
        (a + b) > (b + a)
    }
    return sortedNums.joined(separator: "")
}

//largestNumber([0, 0])
//largestNumber([3,30,34,5,9, 0])
