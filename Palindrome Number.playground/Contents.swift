import UIKit

func isPalindrome(_ x: Int) -> Bool {
    var reverse = 0
    var ogNum = x
        while ogNum > 0 {
            let reminder = ogNum % 10
            reverse = reverse * 10 + reminder
            ogNum = ogNum / 10
        }
    return x == reverse
}
