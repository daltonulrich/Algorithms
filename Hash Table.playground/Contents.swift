import UIKit

let stringsAreHashable = "abc".hashValue

struct GridPoint {
    var x: Int
    var y: Int
    
    var hashValue: Int {
        return x.hashValue ^ y.hashValue &* 16777619
    }
}

let mainBase = GridPoint(x: 131, y: 541)
let hashCode = mainBase.hashValue

let even = 2 % 2
let odd = 3 % 2
let initialSize = 16
let index = hashCode % initialSize
let indexPositive = abs(index)


class HashEntry {
    var key: String
    var value: String
    var next: HashEntry?
    
    init(_ key: String, _ value: String) {
        self.key = key
        self.value = value
    }
}

class HashTable {
    private static let initialSize = 256
    private var entries = Array<HashEntry?>(repeating: nil, count: initialSize)
    
    func put(_ key: String, _ value: String) {
        let index = getIndex(key)
        
        let entry = HashEntry(key, value)
        
        if entries[index] == nil {
            entries[index] = entry
        }
        else {
            var collisions = entries[index]
            
            while collisions?.next != nil {
                collisions = collisions?.next
            }
            
            collisions?.next = entry
        }
    }
    
    func get(_ key: String) -> String? {
        let index = getIndex(key)
        
        let possibleCollisions = entries[index]
        
        var currentEntry = possibleCollisions
        while currentEntry != nil {
            if currentEntry?.key == key {
                return currentEntry?.value
            }
            currentEntry = currentEntry?.next
        }
        
        return nil
    }
    
    private func getIndex(_ key: String) -> Int {
        let hashCode = abs(key.hashValue)
        
        let index = hashCode % HashTable.initialSize
        print("\(key) \(hashCode) \(index)")
        
        if key == "John Smith" || key == "Sandra Dee" {
            return 152
        }
        
        return index
    }

    func prettyPrint() {
        for entry in entries {
            if entry == nil {
                continue
            }
            if entry?.next == nil {
                print("key: \(String(describing: entry?.key)) value: \(String(describing: entry?.value))")
            } else {
                var currentEntry = entry
                while currentEntry?.next != nil {
                    print("💥 key: \(String(describing: currentEntry?.key)) value: \(String(describing: currentEntry?.value))")
                    currentEntry = currentEntry?.next
                }
                print("💥 key: \(String(describing: currentEntry?.key)) value: \(String(describing: currentEntry?.value))")
            }
        }
    }
    
    subscript(key: String) -> String? {
        get {
            get(key)
        }
        set(newValue) {
            guard let value = newValue else { return }
            put(key, value)
        }
    }
}

let hashTable = HashTable()
hashTable.put("John Smith", "521-1234")
hashTable.put("Lisa Smith", "521-8976")
hashTable.put("Sam Doe", "521-5030")
hashTable.put("Sandra Dee", "521-9655")
hashTable.put("Ted Baker", "418-4165")

hashTable.prettyPrint()

hashTable.get("John Smith")
hashTable.get("Lisa Smith")
hashTable.get("Sam Doe")
hashTable.get("Sandra Dee")
hashTable.get("Ted Baker")
hashTable.get("Tim Lee")

hashTable["Kevin Flynn"] = "The grid"
hashTable["Kevin Flynn"]
Footer
