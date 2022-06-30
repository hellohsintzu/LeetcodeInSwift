//
//  FindAllNumbersDisappearedInAnArray.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 28/6/2022.
//  https://leetcode.com/explore/learn/card/fun-with-arrays/523/conclusion/3270/

import XCTest

class FindAllNumbersDisappearedInAnArray: XCTestCase {

    /// Given an array `nums` of `n` integers where `nums[i]` is in the range `[1, n]`, return an array of all the integers in the range `[1, n]` that do not appear in `nums`.
    ///
    ///  Follow up: Could you do it without extra space and in O(n) runtime? You may assume the returned list does not count as extra space.
    func findDisappearedNumbers(_ nums: [Int]) -> [Int] {
        // If the current number is "n", then make index "n-1" negative to signify "n" exists
        var nums = nums
        for i in 0 ..< nums.count {
            let n = abs(nums[i])
            if nums[n - 1] >= 0 {
                nums[n - 1] = -nums[n - 1]
            }
        }

        // If the number at index "i" is positive, then number "i+1" was missing
        var missing = [Int]()
        for i in 0 ..< nums.count {
            if nums[i] >= 0 {
                missing.append(i+1)
            }
        }
        return missing
    }
    /// Constraints
    ///  - n == nums.length
    ///  - 1 <= n <= 105
    ///  - 1 <= nums[i] <= n
    func test_FindDisappearedNumbers() {
        check(input: [4,3,2,7,8,2,3,1], expect: [5,6])
        check(input: [1,1], expect: [2])
    }

    func check(input: [Int], expect: [Int]) {
        XCTAssertEqual(findDisappearedNumbers(input), expect)
    }
}
