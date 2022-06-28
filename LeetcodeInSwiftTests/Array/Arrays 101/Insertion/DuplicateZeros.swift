//
//  DuplicateZeros.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 26/6/2022.
//  https://leetcode.com/explore/learn/card/fun-with-arrays/525/inserting-items-into-an-array/3245/

import XCTest

class DuplicateZeros: XCTestCase {

    /// Given a fixed-length integer array `arr`, duplicate each occurrence of zero, shifting the remaining elements to the right.
    /// Note that elements beyond the length of the original array are not written. Do the above modifications to the input array in place and do not return anything.
    ///
    /// Example 1:
    ///
    ///     Input: arr = [1,0,2,3,0,4,5,0]
    ///     Output: [1,0,0,2,3,0,0,4]
    ///
    /// Explanation: After calling your function, the input array is modified to: [1,0,0,2,3,0,0,4]
    ///
    /// Constraints:
    ///  - 1 <= arr.length <= 104
    ///  - 0 <= arr[i] <= 9
    func duplicateZeros(_ arr: inout [Int]) {
        var temp = Array.init(repeating: 0, count: arr.count)
        var arrIndex = 0
        var tempIndex = 0
        while tempIndex < temp.count {
            temp[tempIndex] = arr[arrIndex]
            tempIndex += 1
            if arr[arrIndex] == 0, tempIndex < temp.count {
                temp[tempIndex] = 0
                tempIndex += 1
            }
            arrIndex += 1
        }
        arr = temp
    }

    func test_DuplicateZeros() {
        check(input: [1,0,2,3,0,4,5,0], expect: [1,0,0,2,3,0,0,4])
        check(input: [1,2,3], expect: [1,2,3])
        check(input: [], expect: [])
        check(input: [0], expect: [0])
        check(input: [1], expect: [1])
        check(input: [0,0], expect: [0,0])
    }

    func check(input: [Int], expect: [Int]) {
        let fixedCount = input.count
        var inputArr = input
        duplicateZeros(&inputArr)
        XCTAssertEqual(fixedCount, expect.count, "\nWRONG EXPECT,\n Input count: \(fixedCount),  Expect count: \(expect.count),\n Expect count should be fixed-length and same as input ")
        XCTAssertEqual(inputArr, expect)
    }
}
