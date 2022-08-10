import UIKit


func isUnique(_ text: String) -> Bool {
    var foundChars = [Character: Bool]()
    let chars = Array(text)
    
    for c in chars {
        if foundChars[c] != nil {
            return false
        }
        foundChars[c] = true
    }
    return true
}


print("\(isUnique("ab"))")
print("\(isUnique("aa"))")
print("\(isUnique("abcdefga"))")
