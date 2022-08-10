import UIKit

func oneAway(_ first: String, _ second: String) -> Bool {
    
    if abs(first.count - second.count) > 1 {
        return false
    } else if first.count == second.count {
        return oneEditReplace(first, second)
    } else if first.count + 1 == second.count {
        return oneEditInsert(first, second)
    } else if first.count - 1 == second.count {
        return oneEditInsert(second, first)
    }
    return true
}

func oneEditInsert(_ s1: String, _ s2: String) -> Bool {
    var i = 0
    var j = 0
    
    let s1Chars = Array(s1)
    let s2Chars = Array(s2)
    
    while i < s1.count && j < s2.count {
        if s1Chars[i] != s2Chars[j] {
            if i != j {
                return false
            }
            j += 1
        } else {
            i += 1
            j += 1
        }
    }
    return true
}

func oneEditReplace(_ s1: String, _ s2: String) -> Bool {
    var foundDifference = false
    
    let s1Chars = Array(s1)
    let s2Chars = Array(s2)
    
    for i in 0..<s1.count {
        if s1Chars[i] != s2Chars[i] {
            if foundDifference {
                return false
            }
            foundDifference = true
        }
    }
    return true
}


print("\(oneAway("pale", "paleXXXX"))")
print("\(oneAway("pale", "ple"))")
print("\(oneAway("pales", "pale"))")
print("\(oneAway("pale", "bale"))")
print("\(oneAway("pale", "bake"))")
print("\(oneAway("pale", "bakeerer"))")
