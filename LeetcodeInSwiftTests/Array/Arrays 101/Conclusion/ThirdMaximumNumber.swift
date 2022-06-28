//
//  ThirdMaximumNumber.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 28/6/2022.
//  https://leetcode.com/explore/learn/card/fun-with-arrays/523/conclusion/3231/

import XCTest

class ThirdMaximumNumber: XCTestCase {

    /// Given an integer array `nums`, `return the third distinct maximum` number in this array. If the third maximum does not exist, return the maximum number.
    ///
    /// Constraints:
    ///  - 1 <= nums.length <= 104
    ///  - -231 <= nums[i] <= 231 - 1
    ///
    ///Follow up: Can you find an O(n) solution?
    func thirdMax(_ nums: [Int]) -> Int {
        let a = Array(Set(nums)).sorted()
        return a.count >= 3 ? a[a.count - 3] : a.last!
    }

    func test_ThirdMax() {
        /**
         Explanation:
         The first distinct maximum is 3.
         The second distinct maximum is 2.
         The third distinct maximum is 1.
         */
        check(input: [3,2,1], expect: 1)

        /**
         Explanation:
         The first distinct maximum is 2.
         The second distinct maximum is 1.
         The third distinct maximum does not exist, so the maximum (2) is returned instead.
         */
        check(input: [1,2], expect: 2)

        /**
         Explanation:
         The first distinct maximum is 3.
         The second distinct maximum is 2 (both 2's are counted together since they have the same value).
         The third distinct maximum is 1.
         */
        check(input: [2,2,3,1], expect: 1)
        check(input: [5,2,2], expect: 5)
        check(input: [1,2,2,5,3,5], expect: 2)
    }

    func check(input: [Int], expect: Int) {
        XCTAssertEqual(thirdMax(input), expect)
    }
}
