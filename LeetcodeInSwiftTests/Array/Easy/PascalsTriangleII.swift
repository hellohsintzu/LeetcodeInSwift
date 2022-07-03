//
//  PascalsTriangleII.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 2/7/2022.
//  https://leetcode.com/problems/pascals-triangle-ii/

import XCTest

class PascalsTriangleII: XCTestCase {

    /// Given an integer rowIndex, return the rowIndexth (0-indexed) row of the Pascal's triangle.
    /// 
    /// Follow up: Could you optimize your algorithm to use only O(rowIndex) extra space?
    func getRow(_ rowIndex: Int) -> [Int] {
        guard rowIndex > 0 else { return [1] }
        var result: [Int] = [1]
        for _ in 1...rowIndex {
            result = processingSum(on: result)
        }
        return result
    }

    private func processingSum(on numbers: [Int]) -> [Int] {
        guard numbers.count > 1 else { return [1,1] }
        var result: [Int] = [1]
        for i in 0..<numbers.count {
            guard i+1 < numbers.count else { break }
            result.append(numbers[i] + numbers[i+1])
        }
        result.append(1)
        return result
    }

    /// Constraints:
    ///  - 0 <= rowIndex <= 33
    func test_GetRow() {
        check(input: 3, expect: [1,3,3,1])
        check(input: 0, expect: [1])
        check(input: 1, expect: [1,1])
    }

    func check(input: Int, expect: [Int]) {
        XCTAssertEqual(getRow(input), expect)
    }
}
