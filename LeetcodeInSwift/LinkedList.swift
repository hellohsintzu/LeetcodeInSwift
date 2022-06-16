import Foundation

public class Node<Value> {
    public var value: Value
    public var next: Node?

    public init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomDebugStringConvertible {
    public var debugDescription: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + ""
    }
}

public struct LinkedList<Value> {
    public var head: Node<Value>?
    public var tail: Node<Value>?

    public var isEmpty: Bool {
        head == nil
    }

    public init() {}

    /// Adds value at the front of the list.
    public mutating func push(_ value: Value) {
        copyNodes()
        let node = Node(value: value, next: head)
        head = node
        if tail == nil {
            tail = head
        }
    }

    /// Adds a value at the end of the list.
    public mutating func append(_ value: Value) {
        copyNodes()
        let node = Node(value: value)
        guard !isEmpty else {
            push(value)
            return
        }
        tail?.next = node
        tail = node
    }

    public func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0

        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        return currentNode
    }


    @discardableResult
    /// Adds a value after a particular list node.
    public mutating func insert(_ value: Value,
                       after node: Node<Value>) -> Node<Value>? {
        copyNodes()
        guard tail !== node else {
            append(value)
            return tail
        }
        node.next = Node(value: value, next: node.next)
        return node.next
    }

    @discardableResult
    /// Removes the value at the front of the list.
    public mutating func pop() -> Value? {
        copyNodes()
        defer {
            head = head?.next
            if isEmpty {
                tail = nil
            }
        }
        return head?.value
    }

    @discardableResult
    /// Removes the value at the end of the list.
    public mutating func removeLast() -> Value? {
        copyNodes()
        if isEmpty { return nil }
        guard head?.next != nil else {
            return pop()
        }
        var prev = head
        var current = head
        while let next = current?.next {
            prev = current
            current = next
        }
        prev?.next = nil
        tail = prev
        return current?.value
    }

    @discardableResult
    /// Removes the value anywhere in the list.
    public mutating func remove(after node: Node<Value>?) -> Value? {
        guard let node = copyNodes(returningCopyOf: node) else { return nil }
        defer {
            node.next = node.next?.next
            if node.next === tail {
                tail = node
            }
        }
        return node.next?.value
    }

}

extension LinkedList: Collection {

    public var startIndex: Index {
        Index(node: head)
    }

    public var endIndex: Index {
        Index(node: tail?.next)
    }

    public func index(after i: Index) -> Index {
        Index(node: i.node?.next)
    }

    public subscript(position: Index) -> Value {
        position.node!.value
    }

    //MARK: Define a custom index to fulfill above Collection requirements.
    public struct Index: Comparable {
        public var node: Node<Value>?

        public static func < (lhs: LinkedList<Value>.Index, rhs: LinkedList<Value>.Index) -> Bool {
            guard lhs != rhs else { return false }
            let nodes = sequence(first: lhs.node, next: { $0?.next })
            return nodes.contains { $0 === rhs.node }
        }

        public static func == (lhs: LinkedList<Value>.Index, rhs: LinkedList<Value>.Index) -> Bool {
            switch (lhs.node, rhs.node) {
            case let (left?, right?):
                return left.next === right.next
            case (nil, nil):
                return true
            default:
                return false
            }
        }
    }
}

//MARK: - Apply copy on write(COW) for make linked list has value semantics.
extension LinkedList {
    private mutating func copyNodes() {
        //Makes O(n) in every mutating call is unacceptable. need to avoid copying when the node has only one owner. p.73
        guard !isKnownUniquelyReferenced(&head) else { return }

        guard var oldNode = head else { return }
        head = Node(value: oldNode.value)
        var newNode = head

        while let nextOldNode = oldNode.next {
            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode?.next
            oldNode = nextOldNode
        }
        tail = newNode
    }

    /// Return the newly copied node based on the passed in parameter.
    private mutating func copyNodes(returningCopyOf node: Node<Value>?) -> Node<Value>? {
        guard !isKnownUniquelyReferenced(&head),
              var oldNode = head else { return nil }
        head = Node(value: oldNode.value)
        var newNode = head
        var nodeCopy: Node<Value>?

        while let nextOldNode = oldNode.next {
            if oldNode === node {
                nodeCopy = newNode
            }
            newNode!.next = Node(value: nextOldNode.value)
            newNode = newNode!.next
            oldNode = nextOldNode
        }
        return nodeCopy
    }
}

extension LinkedList: CustomDebugStringConvertible {
    public var debugDescription: String {
        guard !self.isEmpty else {
            return "Empty list"
        }
        return String(describing: head!)
    }
}

