//
//  ThreeSum.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 28/6/2022.
//  https://leetcode.com/problems/3sum/

import XCTest
import LeetcodeInSwift

class ThreeSum: XCTestCase {

    /// Given an integer array nums, return all the triplets [nums[i], nums[j], nums[k]] such that i != j, i != k, and j != k, and nums[i] + nums[j] + nums[k] == 0.
    ///
    /// Notice that the solution set must not contain duplicate triplets.
    func threeSum(_ nums: [Int]) -> [[Int]] {

        var result: [[Int]] = []
        let nums = nums.sorted()
        let len = nums.count

        guard len >= 3 else { return result }

        for i in 0..<len {
            if i > 0 && nums[i] == nums[i-1] { continue }
            
            let num = 0 - nums[i]
            var a = i + 1, b = len - 1

            while a < b {
                let numA = nums[a], numB = nums[b]
                let sum = numA + numB
                if sum == num {
                    result.append([nums[i], numA, numB])
                    a += 1
                    b -= 1
                    while a < b && nums[a] == nums[a-1] { a += 1 }
                    while a < b && nums[b] == nums[b+1] { b -= 1 }
                } else {
                    sum > num ? b -= 1 : (a += 1)
                }
            }
        }
        return result
    }

    /// Constraints
    ///  - 0 <= nums.length <= 3000
    ///  - -105 <= nums[i] <= 105
    func test_ThreeSum() {
        check(input: [-1,0,1,2,-1,-4], expect: [[-1,-1,2],[-1,0,1]])
        check(input: [], expect: [])
        check(input: [0], expect: [])
    }

    func check(input: [Int], expect: [[Int]]) {
        XCTAssertEqual(threeSum(input), expect)
    }
}
