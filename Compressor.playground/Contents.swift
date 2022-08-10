import UIKit

func compress(_ str: String) -> String {
    var compressed = ""
    var count = 0
    let chars = Array(str)
    for i in 0..<str.count {
        count += 1
        
        if i + 1 >= str.count || chars[i] != chars[i + 1] {
            compressed.append(chars[i])
            compressed.append(String(count))
            count = 0
        }
    }
    return compressed.count < str.count ? compressed : str
}

compress("aaabb")
compress("aabb")
compress("ab")
compress("abc")
compress("zzz")
compress("aabbaabb")
