//
//  MaxConsecutiveOnes.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 22/6/2022.
//  https://leetcode.com/explore/learn/card/fun-with-arrays/521/introduction/3238/

import XCTest

class MaxConsecutiveOnes: XCTestCase {
    
    /// Given a binary array nums, return the maximum number of consecutive 1's in the array.
    ///
    ///     Input: nums = [1,1,0,1,1,1]
    ///     Output: 3
    ///
    /// Explanation:
    ///
    /// The first two digits or the last three digits are consecutive 1s. The maximum number of consecutive 1s is 3.
    func findMaxConsecutiveOnes(_ nums: [Int]) -> Int {
        var counter = 0
        var answer = 0
        for num in nums {
            if num == 1 {
                counter += 1
            } else {
                counter = 0
            }
            if counter > answer {
                answer = counter
            }
        }
        return answer
    }
    
    /// Constraints
    ///    1 <= nums.length <= 105
    ///    nums[i] is either 0 or 1.
    func test_findMaxConsecutiveOnes() {
        check(input: [1,1,0,1,1,1], expect: 3)
        check(input: [1,0,1,1,0,1], expect: 2)
    }
    
    func check(input: [Int], expect: Int) {
        let result = findMaxConsecutiveOnes(input)
        XCTAssertEqual(result, expect)
    }
}
