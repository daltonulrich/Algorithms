import UIKit


func isPermutation(_ text: String, _ perm: String) -> Bool {
    if text.count != perm.count {
        return false
    }
    return text.sorted() == perm.sorted()
}


print("\(isPermutation("abc", "cba"))")
print("\(isPermutation("abc", "xyz"))")
print("\(isPermutation("abc", "cab"))")
