//
//  SortArrayByParity.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 28/6/2022.
//  https://leetcode.com/explore/learn/card/fun-with-arrays/511/in-place-operations/3260/

import XCTest

class SortArrayByParity: XCTestCase {

    /// Given an integer array nums, move all the even integers at the beginning of the array followed by all the odd integers.
    ///
    /// Return any array that satisfies this condition.
    ///
    /// Constraints:
    ///  - 1 <= nums.length <= 5000
    ///  - 0 <= nums[i] <= 5000
    func sortArrayByParity(_ nums: [Int]) -> [Int] {
        var even: [Int] = []
        var odd: [Int] = []

        for n in nums {
            if n % 2 == 0 {
                even.append(n)
            } else {
                odd.append(n)
            }
        }
        return even + odd
    }

    func test_SortArrayByParity() {

        // Explanation: The outputs [4,2,3,1], [2,4,1,3], and [4,2,1,3] would also be accepted.
        check(input: [3,1,2,4], expect: [2,4,3,1])
        check(input: [0], expect: [0])
    }

    func check(input: [Int], expect: [Int]) {
        XCTAssertEqual(sortArrayByParity(input), expect)
    }
}
