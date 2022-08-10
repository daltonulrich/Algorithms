import UIKit


class Node {
    var key: Int
    var left: Node?
    var right: Node?
    
    init(_ data: Int) {
        self.key = data
    }
}

func getOrder(_ root: Node) -> String {
    var result = ""
    preOrderTraversal(root, &result)
    return result
}

func preOrderTraversal(_ node: Node?, _ result: inout String) {
    guard let node = node else { return }
    result.append(String(node.key))
    preOrderTraversal(node.left, &result)
    preOrderTraversal(node.right, &result)
}

let root = Node(5)
root.left = Node(3)
root.right = Node(7)
root.left?.left = Node(2)
root.left?.right = Node(4)
root.right?.left = Node(6)
root.right?.right = Node(8)

let rootOrder = getOrder(root)

let subTree = Node(7)
subTree.left = Node(6)
subTree.right = Node(8)

let subTreeOrder = getOrder(subTree)

func isSubTree(_ tree: Node, _ subTree: Node) -> Bool {
    let rootOrder = getOrder(root)
    let subTreeOrder = getOrder(subTree)
    
    return rootOrder.contains(subTreeOrder)
}

isSubTree(root, subTree)
