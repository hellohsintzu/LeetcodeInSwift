//
//  SquaresOfASortedArray.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 26/6/2022.
//  https://leetcode.com/explore/learn/card/fun-with-arrays/521/introduction/3240/

import XCTest

class SquaresOfASortedArray: XCTestCase {

    /// Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.
    ///
    /// Example 1:
    ///
    ///     Input: nums = [-4,-1,0,3,10]
    ///     Output: [0,1,9,16,100]
    ///
    /// Explanation:
    ///
    /// After squaring, the array becomes [16,1,0,9,100].
    ///
    /// After sorting, it becomes [0,1,9,16,100].
    ///
    /// Constraints:
    ///  - 1 <= nums.length <= 104
    ///  - -104 <= nums[i] <= 104
    ///  - nums is sorted in non-decreasing order.
    func sortedSquares(_ nums: [Int]) -> [Int] {
        var result = Array.init(repeating: 0, count: nums.count)
        for i in 0..<nums.count {
            result[i] = nums[i] * nums[i]
        }
        return result.sorted()
    }

    func test_SortedSquares() {
        check(input: [], expect: [])
        check(input: [3], expect: [9])
        check(input: [-4,-1,0,3,10], expect: [0,1,9,16,100])
        check(input: [-7,-3,2,3,11], expect: [4,9,9,49,121])
    }

    func check(input: [Int], expect: [Int]) {
        let result = sortedSquares(input)
        XCTAssertEqual(result, expect)
    }
}
