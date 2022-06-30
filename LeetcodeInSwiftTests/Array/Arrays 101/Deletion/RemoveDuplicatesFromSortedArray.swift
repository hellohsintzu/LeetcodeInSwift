//
//  RemoveDuplicatesFromSortedArray.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 26/6/2022.
//  https://leetcode.com/explore/learn/card/fun-with-arrays/526/deleting-items-from-an-array/3248/

import XCTest

class RemoveDuplicatesFromSortedArray: XCTestCase {

    /// Given an integer array `nums` sorted in non-decreasing order, remove the duplicates `in-place` such that each unique element appears only once. The relative order of the elements should be kept the same.
    ///
    /// Since it is impossible to change the length of the array in some languages, you must instead have the result be placed in the first part of the array `nums`. More formally, if there are `k` elements after removing the duplicates, then the first `k` elements of `nums` should hold the final result. It does not matter what you leave beyond the first `k` elements.
    ///
    /// Return `k` after placing the final result in the first `k` slots of `nums`.
    ///
    /// Do not allocate extra space for another array. You must do this by `modifying the input array` in-place with O(1) extra memory.
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard !nums.isEmpty else { return 0 }
        guard nums.count > 1 else { return 1 }
        
        var num = nums.last
        for i in (0...nums.count-2).reversed() {
            if nums[i] == num {
                nums.remove(at: i)
            } else {
                num = nums[i]
            }
        }
        return nums.count
    }

    /// Constraints
    ///  - 1 <= nums.length <= 3 * 104
    ///  - -100 <= nums[i] <= 100
    ///  - nums is sorted in non-decreasing order.
    func test_RemoveDuplicates() {

        // Explanation:
        // Your function should return k = 2, with the first two elements of nums being 1 and 2 respectively.
        // It does not matter what you leave beyond the returned k (hence they are underscores).
        check(input: [1,1,2], expect: (2, [1,2]))

        // Explanation:
        // Your function should return k = 5, with the first five elements of nums being 0, 1, 2, 3, and 4 respectively.
        // It does not matter what you leave beyond the returned k (hence they are underscores).
        check(input: [0,0,1,1,1,2,2,3,3,4], expect: (5, [0,1,2,3,4]))

        check(input: [], expect: (0, []))
        check(input: [1], expect: (1, [1]))
        check(input: [1,2], expect: (2, [1,2]))
    }

    func check(input: [Int], expect: (value: Int, numbers: [Int])) {
        var inputArray = input
        let resultValue = removeDuplicates(&inputArray)
        XCTAssertEqual(resultValue, expect.value)
        XCTAssertTrue(expect.numbers.allSatisfy(inputArray[0..<resultValue].contains), "\nExpect: \(expect.numbers), Result: \(inputArray[0..<resultValue])")
    }
}
