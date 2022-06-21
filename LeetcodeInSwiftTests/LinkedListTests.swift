//
//  LinkedListTests.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 13/6/2022.
//

import XCTest
import LeetcodeInSwift

/**
 Challenge 1: Print in reverse.

 1 -> 2 -> 3 -> nil

 should return [3, 2, 1]
 */
/// - Parameters:
///   - node: Should put linkedList head node.
///   - array: The array which collect numbers.
func printInReverseLinkedList(_ node: Node<Int>?, into array: inout [Int]) {
    guard let node = node else { return }
    printInReverseLinkedList(node.next, into: &array)
    array.append(node.value)
}

/**
 Challenge 2: Find the middle node.

1 -> 2 -> 3 -> 4 -> nil should return node with value 3

1 -> 2 -> 3 -> nil should return node with value 2
 */
/// - Parameter list: a LinkList
/// - Returns: the middle node of LinkList
func fundTheMiddleNode(from list: LinkedList<Int>) -> Node<Int>? {
    var faster = list.head
    var slower = list.head

    //`Faster` is twice faster than `slower`, once `faster` reach to the end, `slower` should be at the middle.
    while let fasterNext = faster?.next {
        faster = fasterNext.next
        slower = slower?.next
    }
    return slower
}

/// Challenge 3: Reverse a linked list
///
/// Create a function that reverses a linked list. You do this by manipulating the nodes so that they’re linked in the other direction.
///
/// before 1 -> 2 -> 3 -> nil
///
/// after 3 -> 2 -> 1 -> nil
func reverseLinkedList(_ list: inout LinkedList<Int>) {
    var prev = list.head    //First temp node reference container called `prev`.
    var current = list.head?.next   //Second temp node reference container called `current`.
    prev?.next = nil    //Due to we reversed the linkedList, `head` should become `tail`, and `tail` next should be nil.

    while current != nil {
        let next = current?.next    //third temp node reference container called `next`.
        current?.next = prev    //Link current node to previous node, so two node has reversed.
        prev = current  //move current to next one, so now `current` is next step's `prev`.
        current = next  //now, makes `next` to `current`, now we have moved the current to next now.
    }
    list.head = list.tail
}

///Challenge 4: Merge two lists
///
///Create a function that takes two sorted linked lists and merges them into a single sorted linked list.
///Your goal is to return a new linked list that contains the nodes from two lists in sorted order.
///You may assume the sort order is ascending.
///
/// list1:
///
/// 1 -> 4 -> 10 -> 11
///
/// list2:
///
/// -1 -> 2 -> 3 -> 6
///
/// merged list:
///
/// -1 -> 1 -> 2 -> 3 -> 4 -> 6 -> 10 -> 11
func mergeTwoLists(left: LinkedList<Int>, right: LinkedList<Int>) -> LinkedList<Int> {
    guard !left.isEmpty else { return right }
    guard !right.isEmpty else { return left }

    var newHead: Node<Int>?
    // Create a pointer to the tail of the new list you're adding to. This allows for constant-time append operations.
    var tail: Node<Int>?
    var currentLeft = left.head
    var currentRight = right.head
    // You compare the first node of left and right to assign newHead.
    if let leftNode = currentLeft, let rightNode = currentRight {
        if leftNode.value < rightNode.value {
            newHead = leftNode
            currentLeft = leftNode.next
        } else {
            newHead = rightNode
            currentRight = rightNode.next
        }
        tail = newHead  //Since there is only one node in list at this point, head and tail will be the same.
    }
    // Start merge
    // The while loop will keep continue until one of the list reaches the end.
    while let leftNode = currentLeft, let rightNode = currentRight {
        // Much like before, you compare the nodes to find out which node to connect to tail.
        if leftNode.value < rightNode.value {
            tail?.next = leftNode
            currentLeft = leftNode.next
        } else {
            tail?.next = rightNode
            currentRight = rightNode.next
        }
        tail = tail?.next   //Remember reset the tail after add node at the end of list.
    }

    if let leftNodes = currentLeft {
        tail?.next = leftNodes
    }

    if let rightNode = currentRight {
        tail?.next = rightNode
    }
    // Find the real tail after merge process has done. assign head and tail into new list.
    var list = LinkedList<Int>()
    list.head = newHead
    list.tail = {
        while let next = tail?.next {
            tail = next
        }
        return tail
    }()
    return list
}

class LinkedListTests: XCTestCase {

    func test_MergeTwoLists() {
        let test1 = ([1,4,10,11], [-1,2,3,6])
        expect_MergeTwoLists(numbers: test1)
        let test2 = ([Int](), [Int]())
        expect_MergeTwoLists(numbers: test2)
        let test3 = ([1,4,10,11], [Int]())
        expect_MergeTwoLists(numbers: test3)
        let test4 = ([Int](), [1,4,10,11])
        expect_MergeTwoLists(numbers: test4)
        let test5 = ([1], [1])
        expect_MergeTwoLists(numbers: test5)
        let test6 = ([1,2,3], [-3,-2,-1])
        expect_MergeTwoLists(numbers: test6)
    }

    func test_ReverseLinkedList() {
        let test1: [Int] = []
        expect_ReverseLinkedList(input: test1, shouldOutput: test1.reversed())
        let test2 = [1]
        expect_ReverseLinkedList(input: test2, shouldOutput: test2.reversed())
        let test3 = [1,2]
        expect_ReverseLinkedList(input: test3, shouldOutput: test3.reversed())
        let test4 = [1,2,3]
        expect_ReverseLinkedList(input: test4, shouldOutput: test4.reversed())
        let test5 = [1,2,3,4,5]
        expect_ReverseLinkedList(input: test5, shouldOutput: test5.reversed())
    }

