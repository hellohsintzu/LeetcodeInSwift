//
//  ContainsDuplicate.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 2/7/2022.
//  https://leetcode.com/problems/contains-duplicate/

import XCTest

class ContainsDuplicate: XCTestCase {

    /// Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.
    func containsDuplicate(_ nums: [Int]) -> Bool {
        let s = Set(nums)
        return s.count != nums.count
    }

    /// Constraints:
    ///  - 1 <= nums.length <= 10^5
    ///  - -10^9 <= nums[i] <= 10^9
    func test_ContainsDuplicate() {
        check(input: [1,2,3,1], expect: true)
        check(input: [1,2,3,4], expect: false)
        check(input: [1,1,1,3,3,4,3,2,4,2], expect: true)
    }

    func check(input: [Int], expect: Bool) {
        XCTAssertEqual(containsDuplicate(input), expect)
    }
}
