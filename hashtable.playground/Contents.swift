import UIKit
import Foundation

struct node {
    var data: String
    var hash: Int
    
    init(data: String) {
        self.data = data
        self.hash = data.hashValue
    }
}

class HashTable {
    var indexes: [node] = []
    
    func insert(_ value: String) {
        guard indexes.filter({ $0.data == value }).isEmpty else { return } // already here
        guard indexes.filter({ $0.hash == value.hashValue }).isEmpty else { return } // already here

        self.indexes.append(node(data: value))
    }
    
    func replace(value: String, with newValue: String) {
        guard let index = indexes.firstIndex(where: { $0.data == value }) else { return }
        indexes[index] = node(data: newValue)
    }
    
    func replace(hash: Int, with newValue: String) {
        guard let index = indexes.firstIndex(where: { $0.hash == newValue.hashValue }) else { return }
        indexes[index] = node(data: newValue)
    }
    
    func delete(_ value: String) {
        indexes.removeAll(where: { $0.data == value })
        indexes.removeAll(where: { $0.hash == value.hashValue })
    }
    
    func fetch(byIndex index: Int) -> node? {
        guard index < indexes.count else { return nil } // out of bounds
        return indexes[index]
    }

    func fetch(byData data: String) -> node? {
        return indexes.first(where: { $0.data == data })
    }
    
    func fetch(byHash hash: Int) -> node? {
        return indexes.first(where: { $0.hash == hash })
    }
    
    func print() {
        var count = 0
        Swift.print("================HASHTABLE=======================")
        indexes.forEach { node in Swift.print("[\(count): Data(\(node.data)), Hash(\(node.hash))]"); count += 1 }
        Swift.print("================================================")
    }
}



let hashTable = HashTable()

hashTable.insert("Hello Greeting")
hashTable.insert("Five FeetFingers")
hashTable.insert("Five HandFingers")
hashTable.insert("A Star is Movie")
hashTable.insert("Test Prep")
hashTable.insert("Hi Greeting")
hashTable.print()
hashTable.delete("Hi Greeting")
print(".delete(Hi Greeting)")
hashTable.print()
hashTable.delete("A Star is Movie")
print(".delete(A Star is Movie)")
hashTable.print()
print(".fetch(byHash: String(Five HandFingers).hashValue) -> \(String(describing: hashTable.fetch(byHash: "Five HandFingers".hashValue)))")
print(".fetch(byIndex: 2) -> \(String(describing: hashTable.fetch(byIndex: 2)))")
print(".fetch(byData: Hello Greeting) -> \(String(describing: hashTable.fetch(byData: "Hello Greeting")))")

print(".replace(value: Test Prep, with: Replacement Value)")
hashTable.replace(value: "Test Prep", with: "Replacement Value")
hashTable.print()
print(".insert(Hi Greeting)")
hashTable.insert("Hi Greeting")
hashTable.print()





//
//class HashTableNode<T> {
//    var value: T
//    var key: String
//    var nextNode: HashTableNode?
//
//    init(value: T, key: String) {
//        self.value = value
//        self.key = key
//    }
//}
//
//enum InsertionStatus { case success, collision, replacement }
//
//class HashTable<T> {
//    private var bucket: [HashTableNode<T>?]
//
//    init(bucketSize: Int) {
//        bucket = Array(repeating: nil, count: bucketSize)
//    }
//
//    // best case O(1), worst case O(n)
//    @discardableResult func addElement(_ element: T, forKey hashKey: String) -> InsertionStatus  {
//        let node = HashTableNode(value: element, key: hashKey)
//        let index = findIndex(forKey: hashKey)
//        var auxNode = bucket[index]
//        if auxNode == nil {
//            bucket[index] = node
//            return .success
//        }
//        while auxNode?.nextNode != nil {
//            if auxNode?.key == hashKey || auxNode?.nextNode?.key == hashKey {
//                auxNode = [auxNode, auxNode?.nextNode].first(where: {$0?.key == hashKey})!
//                auxNode?.value = element
//                return .replacement
//            }
//            auxNode = auxNode?.nextNode
//        }
//        auxNode?.nextNode = node
//        return .collision
//    }
//
//    // best case O(1), worst case O(n)
//    func getElement(forKey hashKey: String) -> T? {
//        let index = findIndex(forKey: hashKey)
//        var node = bucket[index]
//        while node != nil {
//            if node?.key == hashKey { return node?.value }
//            else {
//                node = node?.nextNode
//            }
//        }
//        return nil
//    }
//
//    // best case O(1), worst case O(n)
//    func deleteElementForKey(_ key: String) -> Bool {
//        let index = findIndex(forKey: key)
//        var node = bucket[index]
//        if node?.key == key {
//            bucket[index] = node?.nextNode
//            return true
//        }
//
//        while node?.nextNode != nil {
//            if node?.nextNode?.key == key {
//                node?.nextNode = node?.nextNode?.nextNode
//                return true
//            }
//            node = node?.nextNode
//        }
//
//        return false
//    }
//
//    private func findIndex(forKey hashKey: String) -> Int {
//        if hashKey.isEmpty { return -1 }
//        return hashKey.unicodeScalars.reduce(0, { $0 + Int($1.value) }) % bucket.count
//    }
//
//    public func printHashTable() {
//        var node: HashTableNode<T>?
//        for i in 0..<bucket.count {
//            print("values at section index \(i)")
//            node = bucket[i]
//            while node != nil {
//                print("value: \(node!.value)")
//                node = node?.nextNode
//            }
//        }
//    }
//}
//
//let hashTable = HashTable<String>(bucketSize: 5)
//
//hashTable.addElement("Hello", forKey: "Greeting")
//hashTable.addElement("Five", forKey: "FeetFingers")
//hashTable.addElement("Five", forKey: "HandFingers")
//hashTable.addElement("A Star is Born", forKey: "Movie")
//hashTable.addElement("Ça va?", forKey: "FrenchLesson")
//hashTable.addElement("Hi", forKey: "Greeting")
//hashTable.printHashTable()
//hashTable.deleteElementForKey("Greeting")
//print("======")
//hashTable.printHashTable()
//
//
