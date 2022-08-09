import Foundation

struct Queue<T> {
    private var array: [T]
    
    init() {
        array = []
    }
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    mutating func add(_ element: T) {
        array.append(element)
    }
    
    mutating func remove() -> T? {
        if isEmpty {
            return nil
        } else {
            return array.removeFirst()
        }
    }
    
    func peek() -> T? {
        return array.first
    }
}

struct Stack<T> {
    fileprivate var array = [T]()
    
    var isEmpty: Bool {
        return array.isEmpty
    }
    
    var count: Int {
        return array.count
    }
    
    mutating func push(_ element: T) {
        array.append(element)
    }
    
    mutating func pop() -> T? {
        return array.popLast()
    }
    
    var top: T? {
        return array.last
    }
}

class Graph {
    var V = 0
    var adj = [[Int]]()
    
    init(_ V: Int) {
        self.V = V
        for _ in 0..<V {
            adj.append([Int]())
        }
    }
    
    func addEdge(v: Int, w: Int) {
        adj[v].append(w)
    }
    
    func BFS(s: Int) -> [Int] {
        var result = [Int]()
        var visited = adj.map { _ in false }
        var queue = Queue<Int>()
        visited[s] = true
        print("Starting at \(s)")
        queue.add(s)
        result.append(s)
        
        while queue.count > 0 {
            let current = queue.remove()!
            print("De-queueing \(current)")
            
            for n in adj[current] {
                if visited[n] == false {
                    visited[n] = true
                    print("Queuing \(n)")
                    queue.add(n)
                    result.append(n)
                }
            }
        }
        return result
    }
    
    func DFS(s: Int) -> [Int] {
        var result = [Int]()
        var visited = adj.map { _ in false }
        var stack = Stack<Int>()
        visited[s] = true
        stack.push(s)
        
        while stack.count > 0 {
            let current = stack.pop()!
            result.append(current)
            
            for n in adj[current] {
                if visited[n] == false {
                    visited[n] = true {
                        stack.push(n)
                    }
                }
            }
        }
        return result
    }
}

let g = Graph(8)
g.addEdge(v: 0, w: 1)
g.addEdge(v: 1, w: 4)
g.addEdge(v: 4, w: 6)
g.addEdge(v: 6, w: 0)
g.addEdge(v: 1, w: 5)
g.addEdge(v: 5, w: 3)
g.addEdge(v: 3, w: 0)
g.addEdge(v: 5, w: 2)
g.addEdge(v: 2, w: 7)

print(g.DFS(s: 0))
