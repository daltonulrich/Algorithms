import UIKit

func removeDuplicates(_ nums: inout [Int]) -> Int {
    var set = Set<Int>()
    nums = nums.compactMap ({
        if set.contains($0) {
            return nil
        } else {
            set.insert($0)
            return $0
        }
    
    })
    return nums.count
}
