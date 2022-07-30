import UIKit

func solutionQueueRight(A: [Int], K: Int) -> [Int] {
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

solutionQueueRight(A: [1, 2, 3, 4, 5] , K: 1)
solutionQueueRight(A: [1, 2, 3, 4, 5] , K: 2)
solutionQueueRight(A: [1, 2, 3, 4, 5] , K: 3)

solutionQueueRight(A: [3, 8, 9, 7, 6], K: 3)



func solutionQueueLeft(A: [Int], K: Int) -> [Int] {
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

solutionQueueLeft(A: [1, 2, 3, 4, 5], K: 1)
solutionQueueLeft(A: [1, 2, 3, 4, 5], K: 2)
solutionQueueLeft(A: [1, 2, 3, 4, 5], K: 3)

solutionQueueLeft(A: [3, 8, 9, 7, 6], K: 3)
