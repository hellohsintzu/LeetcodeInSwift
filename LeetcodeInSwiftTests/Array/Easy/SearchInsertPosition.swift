//
//  SearchInsertPosition.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 29/6/2022.
//  https://leetcode.com/problems/search-insert-position/

import XCTest

class SearchInsertPosition: XCTestCase {

    /// Given a sorted array of distinct integers and a target value, return the index if the target is found. If not, return the index where it would be if it were inserted in order.
    ///
    /// You must write an algorithm with O(log n) runtime complexity.
    func searchInsert(_ nums: [Int], _ target: Int) -> Int {
        var leftPointer = 0
        var rightPointer = nums.count - 1

        //Binary search
        while leftPointer <= rightPointer {   //if left pointer reach to right pointer, finish the search.
            let middle = (leftPointer + rightPointer) / 2   //find the middle index.

            if nums[middle] < target {
                leftPointer = middle + 1    //if target number is on right side of middle, makes (middle + 1) left pointer.
            } else if nums[middle] > target {
                rightPointer = middle - 1   //if target number is on left side of middle, makes (middle - 1) right pointer.
            } else {
                 return middle  //found the target, return.
            }
        }
        return leftPointer  //if didn't find the target, return left pointer.
    }

    /// Constraints
    ///  - 1 <= nums.length <= 104
    ///  - -104 <= nums[i] <= 104
    ///  - nums contains distinct values sorted in ascending order.
    ///  - -104 <= target <= 104
    func test_SearchInsert() {
        check(input: [1,3,5,6], target: 5, expect: 2)
        check(input: [1,3,5,6], target: 2, expect: 1)
        check(input: [1,3,5,6], target: 7, expect: 4)
        check(input: [1,3,5,6], target: 0, expect: 0)

        check(input: [1], target: 0, expect: 0)
        check(input: [1,2], target: 3, expect: 2)
        check(input: [1,2], target: 0, expect: 0)
        check(input: [1,3], target: 1, expect: 0)
        check(input: [1,3], target: 2, expect: 1)
        check(input: [1,3], target: 3, expect: 1)
        check(input: [1,3,5], target: 4, expect: 2)
        check(input: [1,2,4,6,7], target: 3, expect: 2)
    }

    func check(input nums: [Int], target: Int, expect: Int) {
        XCTAssertEqual(searchInsert(nums, target), expect)
    }
}
