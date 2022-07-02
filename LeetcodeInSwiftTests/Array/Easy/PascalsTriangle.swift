//
//  PascalsTriangle.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 2/7/2022.
//  https://leetcode.com/problems/pascals-triangle/

import XCTest

class PascalsTriangle: XCTestCase {

    /// Given an integer numRows, return the first numRows of Pascal's triangle.
    func generate(_ numRows: Int) -> [[Int]] {
        var temp: [Int] = [1]
        var result: [[Int]] = []
        for _ in 1...numRows {
            result.append(temp)
            temp = processingSum(on: temp)
        }
        return result
    }

    //Sum every element with next element in Array
    private func processingSum(on array: [Int]) -> [Int] {
        //Put 1 in empty array first instead of insert 0
        //insert at 0 will move all of the element index in array.
        var temp: [Int] = [1]   //Set a `1` at first
        for i in 0..<array.count {
            if i+1 > array.count - 1 { break }
            temp.append(array[i] + array[i+1])
        }
        temp.append(1)          //Add a `1` at last before return
        return temp
    }

    /// Constraints:
    /// - 1 <= numRows <= 30
    func test_generate() {
        check(input: 5, expect: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]])
        check(input: 1, expect: [[1]])
    }

    func check(input: Int, expect: [[Int]]) {
        XCTAssertEqual(generate(input), expect)
    }
}
