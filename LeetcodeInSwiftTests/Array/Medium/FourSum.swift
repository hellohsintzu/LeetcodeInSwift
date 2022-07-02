//
//  FourSum.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 2/7/2022.
//  https://leetcode.com/problems/4sum/

import XCTest

class FourSum: XCTestCase {

    /// Given an array `nums` of `n` integers, return an array of all the unique quadruplets `[nums[a], nums[b], nums[c], nums[d]]` such that:
    ///
    /// 0 <= a, b, c, d < n
    ///
    /// a, b, c, and d are distinct.
    ///
    /// nums[a] + nums[b] + nums[c] + nums[d] == target
    ///
    /// You may return the answer in any order.
    func fourSum(_ nums: [Int], _ target: Int) -> [[Int]] {
        let sorted = nums.sorted()
        var result: Set<[Int]> = []
        //Fixed First two numbers.
        for i in 0..<sorted.count {
            for j in (i+1)..<sorted.count {
                var l = j + 1
                var r = sorted.count - 1
                //Two pointers check rest pair numbers.
                while l < r {
                    let val = sorted[i] + sorted[j] + sorted[l] + sorted[r]
                    if val == target { result.insert([sorted[i], sorted[j], sorted[l], sorted[r]]) }
                    val > target ? (r -= 1) : (l += 1)
                }
            }
        }
        return Array(result)
    }

    /// Constraints:
    ///  - 1 <= nums.length <= 200
    ///  - -10^9 <= nums[i] <= 10^9
    ///  - -10^9 <= target <= 10^9
    func test_FourSum() {
        check(input: [1,0,-1,0,-2,2], target: 0, expect: [[-2,-1,1,2],[-2,0,0,2],[-1,0,0,1]])
        check(input: [2,2,2,2,2], target: 8, expect: [[2,2,2,2]])
    }

    func check(input: [Int], target: Int, expect: [[Int]]) {
        let result = fourSum(input, target)
        XCTAssertTrue(result.count == expect.count)
        expect.forEach ({ XCTAssertTrue(result.contains($0))} )
    }
}
