//
//  MoveZeroes.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 28/6/2022.
//  https://leetcode.com/explore/learn/card/fun-with-arrays/511/in-place-operations/3157/

import XCTest

class MoveZeroes: XCTestCase {

    /// Given an integer array `nums`, move all 0's to the end of it while maintaining the relative order of the non-zero elements.
    ///
    /// Note that you must do this in-place without making a copy of the array.
    ///
    ///  Follow up: Could you minimize the total number of operations done?
    func moveZeroes(_ nums: inout [Int]) {
        var result = Array.init(repeating: 0, count: nums.count)
        var i = 0
        for n in nums {
            if n != 0 {
                result[i] = n
                i += 1
            }
        }
        nums = result
    }

    /// Constraints
    ///  - 1 <= nums.length <= 104
    ///  - -231 <= nums[i] <= 231 - 1
    func test_MoveZeroes() {
        check(input: [0,1,0,3,12], expect: [1,3,12,0,0])
        check(input: [0], expect: [0])
    }

    func check(input: [Int], expect: [Int]) {
        var inputArray = input
        moveZeroes(&inputArray)
        XCTAssertEqual(inputArray, expect)
    }
}
