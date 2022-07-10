//
//  MinimumSizeSubarraySum.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 10/7/2022.
//  https://leetcode.com/problems/minimum-size-subarray-sum/

import XCTest

/**
 Technic: Sliding Window

 Set windowStart and windowEnd, keep expend windowEnd by using for loop, if satisfy some condition will move  windowStart one step to right to decrease the window.

 */

class MinimumSizeSubarraySum: XCTestCase {

    /// Given an array of positive integers nums and a positive integer target, return the minimal length of a contiguous subarray [numsl, numsl+1, ..., numsr-1, numsr] of which the sum is greater than or equal to target. If there is no such subarray, return 0 instead.
    func minSubArrayLen(_ target: Int, _ nums: [Int]) -> Int {
        var length = Int.max  //Set maximum integer first, so line 20 will set in the first round.
        var windowStart = 0 //If satisfy the condition, move windowStart to right.
        var sum = 0

        for (windowEnd,digits) in nums.enumerated() {   //Expend windowEnd
            sum += digits

            while sum >= target, windowStart <= windowEnd { //Satisfy the Condition, sum is greater or equal to target.
                //Calculate the length.
                length = min(length, (windowEnd - windowStart) + 1)
                //we are going to move the windowStart one step to right, will reduce nums[windowStart] before we move it.
                sum -= nums[windowStart]
                windowStart += 1
            }
        }
        return length == .max ? 0 : length
    }

    /// Constraints:
    ///  - 1 <= target <= 109
    ///  - 1 <= nums.length <= 105
    ///  - 1 <= nums[i] <= 104
    func test_minSubArrayLan() {
        // Explanation: The subarray [4,3] has the minimal length under the problem constraint.
        check(input: 7, nums: [2,3,1,2,4,3], expect: 2)
        check(input: 4, nums: [1,4,4], expect: 1)
        check(input: 11, nums: [1,1,1,1,1,1,1,1], expect: 0)
    }

    func check(input: Int, nums: [Int], expect: Int) {
        XCTAssertEqual(minSubArrayLen(input, nums), expect)
    }
}