    func test_FundTheMiddleNode() {
        let test1 = makeLinkList(from: [1,2,3,4])
        XCTAssertEqual(fundTheMiddleNode(from: test1)?.value, 3)

        let test2 = makeLinkList(from: [1,2,3])
        XCTAssertEqual(fundTheMiddleNode(from: test2)?.value, 2)

        let test3 = makeLinkList(from: [])
        XCTAssertEqual(fundTheMiddleNode(from: test3)?.value, nil)

        let test4 = makeLinkList(from: [1,2])
        XCTAssertEqual(fundTheMiddleNode(from: test4)?.value, 2)

        let test5 = makeLinkList(from: [1,2,3,4,5,6])
        XCTAssertEqual(fundTheMiddleNode(from: test5)?.value, 4)

        let test6 = makeLinkList(from: [1,2,3,4,5,6,7,8,9])
        XCTAssertEqual(fundTheMiddleNode(from: test6)?.value, 5)
    }

    func test_PrintInReverseLinkedList() {

        let test1 = [0,1,2,3,4,5,6,7,8,9]
        expect_PrintInReverseLinkedList(input: test1, willGet: test1.reversed())

        let test2 = [0,1,1,3,5,5,6,7,8,9].shuffled()
        expect_PrintInReverseLinkedList(input: test2, willGet: test2.reversed())

        let test3: [Int] = []
        expect_PrintInReverseLinkedList(input: test3, willGet: [])

        let test4: [Int]? = nil
        expect_PrintInReverseLinkedList(input: test4, willGet: [])

        let test5 = [0,0]
        expect_PrintInReverseLinkedList(input: test5, willGet: test5)

        let test6 = [0]
        expect_PrintInReverseLinkedList(input: test6, willGet: test6)
    }

    func test_NodesListIsEqualToNodeArray() {
        let list = makeLinkList(from: [1,2,3,4].shuffled())
        checkValue(ofList: list, isEqualToArray: nodesArray(of: list))
        let empty = makeLinkList(from: [])
        checkValue(ofList: empty, isEqualToArray: nodesArray(of: empty))
    }

    //MARK: - Helper
    func expect_MergeTwoLists(numbers: (list1: [Int], list2: [Int]), file: StaticString = #file, line: UInt = #line) {
        let list1 = makeLinkList(from: numbers.list1)
        let list2 = makeLinkList(from: numbers.list2)
        let expectNumbers = (numbers.list1 + numbers.list2).sorted()
        let expectList = makeLinkList(from: expectNumbers)
        let mergedList = mergeTwoLists(left: list1, right: list2)
        check(mergedList, isEqualTo: expectList)
    }

    func check(_ list: LinkedList<Int>, isEqualTo expectList: LinkedList<Int>, file: StaticString = #file, line: UInt = #line) {
        var node1 = list.head
        var node2 = expectList.head
        while node1 != nil || node2 != nil {
            if node1?.value != node2?.value { XCTFail("\n\(list)\n not equal to expect \n\(expectList)") }
            node1 = node1?.next
            node2 = node2?.next
        }
    }

    func expect_ReverseLinkedList(input numbers: [Int], shouldOutput reversedNumbers: [Int], file: StaticString = #file, line: UInt = #line) {
        guard numbers.count == reversedNumbers.count else {
            return XCTFail("number is not match")
        }
        var list = makeLinkList(from: numbers)
        reverseLinkedList(&list)
        let reversedNodes = nodesArray(of: list)
        let expectList = makeLinkList(from: reversedNumbers)
        let expectNodes = nodesArray(of: expectList)

        for i in 0..<reversedNodes.count {
            let node1 = reversedNodes[i]
            let node2 = expectNodes[i]
            XCTAssertTrue(node1.value == node2.value, "\n\(reversedNodes)\n and\n \(expectNodes)")
        }
    }

    func checkValue(ofList list: LinkedList<Int>, isEqualToArray nodeArray: [Node<Int>?], file: StaticString = #file, line: UInt = #line) {
        var index = 0

        var currentNode = list.head
        while let node = currentNode {
            XCTAssertTrue(node === nodeArray[index], "\(node) != \(String(describing: nodeArray[index]))")
            index += 1
            currentNode = node.next
        }
    }

    func nodesArray(of list: LinkedList<Int>) -> [Node<Int>] {
        var nodes: [Node<Int>] = []
        var currentNode =  list.head
        while let node = currentNode {
            nodes.append(node)
            currentNode = node.next
        }
        return nodes
    }

    func expect_PrintInReverseLinkedList(input numbers: [Int]?, willGet: [Int], file: StaticString = #file, line: UInt = #line) {
        let linkList = makeLinkList(from: numbers)
        var ans: [Int] = []
        printInReverseLinkedList(linkList.head, into: &ans)
        XCTAssertEqual(ans, willGet)
    }

    func makeLinkList(from numbers: [Int]?) -> LinkedList<Int> {
        var linkList = LinkedList<Int>()
        guard let numbers = numbers else {
            return linkList
        }
        
        for number in numbers {
            linkList.append(number)
        }
        return linkList
    }

}
