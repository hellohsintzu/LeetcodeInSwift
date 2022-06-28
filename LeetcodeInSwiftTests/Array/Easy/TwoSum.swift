//
//  TwoSum.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 28/6/2022.
//  https://leetcode.com/problems/two-sum/

import XCTest

class TwoSum: XCTestCase {

    /// Given an array of integers `nums` and an integer `target`, return indices of the two numbers such that they add up to `target`.
    ///
    /// You may assume that each input would have `exactly one solution`, and you may not use the same element twice.
    ///
    /// You can return the answer in any order.
    ///
    /// Constraints:
    ///  - 2 <= nums.length <= 104
    ///  - -109 <= nums[i] <= 109
    ///  - -109 <= target <= 109
    ///  - Only one valid answer exists.
    ///
    ///  Follow-up: Can you come up with an algorithm that is less than O(n2) time complexity?
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var dict: [Int: Int] = [:]
        for i in 0..<nums.count {
            dict[nums[i]] = i   //Use value to make a hash table.
        }
        for i in 0..<nums.count {
            let n = target - nums[i]
            //Find the pair number and check is in the hash table.
            if let a = dict[n], a != i {
                return [i,a]
            }
        }
        return []
    }

    func test_TwoSum() {

        //Explanation: Because nums[0] + nums[1] == 9, we return [0, 1].
        check(input: [2,7,11,15], target: 9, expect: [0,1])

        //Careful with 3 + 3 = 6 will leads to wrong answer [0,0].
        check(input: [3,2,4], target: 6, expect: [1,2])
        check(input: [3,3], target: 6, expect: [0,1])
    }

    func check(input: [Int], target: Int, expect: [Int]) {
        XCTAssertEqual(twoSum(input, target), expect)
    }
}
