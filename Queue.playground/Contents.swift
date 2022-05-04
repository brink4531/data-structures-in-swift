import UIKit

struct Queue<T>: CustomStringConvertible {
    private var elements: [T] = []
    public init() { }
    
    var isEmpty: Bool { elements.isEmpty }
    var peek: T? { elements.first }
    
    var description: String {
        if isEmpty { return "Queue is empty..." }
        return "---- Queue start ----\n"
        + elements.map { $0 }.joined(separator: " -> ")
        + "\n---- Queue end ----"
    }
    
    mutating func dequeue() -> T? {
        isEmpty ? nil : elements.removeFirst()
    }
}
