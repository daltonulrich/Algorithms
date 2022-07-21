import UIKit

func strStr(_ haystack: String, _ needle: String) -> Int {
    if(needle.count == 0 ) {
        return 0
    }
    
    if(haystack.count == 0) {
         return -1
    }
    
    if(needle.count > haystack.count) {
        return -1
    }
    let chars = Array(haystack);
    let needleChars = Array(needle);
    
    for i in 0..<chars.count - needleChars.count + 1 {
        let char = chars[i]
        var iNeedle = false
        
        if (char == needleChars[0]) {
            iNeedle = true
            
            for j in 1..<needleChars.count {
                if(chars[j + i] != needleChars[j]) {
                    iNeedle = false
                }
            }
        }
        if(iNeedle == true) {
            return i
        }
    }
    return -1
}


strStr("bigcanoli", "can")
