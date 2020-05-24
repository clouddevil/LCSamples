import Foundation


func searchR(_ nums: ArraySlice<Int>, _ target: Int) -> Int
{
    let len = nums.count
    
    if (len == 1) {
        if (nums[nums.startIndex] == target) {
            return nums.startIndex
        } else {
            return -1
        }
    }

    let middleIndex = len / 2
    let left = nums.prefix(middleIndex)
    let right = nums.suffix(from: nums.startIndex + middleIndex)

    if (left[left.startIndex] <= left[left.endIndex - 1]) {
        if ((left[left.startIndex] <= target) && ((target <= left[left.endIndex - 1]))) {
            return searchR(left, target)
        } else {
            return searchR(right, target)
        }
    }
    
    if (right[right.startIndex] <= right[right.endIndex - 1]) {
        if ((right[right.startIndex] <= target) && ((target <= right[right.endIndex - 1]))) {
            return searchR(right, target)
        } else {
            return searchR(left, target)
        }
    }
    return -1
}

func search(_ nums: [Int], _ target: Int) -> Int {
    if (nums.isEmpty) {
        return -1
    }
    return searchR(nums.suffix(from: 0), target)
}

//
//let s = [ 4,5,6,7,0,1,2]
//print(search(s, 6))

//s.suffix(form)

//2 / 2

//s.prefix(1)[0]
//s.suffix(from: 3).suffix(from: 4)

func search1(_ nums: [Int], _ target: Int) -> Int {
    var index = 0
    while (index < nums.count) {
        if (nums[index] == target) {
            return index
        }
        index += 1
    }
    return -1
}


func search2(_ nums: [Int], _ target: Int) -> Int {
    var startIndex = 0
    var endIndex = nums.count - 1

    while startIndex <= endIndex {
        let mid = endIndex - startIndex / 2

        if nums[mid] == target {
            return mid
        } else if nums[startIndex] < nums[mid] {
            if nums[mid] > target {
                endIndex = mid - 1
            } else {
                startIndex = mid + 1
            }
        } else {
            if nums[mid] < target && target < nums[endIndex] {
                startIndex = mid + 1
            } else {
                endIndex = mid - 1
            }
        }
    }

    return -1
}

//let s = [4, 5, 6, 7, 0, 1, 2]
//print(search(s, 6))

