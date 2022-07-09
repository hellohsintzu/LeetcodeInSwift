//
//  FindNumbersWithEvenNumberOfDigits.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 22/6/2022.
//  https://leetcode.com/explore/learn/card/fun-with-arrays/521/introduction/3237/

import XCTest

class FindNumbersWithEvenNumberOfDigits: XCTestCase {

    /// Given an array nums of integers, return how many of them contain an even number of digits.
    ///
    /// Input: nums = [12,345,2,6,7896]
    ///
    /// Output: 2
    ///
    /// Explanation:
    ///
    ///     12 contains 2 digits (even number of digits).
    ///     345 contains 3 digits (odd number of digits).
    ///     2 contains 1 digit (odd number of digits).
    ///     6 contains 1 digit (odd number of digits).
    ///     7896 contains 4 digits (even number of digits).
    ///     Therefore only 12 and 7896 contain an even number of digits.
    func findNumbers(_ nums: [Int]) -> Int {
        var count = 0
        for num in nums {
            print("HSIN: \(num), \(Int(log10(Double(num))) % 2 )")
            if Int(log10(Double(num))) % 2 != 0 {
                count += 1
            }
        }
        return count
    }

    ///  Constraints
    ///  - 1 <= nums.length <= 500
    ///  - 1 <= nums[i] <= 105
    func test_findNumbers() {
        check(input: [12,345,2,6,7896], expect: 2)
        check(input: [555,901,482,1771], expect: 1)
        check(input: [], expect: 0)
        check(input: [1], expect: 0)
        check(input: [11], expect: 1)
    }

    func check(input: [Int], expect: Int) {
        let result = findNumbers(input)
        XCTAssertEqual(result, expect)
    }
}
