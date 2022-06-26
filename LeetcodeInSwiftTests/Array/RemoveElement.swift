//
//  RemoveElement.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 26/6/2022.
//  https://leetcode.com/explore/learn/card/fun-with-arrays/526/deleting-items-from-an-array/3247/

import XCTest

class RemoveElement: XCTestCase {

    /// Given an integer array `nums` and an integer `val`, remove all occurrences of `val` in `nums` in-place. The relative order of the elements may be changed.
    ///
    /// Since it is impossible to change the length of the array in some languages, you must instead have the result be placed in the first part of the array `nums`. More formally, if there are `k` elements after removing the duplicates, then the first `k` elements of `nums` should hold the final result. It does not matter what you leave beyond the first `k` elements.
    ///
    /// Return `k` after placing the final result in the first `k` slots of nums.
    ///
    /// Do `not` allocate extra space for another array. You must do this by modifying the input array in-place with O(1) extra memory.
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        for i in (0..<nums.count).reversed() {
            if nums[i] == val {
                nums.remove(at: i)
            }
        }
        return nums.count
    }

    func test_RemoveElement() {

        // Explanation:
        // Your function should return k = 2, with the first two elements of nums being 2.
        // It does not matter what you leave beyond the returned k (hence they are underscores).
        check(input: [3,2,2,3], val: 3, expect: (2, [2,2]))

        // Explanation:
        // Your function should return k = 5, with the first five elements of nums containing 0, 0, 1, 3, and 4.
        // Note that the five elements can be returned in any order.
        // It does not matter what you leave beyond the returned k (hence they are underscores).
        check(input: [0,1,2,2,3,0,4,2], val: 2, expect: (5, [0,1,4,0,3]))
    }

    func check(input: [Int], val: Int, expect: (Int, [Int])) {
        var inputArray = input
        let value = removeElement(&inputArray, val)
        XCTAssertEqual(value, expect.0)
        let resultArray = Array(inputArray[0..<value])
        XCTAssertTrue(resultArray.allSatisfy(expect.1.contains))
    }
}
