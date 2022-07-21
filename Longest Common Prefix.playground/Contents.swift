import UIKit

func longestCommonPrefix(_ strs: [String]) -> String {
    if (strs.count == 0) {
        return ""
    }
    
    var result = strs[0]
    
    for index in 1 ..< strs.count {
        let currWord = strs[index]
        let shorterLength = min(currWord.count, result.count)
        var wordIndex = 0
        for _ in 0 ..< shorterLength {
            let currWordIndex = currWord.index(currWord.startIndex, offsetBy: wordIndex)
            let resultIndex = result.index(result.startIndex, offsetBy: wordIndex)
            if (currWord[currWordIndex] != result[resultIndex]) {
                if(wordIndex == 0) {
                    result = ""
                } else {
                    result = String(result[..<resultIndex])
                }
                break
            }
            wordIndex = wordIndex + 1
        }
        if (wordIndex == shorterLength) {
            let shortIndex = result.index(result.startIndex, offsetBy: wordIndex)
            result = String(result[..<shortIndex])
        }
    }
    return result
}
