import Foundation
import XCTest

//class Node {
//    var key: Int = 0
//    var left: Node?
//    var right: Node?
//
//    init(_ key: Int) {
//        self.key = key
//    }
//}
//
//class BST {
//    var root: Node?
//
//    func insert(key: Int) {
//
//    }
//
//    private func insertedItem(_ node: Node?, _ key: Int) -> Node {
//        return Node(key)
//    }
//
//    func find(key: Int) -> Int? {
//        guard let root = root else { return nil }
//        guard let node = find(root, key) else { return nil }
//
//        return node.key
//    }
//
//    private func find(_ node: Node?, _ key: Int) -> Node? {
//        guard let node = node else { return nil }
//
//        if node.key == key {
//            return node
//        } else if key < node.key {
//            return find(node.left, key)
//        } else if key > node.key {
//            return find(node.right, key)
//        }
//        return nil
//    }
//
//    func findMin() -> Int {
//        return 0
//    }
//
//    private func findMin(_ node: Node) -> Node {
//        return Node(0)
//    }
//}
//
//let bst = BST()
//bst.insert(key: 5)
//bst.insert(key: 3)
//bst.insert(key: 2)
//bst.insert(key: 4)
//bst.insert(key: 7)
//bst.insert(key: 6)
//bst.insert(key: 8)
//
//bst.prettyPrinted()

//----

