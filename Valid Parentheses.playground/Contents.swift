import UIKit

let dictionary: [Character: Character] = [")": "(", "}": "{", "]": "["]

func isValid(_ s: String) -> Bool {
    var stack = [Character]()
    for ch in s {
        if ch == "(" || ch == "{" || ch == "[" {
            stack.append(ch)
        } else {
            guard let lastChar = stack.last, lastChar == dictionary[ch]! else {
                return false
            }
            stack.removeLast()
        }
    }
    return stack.count == 0
}
