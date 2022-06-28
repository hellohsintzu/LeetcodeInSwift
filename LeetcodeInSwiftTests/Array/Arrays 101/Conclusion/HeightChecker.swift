//
//  HeightChecker.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 28/6/2022.
//  https://leetcode.com/explore/learn/card/fun-with-arrays/523/conclusion/3228/

import XCTest

class HeightChecker: XCTestCase {

    /// A school is trying to take an annual photo of all the students. The students are asked to stand in a single file line in non-decreasing order by height. Let this ordering be represented by the integer array `expected` where `expected[i]` is the expected height of the `ith` student in line.
    ///
    /// You are given an integer array `heights` representing the current order that the students are standing in. Each `heights[i]` is the height of the `ith` student in line (0-indexed).
    ///
    /// Return the number of indices where `heights[i] != expected[i]`.
    ///
    /// Constraints:
    ///  - 1 <= heights.length <= 100
    ///  - 1 <= heights[i] <= 100
    func heightChecker(_ heights: [Int]) -> Int {
        let sortedHeights = heights.sorted()
        var diffCounter = 0
        for i in 0..<heights.count {
            if heights[i] != sortedHeights[i] {
                diffCounter += 1
            }
        }
        return diffCounter
    }

    func test_HeightChecker() {
        /**
         Explanation:
         heights:  [1,1,4,2,1,3]
         expected: [1,1,1,2,3,4]
         Indices 2, 4, and 5 do not match.
         */
        check(input: [1,1,4,2,1,3], expect: 3)

        /**
         Explanation:
         heights:  [5,1,2,3,4]
         expected: [1,2,3,4,5]
         All indices do not match.
         */
        check(input: [5,1,2,3,4], expect: 5)

        /**
         Explanation:
         heights:  [1,2,3,4,5]
         expected: [1,2,3,4,5]
         All indices match.
         */
        check(input: [1,2,3,4,5], expect: 0)
    }

    func check(input: [Int], expect: Int) {
        XCTAssertEqual(heightChecker(input), expect)
    }
}