//class Node {
//    var key: Int = 0
//    var left: Node?
//    var right: Node?
//
//    init(_ key: Int) {
//        self.key = key
//    }
//
//    var min: Node {
//        if left == nil {
//            return self
//        } else {
//            return left!.min
//        }
//    }
//}
//
//class BST {
//    var root: Node?
//
//    func insert(key: Int) {
//        root = insertItem(root, key)
//    }
//
//    private func insertItem(_ node: Node?, _ key: Int) -> Node {
//        guard let node = node else {
//            let node = Node(key)
//            return node
//        }
//
//        if key < node.key {
//            node.left = insertItem(node.left, key)
//        }
//        if key > node.key {
//            node.right = insertItem(node.right, key)
//        }
//
//        return node
//    }
//
//    func find(key: Int) -> Int? {
//        guard let root = root else { return nil }
//        guard let node = find(root, key) else { return nil }
//
//        return node.key
//    }
//
//
//
//    private func find(_ node: Node?, _ key: Int) -> Node? {
//        guard let node = node else { return nil }
//
//        if node.key == key {
//            return node
//        } else if key < node.key {
//            return find(node.left, key)
//        } else if key > node.key {
//            return find(node.right, key)
//        }
//        return nil
//    }
//
//    func findMin() -> Int {
//        guard let root = root else { return 0 }
//        return findMin(root).key
//    }
//
//    private func findMin(_ node: Node) -> Node {
//        return node.min
//    }
//
//    func delete(key: Int) {
//        guard let _ = root else { return }
//        root = delete(&root, key)
//    }
//
//    private func delete(_ node: inout Node?, _ key: Int) -> Node? {
//        guard let nd = node else { return nil }
//
//        if key < nd.key {
//            nd.left = delete(&nd.left, key)
//        } else if key > nd.key {
//            nd.right = delete(&nd.right, key)
//        } else {
//
//            if nd.left == nil && nd.right == nil {
//                return nil
//            }
//
//            else if nd.left == nil {
//                return nd.right
//            }
//
//            else if nd.right == nil {
//                return nd.left
//            }
//
//            else {
//                let minRight = findMin(nd.right!)
//
//                nd.key = minRight.key
//
//                nd.right = delete(&nd.right, nd.key)
//            }
//        }
//
//        return nd
//    }
//
//    func prettyPrint() {
//        let rootLeftKey = root?.left == nil ? 0 : root?.left?.key
//        let rootRightKey = root?.right == nil ? 0 : root?.right?.key
//
//        var rootLeftLeftKey = 0
//        var rootLeftRightKey = 0
//
//        if root?.left != nil {
//            rootLeftLeftKey = root?.left?.left == nil ? 0 : root?.left?.left?.key as! Int
//            rootLeftRightKey = root?.left?.right == nil ? 0 : root?.left?.right?.key as! Int
//        }
//
//        var rootRightLeftKey = 0
//        var rootRightRightKey = 0
//
//        if root?.right != nil {
//            rootRightLeftKey = root?.right?.left == nil ? 0 : root?.right?.left?.key as! Int
//            rootRightRightKey = root?.right?.right == nil ? 0 : root?.right?.right?.key as! Int
//        }
//
//        let str = """
//            \(root!.key)
//            /\\
//            \(rootLeftKey!) \(rootRightKey!)
//           /\\ /\\
//        \(rootLeftLeftKey) \(rootLeftRightKey) \(rootRightLeftKey) \(rootRightRightKey)
//        """
//
//        print(str)
//    }
//
//
//    func printInOrderTraversal() { inOrderTraversal(node: root) }
//
//    func inOrderTraversal(node: Node?) {
//        guard let node = node else { return }
//        inOrderTraversal(node: node.left)
//        print(node.key)
//        inOrderTraversal(node: node.right)
//    }
//
//    func printPreOrderTraversal() { preOrderTraversal(node: root) }
//
//    func preOrderTraversal(node: Node?) {
//        guard let node = node else { return }
//        print(node.key)
//        preOrderTraversal(node: node.left)
//        preOrderTraversal(node: node.right)
//    }
//
//    func printPostOrderTraversal() { postOrderTraversal(node: root) }
//
//    func postOrderTraversal(node: Node?) {
//        guard let node = node else { return }
//        postOrderTraversal(node: node.left)
//        postOrderTraversal(node: node.right)
//        print(node.key)
//    }
//}
//
//class BSTTests: XCTestCase {
//    var bst: BST!
//    override func setUp() {
//        super.setUp()
//        bst = BST()
//    }
//
//    func testInsert() {
//        bst.insert(key: 5)
//        bst.insert(key: 3)
//        bst.insert(key: 2)
//        bst.insert(key: 4)
//        bst.insert(key: 7)
//        bst.insert(key: 6)
//        bst.insert(key: 8)
//
//        bst.prettyPrint()
//
//        XCTAssertNotNil(bst.find(key: 5))
//        XCTAssertNotNil(bst.find(key: 3))
//        XCTAssertNotNil(bst.find(key: 2))
//        XCTAssertNotNil(bst.find(key: 4))
//        XCTAssertNotNil(bst.find(key: 7))
//        XCTAssertNotNil(bst.find(key: 6))
//        XCTAssertNotNil(bst.find(key: 8))
//    }
//
//    func testDeleteNoChild() {
//        bst.insert(key: 5)
//        bst.insert(key: 3)
//        bst.insert(key: 2)
//        bst.insert(key: 4)
//        bst.insert(key: 7)
//        bst.insert(key: 6)
//        bst.insert(key: 8)
//
//        XCTAssertNotNil(bst.find(key: 2))
//        bst.delete(key: 2)
//        XCTAssertNil(bst.find(key: 2))
//
//        XCTAssertNotNil(bst.find(key: 5))
//        XCTAssertNotNil(bst.find(key: 3))
//        XCTAssertNotNil(bst.find(key: 4))
//        XCTAssertNotNil(bst.find(key: 7))
//        XCTAssertNotNil(bst.find(key: 6))
//        XCTAssertNotNil(bst.find(key: 8))
//    }
//
//    func testDeleteOneChild() {
//        bst.insert(key: 5)
//        bst.insert(key: 3)
//        bst.insert(key: 2)
//        bst.insert(key: 4)
//        bst.insert(key: 7)
//        bst.insert(key: 6)
////        bst.insert(key: 8)
//
//        XCTAssertNotNil(bst.find(key: 2))
//        bst.delete(key: 7)
//        XCTAssertNil(bst.find(key: 7))
//
//        XCTAssertNotNil(bst.find(key: 5))
//        XCTAssertNotNil(bst.find(key: 3))
//        XCTAssertNotNil(bst.find(key: 4))
//        XCTAssertNotNil(bst.find(key: 6))
//    }
//
//    func testDeleteTwoChildren() {
//        bst.insert(key: 5)
//        bst.insert(key: 3)
//        bst.insert(key: 2)
//        bst.insert(key: 4)
//        bst.insert(key: 7)
//        bst.insert(key: 6)
//        bst.insert(key: 8)
//
//        XCTAssertNotNil(bst.find(key: 2))
//        bst.delete(key: 7)
//        XCTAssertNotNil(bst.find(key: 7))
//
//        XCTAssertNotNil(bst.find(key: 5))
//        XCTAssertNotNil(bst.find(key: 3))
//        XCTAssertNotNil(bst.find(key: 4))
//        XCTAssertNotNil(bst.find(key: 6))
//        XCTAssertNotNil(bst.find(key: 8))
//    }
//}
//
//class TestObserver: NSObject, XCTestObservation {
//    func testCase(_ testCase: XCTestCase,
//                  didFailWithDescription description: String,
//                  inFile filePath: String?,
//                  atLine lineNumber: Int) {
//        assertionFailure(description, line: UInt(lineNumber))
//    }
//}
//
//let testObserver = TestObserver()
//XCTestObservationCenter.shared.addTestObserver(testObserver)
//BSTTests.defaultTestSuite.run()

