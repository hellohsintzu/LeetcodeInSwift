//
//  PlusOne.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 2/7/2022.
//  https://leetcode.com/problems/plus-one/

import XCTest

class PlusOne: XCTestCase {

    /// You are given a large integer represented as an integer array digits, where each digits[i] is the ith digit of the integer. The digits are ordered from most significant to least significant in left-to-right order. The large integer does not contain any leading 0's.
    ///
    /// Increment the large integer by one and return the resulting array of digits.
    func plusOne(_ digits: [Int]) -> [Int] {
        var digits = digits
        for i in (0..<digits.count).reversed() {
            if digits[i] < 9 {
                digits[i] += 1
                return digits
            } else {
                digits[i] = 0
                if i == 0 {
                    digits.insert(1, at: 0)
                    return digits
                }
            }
        }
        return digits
    }

    /// Constraints:
    ///  - 1 <= digits.length <= 100
    ///  - 0 <= digits[i] <= 9
    ///  - digits does not contain any leading 0's.
    func test_PlusOne() {

        /**
         Explanation: The array represents the integer 123.
         Incrementing by one gives 123 + 1 = 124.
         Thus, the result should be [1,2,4].
         */
        check(input: [1,2,3], expect: [1,2,4])

        /**
         Explanation: The array represents the integer 4321.
         Incrementing by one gives 4321 + 1 = 4322.
         Thus, the result should be [4,3,2,2].
         */
        check(input: [4,3,2,1], expect: [4,3,2,2])

        /**
         Explanation: The array represents the integer 9.
         Incrementing by one gives 9 + 1 = 10.
         Thus, the result should be [1,0].
         */
        check(input: [9], expect: [1,0])
        check(input: [9,9], expect: [1,0,0])
        check(input: [9,8,7,6,5,4,3,2,1,0], expect: [9,8,7,6,5,4,3,2,1,1])
    }

    func check(input: [Int], expect: [Int]) {
        XCTAssertEqual(plusOne(input), expect)
    }
}
