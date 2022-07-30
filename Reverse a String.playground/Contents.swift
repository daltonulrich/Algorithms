import UIKit

func solution(_ text: String) -> String {
    var chars = Array(text)
    
    // create stack
    var result = [String]()
    
    // push chars
    for c in chars {
        result.append(String(c))
    }
    
    // pop chars
    for i in 0..<result.count {
        chars[i] = Character(result.popLast()!)
    }
    return String(chars)
}

solution("abc")
solution("Would you like to play a game?")
