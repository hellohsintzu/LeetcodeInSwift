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
    ///
    /// Constraints:
    ///  - 1 <= arr.length <= 104
    ///  - 0 <= arr[i] <= 104
    func validMountainArray(_ arr: [Int]) -> Bool {
        guard arr.count >= 3 else { return false }
        var rightPoint = 2
        var middlePoint = 1
        var leftPoint = 0
        var summitCount = 0

        while rightPoint <= (arr.count - 1) {
            let isHole = arr[leftPoint] > arr[middlePoint] && arr[middlePoint] < arr[rightPoint]
            let isFlat = arr[leftPoint] == arr[middlePoint] || arr[middlePoint] == arr[rightPoint]
            guard !isFlat && !isHole else { return false }

            let isSummit = arr[leftPoint] < arr[middlePoint] && arr[middlePoint] > arr[rightPoint]
            summitCount += isSummit ? 1 : 0

            rightPoint += 1
            middlePoint += 1
            leftPoint += 1
        }
        return summitCount == 1
    }

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
