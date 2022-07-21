import UIKit

struct Person {}

let ints = [1, 2, 3]
let strings = ["a", "b", "c"]
let people = [Person(), Person(), Person()]

let arrayOfSpecificSize = Array<Int>(repeating: 1, count: 10)

var array = ["a", "b", "c", "d"]
array.remove(at: 1)
array.insert("b", at: 1)
array.append("e")



func solution(A: [Int], K: Int) -> [Int] {
    guard !A.isEmpty else { return [] }
    guard K > 0 else { return A }
    
    var result = A
    for _ in 1...K { // O(n)
        result = rotateRightOnce(A: result)
    }
    return result
}

func rotateRightOnce(A: [Int]) -> [Int] {
    var newArray = Array<Int>(repeating: 0, count: A.count)
    for i in 0..<A.count - 1 { // O(n)
        newArray[i + 1] = A[i]
    }
    newArray[0] = A.last!
    
    return newArray
}

rotateRightOnce(A: [0])
rotateRightOnce(A: [1, 2, 3])

solution(A: [], K: 0)
solution(A: [], K: 1)
solution(A: [-4], K: 0)
solution(A: [-4], K: 1)
solution(A: [1, 2, 3], K: 4)

solution(A: [1, 2, 3, 4, 5], K: 1)
solution(A: [1, 2, 3, 4, 5], K: 2)
solution(A: [1, 2, 3, 4, 5], K: 3)

solution(A: [3, 8, 9, 7, 6], K: 3)


func solutionStackRight(A: [Int], K: Int) -> [Int] {
    guard !A.isEmpty else { return [] }
    guard K > 0 else { return A }

    var result = A

    for _ in 1...K {
        let last = result.last!
        result.insert(last, at: 0)
        result.remove(at: A.count)
    }

    return result
}

solutionStackRight(A: [1, 2, 3, 4, 5], K: 1)
solutionStackRight(A: [1, 2, 3, 4, 5], K: 2)
solutionStackRight(A: [1, 2, 3, 4, 5], K: 3)
solutionStackRight(A: [1, 2, 3, 4, 5], K: 4)

func solutionStackLeft(A: [Int], K: Int) -> [Int] {
    guard !A.isEmpty else { return [] }
    guard K > 0 else { return A }
    
    var result = A
    
    for _ in 1...K {
        let first = result.first!
        result.append(first)
        result.remove(at: 0)
    }
    
    return result
}

solutionStackLeft(A: [1, 2, 3, 4, 5], K: 1)
solutionStackLeft(A: [1, 2, 3, 4, 5], K: 4)




func solution(_ S : String) -> String {
    
    let noSpace = S.replacingOccurrences(of: " ", with: "")
    let noSpaceNoDash = noSpace.replacingOccurrences(of: "-", with: "")
        
    var result = ""
    
    var count = -2
    for c in noSpaceNoDash {
        result.append(c)
        if count % 3 == 0 {
            result.append("-")
        }
        count += 1
    }
    
    if result.last == "-" {
        result = String(result.dropLast())
    }
    

    var chars = Array(result)
    let secondLastPtr = chars.count - 2
    if chars[secondLastPtr] == "-" {
        chars[secondLastPtr] = chars[secondLastPtr - 1]
        chars[secondLastPtr - 1] = "-"
    }

    return String(chars)
}

solution("123456789")
solution("555372654")
solution("0 - 22 1985--324")

solution("01")
solution("012")
solution("0123")
solution("0123       444")
solution("------0123       444")



public func solution(_ A : [String], _ B : [String], _ P : String) -> String {
    var result = [String]()
    
    for i in 0..<B.count {
        if B[i].contains(P) {
            result.append(A[i])
        }
    }
    
    if result.count == 0 {
        return "NO CONTACT"
    } else if result.count == 1 {
        return result.first!
    }
    
    return result.sorted().first!
}

let A = ["pim", "pom"]
let B = ["999999999", "777888999"]
let P = "88999"

solution(A, B, P)
solution(["sander", "amy", "ann"], ["12345", "23456", "123"], "1")
solution(["ada,", "eva", "leo"], ["1212", "1111", "4444"], "112")
solution([String](), [String](), "")
solution(A, B, "")

public func solutionDict(_ A : [String], _ B : [String], _ P : String) -> String {

    var dict = [String: String]()
    
    for i in 0..<A.count {
        dict[A[i]] = B[i]
    }
    
    let matches = dict.filter { $0.value.contains(P) }
    
    if matches.count == 0 {
        return "NO CONTACT"
    } else if matches.count == 1 {
        return matches.first!.key
    }
    
    let sortedKeys = matches.keys.sorted()
    
    return sortedKeys.first!
}
