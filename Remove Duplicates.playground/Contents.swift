import UIKit

func printLinkedListSimple(_ head: Node?) {
    if head == nil { return }
    
    var node = head
    print(node!.data)
    
    while node?.next != nil {
        print(node!.next!.data)
        node = node?.next
    }
}

class Node {
    var data: Int
    var next: Node?
    
    init(_ data: Int, _ next: Node? = nil) {
        self.data = data
        self.next = next
    }
}

func removeDuplicates(_ head: Node?) {
    var uniques = Set<Int>()
    var previous: Node? = nil
    var current = head
    
    while current != nil {
        if uniques.contains(current!.data) {
            previous!.next = current!.next
        } else {
            uniques.insert(current!.data)
            previous = current
        }
        current = current!.next
    }
}

let node3 = Node(3)
let node2 = Node(2, node3)
let node1 = Node(1, node2)
node3.next = Node(1)
printLinkedListSimple(node1)
print("===")
removeDuplicates(node1)
printLinkedListSimple(node1)
