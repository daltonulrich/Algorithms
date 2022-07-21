import UIKit

func removeElement(inout nums: [Int], _ val: Int) -> Int {
    nums = nums.filter { (num) in num != val }
    return nums.count
}
