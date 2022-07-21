import UIKit

func findNemo(_ arr: [String]) {
    let before = Date()
    
    for i in 0..<arr.count {
        if arr[i] == "nemo" {
            print("Found him")
        }
    }
    
    let after = Date()
    let component = Calendar.current.dateComponents([.nanosecond], from: before, to: after)
    let milliSeconds: Double(component.nanosecond! / 1000000)
    print("Finding nemo took: \(milliSeconds)")
}
let nemo = ["nemo"]
let nemo = Array<String>(repeating: "", count: 1)
findNemo(nemo)



func constantTime(_ n: Int) -> Int {
    let result = n * n
    return result
}


func linearTime(_ A: [Int]) -> Int {
    for i in 0..<A.count {
        if A[i] == 0 {
            return 0
        }
//        print(i)
    }
    return 1
}
linearTime([1, 2, 3])


func logarithmicTime(_ N: Int) -> Int {
    var n = N
    var result = 0
    while n > 1 {
        n /= 2
        print(n)
        result += 1
    }
    return result
}
logarithmicTime(128)


func quadratic(_ n: Int) -> Int {
    var result = 0
    for i in 0..<n {
        for j in i..<n {
            result += 1
            print("\(i) \(j)")
        }
    }
    return result
}
quadratic(16)

var arr = [1, 2, 3]
arr.append(4)

var set = Set<Int>()
set.count



func commonItemsBrute(_ A: [Int], _ B: [Int]) -> Bool {
    for i in 0..<A.count {
        for j in 0..<B.count {
            if A[i] == B[j] {
                return true
            }
        }
    }
    return false
}
commonItemsBrute([1, 2, 3], [4, 5, 6])
commonItemsBrute([1, 2, 3], [3, 5, 6])


func commonItemsHash(_ A: [Int], _ B: [Int]) -> Bool {
    var hashA = [Int: Bool]()
    for a in A {
        hashA[a] = true
    }
    
    for b in B {
        if hashA[b] == true {
            return true
        }
    }
    return false
}
commonItemsHash([1, 2, 3], [4, 5, 6])
