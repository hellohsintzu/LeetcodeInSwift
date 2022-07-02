//
//  ThreeSumClosest.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 1/7/2022.
//  https://leetcode.com/problems/3sum-closest/

import XCTest

class ThreeSumClosest: XCTestCase {

    /// Given an integer array `nums` of length n and an integer `target`, find three integers in `nums` such that the sum is closest to `target`.
    ///
    /// Return the sum of the three integers.
    ///
    /// You may assume that each input would have exactly one solution.
    func threeSumClosest(_ nums: [Int], _ target: Int) -> Int {
        let sorted = nums.sorted()
        var result = sorted[0] + sorted[1] + sorted[sorted.count - 1]
        //Run through every elements.
        for i in 0..<sorted.count {

            //And use two pointers to find out other pair number.
            var lhs = i + 1
            var rhs = sorted.count - 1
            while lhs < rhs {
                let val = sorted[i] + sorted[lhs] + sorted[rhs]
                if val == target { return target }
                if abs(val - target) <= abs(result - target) { result = val }
                val > target ? (rhs -= 1) : (lhs += 1)
            }
        }
        return result
    }

    /// Constraints:
    ///  - 3 <= nums.length <= 1000
    ///  - -1000 <= nums[i] <= 1000
    ///  - -104 <= target <= 104
    func test_ThreeSumClosest() {

        // Explanation:
        // The sum that is closest to the target is 2. (-1 + 2 + 1 = 2).
        check(input: [-1,2,1,-4], target: 1, expect: 2)

        check(input: [0,0,0], target: 1, expect: 0)
        check(input: [0,1,2], target: 0, expect: 3)
        check(input: [1,1,1,1], target: 0, expect: 3)
        check(input: [1,1,-1], target: 2, expect: 1)
        check(input: [0,2,1,-3], target: 1, expect: 0)
        check(input: [1,1,-1,-1,3], target: -1, expect: -1)
        check(input: [1,2,4,8,16,32,64,128], target: 82, expect: 82)
        check(input: [1,1,1,1], target: 100, expect: 3)
    }

    func check(input: [Int], target: Int, expect: Int) {
        XCTAssertEqual(threeSumClosest(input, target), expect)
    }
}
