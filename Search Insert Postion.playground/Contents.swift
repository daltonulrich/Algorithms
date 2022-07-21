import UIKit

func searchInsert(_ nums: [Int], _ target: Int) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    
    var left = 0
    var right = nums.count - 1
    var mid = 0
    
    while left + 1 < right {
        mid = (right - left) / 2 + left
        if nums[mid] == target {
            return mid
        } else if nums[mid] < target {
            left = mid
        } else {
            right = mid
        }
    }
    
    if nums[right] < target {
        return right + 1
    }
    if nums[left] >= target {
        return left
    }
    
    return right
}