// ----


//class Node {
//    var data: Int = 0
//    var left: Node?
//    var right: Node?
//
//    init(_ key: Int) {
//        self.data = key
//    }
//
//    func height() -> Int {
//        if isLeaf {
//            return 0
//        } else {
//            return 1 + max(left?.height() ?? 0, right?.height() ?? 0)
//        }
//    }
//
//    var isLeaf: Bool {
//        return left == nil && right == nil
//    }
//}
//
//let root = Node(20)
//root.left = Node(8)
//root.right = Node(22)
//root.left?.left = Node(4)
//root.left?.right = Node(12)
//root.left?.right?.left = Node(10)
//root.left?.right?.right = Node(14)
//
//root.height()
//
//class Tree {
//    var x: Int = 0
//    var l: Tree?
//    var r: Tree?
//
//    init(_ key: Int) {
//        self.x = key
//    }
//}
//
//func solution(_ T: Tree?) -> Int {
//    return height(T!)
//}
//
//func height(_ tree: Tree?) -> Bool {
//    return tree?.1 = nil && tree?.r = nil
//}
//
//func height(_ tree: Tree?) -> Int {
//    if isLeaf(tree) {
//        return 0
//    } else {
//        return 1 + max(height(tree?.l ?? nil), height(tree?.r ?? nil))
//    }
//}
//
//class Tests: XCTestCase {
//
//    func testHeightOfZero() {
//        let root = Node(5)
//        XCTAssert(0, root.height())
//    }
//
//    func testHeightOfTwo() {
//        let root = Node(5)
//        root.left = Node(3)
//        root.right = Node(10)
//        root.left?.left = Node(20)
//        root.left?.right = Node(21)
//        root.right?.left = Node(1)
//
//        XCTAssertEqual(2, root.height())
//    }
//
//    func testHeightOfThree() {
//        let tree = Tree(20)
//        tree.l = Tree(8)
//        tree.r = Tree(22)
//        tree.l?. = Tree(4)
//        tree.l?.r = Tree(12)
//        tree.l?.r?.l = Tree(10)
//        tree.l?.r?.r = Tree(14)
//
//        XCTAssertEqual(3, solution(tree))
//    }
//}
//
//class TestObserver: NSObject, XCTestObservation {
//    func testCase(_ testCase: XCTestCase,
//                  didFailWithDescription description: String,
//                  inFile filePath: String?,
//                  atLine lineNumber: Int) {
//        assertionFailure(description, line: UInt(lineNumber))
//    }
//}
//
//let testObserver = TestObserver()
//XCTestObservationCenter.shared.addTestObserver(testObserver)
//Tests.defaultTestSuite.run()


// ----

class Node {
    var data: Int = 0
    var left: Node?
    var right: Node?
    
    init(_ key: Int) {
        self.data = key
    }
}

class BinaryTree {
    var root: Node?
    
    func lca(_ node: Node?, _ n1: Int, _ n2: Int) -> Node? {
        if node == nil { return nil }
        
        if node!.data > n1 && node!.data > n2 {
            return lca(node?.left, n1, n2)
        }
        
        if node!.data < n1 && node!.data < n2 {
            return lca(node?.rightt, n1, n2)
        }
        
        return node
    }
}

let tree = BinaryTree()
tree.root = Node(20)
tree.root?.left = Node(8)
tree.root?.right = Node(22)
tree.root?.left?.left = Node(4)
tree.root?.left?.right = Node(12)
tree.root?.left?.right?.left = Node(10)
tree.root?.left?.right?.right = Node(14)

var n1 = 10, n2 = 14
var t = tree.lca(tree.root, n1, n2)
print("LCA of \(n1) and \(n2) is \(String(describing: t?.data))")

n1 = 14; n2 = 8
t = tree.lca(tree.root, n1, n2)
print("LCA of \(n1) and \(n2) is \(String(describing: t?.data))")

n1 = 10; n2 = 22
t = tree.lca(tree.root, n1, n2)
print("LCA of \(n1) and \(n2) is \(String(describing: t?.data))"
