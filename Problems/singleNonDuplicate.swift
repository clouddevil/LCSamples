import Foundation

func singleNonDuplicate(_ nums: [Int]) -> Int {
    var start = 0

   var end = nums.count - 1

   var mid = 0
   while (start < end) {
       mid = start + (end - start) / 2
       if (nums[mid] == nums[mid ^ 1]) {
           start = mid + 1
       } else {
           end = mid
       }
   }
    return nums[start]
}

//singleNonDuplicate([1])

