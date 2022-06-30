//
//  ValidMountainArray.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 27/6/2022.
//  https://leetcode.com/explore/learn/card/fun-with-arrays/527/searching-for-items-in-an-array/3251/

import XCTest

class ValidMountainArray: XCTestCase {

    /// Given an array of integers `arr`, return `true` if and only if it is a valid mountain array.
    ///
    /// Recall that arr is a mountain array if and only if:
    ///  - `arr.length >= 3`
    ///  - There exists some `i` with `0 < i < arr.length - 1` such that:
    ///  - `arr[0] < arr[1] < ... < arr[i - 1] < arr[i]`
    ///  - `arr[i] > arr[i + 1] > ... > arr[arr.length - 1]`
    func validMountainArray(_ arr: [Int]) -> Bool {
        /**
         Two people climb from left and from right separately.
         If they are climbing the same mountain,
         they will meet at the same point.
        */
        var firstPeak = 0
        var secondPeak = arr.count - 1

        for i in 1..<arr.count {
            if arr[firstPeak] < arr[i] {
                firstPeak = i
            } else {
                break
            }
        }

        for i in (0..<arr.count - 1).reversed() {
            if arr[secondPeak] < arr[i] {
                secondPeak = i
            } else {
                break
            }
        }
        return firstPeak == secondPeak && firstPeak != 0 && secondPeak != (arr.count - 1)
    }

    /// Constraints
    ///  - 1 <= arr.length <= 104
    ///  - 0 <= arr[i] <= 104
    func test_ValidMountainArray() {
        check(input: [2,1], expect: false)
        check(input: [3,5,5], expect: false)
        check(input: [0,3,2,1], expect: true)

        check(input: [2,0,2], expect: false)
        check(input: [1,3,2], expect: true)
        check(input: [0,1,2,1,2], expect: false)
        check(input: [0,1,2,3,4,5,6,7,8,9], expect: false)
    }

    func check(input: [Int], expect: Bool) {
        XCTAssertEqual(validMountainArray(input), expect)
    }
}
