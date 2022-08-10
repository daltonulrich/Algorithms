import UIKit


class MinStack {
    private class Node {
        var data: Int
        var min: Int
        var next: Node?
        
        init(_ data: Int, _ min: Int, _ next: Node? = nil) {
            self.data = data
            self.min = min
            self.next = next
        }
    }
    
    private var head: Node?
    
    func push(_ data: Int) {
        var currentMin = data
        
        if head != nil {
            currentMin = Swift.min(data, min())
        }
        let newNode = Node(data, currentMin)
        newNode.next = head
        head = newNode
    }
    
    func pop() -> Int? {
        let data = head?.data
        head = head?.next
        return data
    }
    
    func min() -> Int { return head!.min }
}

let stack = MinStack()

stack.push(5)
stack.push(6)
stack.push(3)
stack.push(7)
stack.min()
stack.pop()
stack.min()
stack.pop()
stack.min()
