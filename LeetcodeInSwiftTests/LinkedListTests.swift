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
func reverseLinkedList(_ node: Node<Int>?, into array: inout [Int]) {
    guard let node = node else { return }
    reverseLinkedList(node.next, into: &array)
    array.append(node.value)
}

class LinkedListTests: XCTestCase {

    func test_ReverseLinkedList() {

        let test1 = [0,1,2,3,4,5,6,7,8,9]
        expect_ReverseLinkedList(input: test1, willGet: test1.reversed())

        let test2 = [0,1,1,3,5,5,6,7,8,9].shuffled()
        expect_ReverseLinkedList(input: test2, willGet: test2.reversed())

        let test3: [Int] = []
        expect_ReverseLinkedList(input: test3, willGet: [])

        let test4: [Int]? = nil
        expect_ReverseLinkedList(input: test4, willGet: [])

        let test5 = [0,0]
        expect_ReverseLinkedList(input: test5, willGet: test5)

        let test6 = [0]
        expect_ReverseLinkedList(input: test6, willGet: test6)
    }

    //MARK: - Helper
    func expect_ReverseLinkedList(input numbers: [Int]?, willGet: [Int], file: StaticString = #file, line: UInt = #line) {
        let linkList = makeLinkList(from: numbers)
        var ans: [Int] = []
        reverseLinkedList(linkList.head, into: &ans)
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
