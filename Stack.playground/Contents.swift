import Foundation

struct Stack {
    private var items: [String] = []
    
    func peek() -> String {
        guard let topElement = items.first else { fatalError("This stack is empty.") }
        return topElement
    }
    
    mutating func pop() -> String {
        return items.removeFirst()
    }
    
    mutating func push(_ element: String) {
        items.insert(element, at: 0)
    }
}

var nameStack = Stack()
print(nameStack)

nameStack.push("Caleb")
nameStack.push("Charles")
nameStack.push("Tina")
print(nameStack)

nameStack.peek()
print(nameStack)

nameStack.pop()
print(nameStack)

extension Stack: CustomStringConvertible {
    var description: String {
        let topDivider = "---Stack---\n"
        let bottomDivider = "\n-----------\n"

        let stackElements = items.joined(separator: "\n")

        return topDivider + stackElements + bottomDivider
    }
}
