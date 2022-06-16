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
func reverseLinkedList(_ list: LinkedList<Int>) -> LinkedList<Int> {
    var tempList = LinkedList<Int>()

    for value in list {
        tempList.push(value)
    }
    return tempList
}

class LinkedListTests: XCTestCase {

    func test_reverseLinkedList() {
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
        nodes(of: list, isEqualTo: nodes(of: list))
        let empty = makeLinkList(from: [])
        nodes(of: empty, isEqualTo: nodes(of: empty))
    }

    //MARK: - Helper
    func expect_ReverseLinkedList(input numbers: [Int], shouldOutput reversedNumbers: [Int], file: StaticString = #file, line: UInt = #line) {
        guard numbers.count == reversedNumbers.count else {
            return XCTFail("number is not match")
        }
        let list = makeLinkList(from: numbers)
        let reversedList = reverseLinkedList(list)
        let reversedNodes = nodes(of: reversedList)
        let expectList = makeLinkList(from: reversedNumbers)
        let expectNodes = nodes(of: expectList)

        for i in 0..<reversedNodes.count {
            let node1 = reversedNodes[i]
            let node2 = expectNodes[i]
            XCTAssertTrue(node1?.value == node2?.value, "\(node1!) and \(node2!)")
        }
    }

    func nodes(of list: LinkedList<Int>, isEqualTo nodeArray: [Node<Int>?], file: StaticString = #file, line: UInt = #line) {
        var index = 0

        var currentNode = list.head
        while let node = currentNode {
            XCTAssertTrue(node === nodeArray[index], "\(node) != \(String(describing: nodeArray[index]))")
            index += 1
            currentNode = node.next
        }
    }

    func nodes(of list: LinkedList<Int>) -> [Node<Int>?] {
        var nodes: [Node<Int>?] = []
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

    func makeLinkedList(from start: Int = 0, to end: Int = 0, isShuffled: Bool = false) -> LinkedList<Int> {
        var linkList = LinkedList<Int>()
        var numbers: [Int] = []
        if end >= start {
            for i in start...end { numbers.append(i) }
        }
        let numberArray = isShuffled ? numbers.shuffled() : numbers
        for i in numberArray {
            linkList.append(i)
        }
        return linkList
    }

}
