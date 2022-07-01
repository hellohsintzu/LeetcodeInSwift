//
//  ContainerWithMostWater.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 30/6/2022.
//  https://leetcode.com/problems/container-with-most-water/

import XCTest

class ContainerWithMostWater: XCTestCase {

    /// You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).
    ///
    /// Find two lines that together with the x-axis form a container, such that the container contains the most water.
    ///
    /// Return the maximum amount of water a container can store.
    ///
    /// Notice that you may not slant the container.
    func maxArea(_ height: [Int]) -> Int {
        var lhs = 0
        var rhs = height.count - 1
        var maxContainer = 0
        //find the maximum height and compare the width.
        while lhs < rhs {
            let w = rhs - lhs
            let h = min(height[lhs], height[rhs])
            maxContainer = max(maxContainer, w * h)

            height[lhs] < height[rhs] ? (lhs += 1) : (rhs -= 1)
        }
        return maxContainer
    }

    /// Constraints:
    ///  - n == height.length
    ///  - 2 <= n <= 105
    ///  - 0 <= height[i] <= 104
    func test_MaxArea() {

        /**
         Explanation:
         The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7].
         In this case, the max area of water (blue section) the container can contain is 7*7 = 49.
         */
        check(input: [1,8,6,2,5,4,8,3,7], expect: 49)

        check(input: [1,1], expect: 1)
    }

    func check(input: [Int], expect: Int) {
        XCTAssertEqual(maxArea(input), expect)
    }
}
