import Foundation

public struct Stack<Element> {
    private var storage: [Element] = []

    public mutating func push(_ element: Element) {
        storage.append(element)
    }

    public init() {}

    @discardableResult
    public mutating func pop() -> Element? {
        storage.popLast()
    }

    func isEmpty() -> Bool {
        storage.isEmpty
    }
}

extension Stack: CustomDebugStringConvertible {
    public var debugDescription: String {
        """
        ---top---
        \(storage.map({"\($0)"}).reversed().joined(separator: "\n"))
        ---------
        """
    }
}

//MARK: - Challenge
extension Array where Element == Int {
    /// Challenge 1: Reverse an Array
    ///
    /// Create a function that uses a stack to print the contents of an array in reversed order.
    /// - Parameter array: Give the array which will print in reversed order
    public func reversedByStack() -> [Int] {
        var stack = Stack<Int>()
        for value in self {
            stack.push(value)
        }
        var reversedArray: [Int] = []
        while !stack.isEmpty() {
            reversedArray.append(stack.pop()!)
        }
        return reversedArray
    }
}

extension String {
    /// Challenge 2: Balance the parentheses.
    ///
    /// Check for balanced parentheses. Given a string, check if there are ( and ) characters, and return true if the parentheses in the string are balanced.
    /// 1. h((e))llo(world)() -> balanced parentheses
    /// 2. (hello world -> unbalanced parentheses
    /// - Parameter string: String you want to check
    /// - Returns: is parentheses or not
    public func isParentheses() -> Bool {
        var stack = Stack<Character>()
        guard self.contains(Character("(")) else { return false }
        for character in self {
            if character == "(" {
                stack.push(character)
            } else if character == ")" {
                if stack.isEmpty() {
                    return false
                } else {
                    stack.pop()
                }
            }
        }
        return stack.isEmpty()
    }
}
