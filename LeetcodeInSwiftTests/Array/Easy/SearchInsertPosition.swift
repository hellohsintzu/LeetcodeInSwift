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
        guard nums.count > 1 else { return (target > nums[0] ? 1 : 0) }
        var startIndex = 0
        var endIndex = nums.count - 1
        var middleIndex: Int {
            return (startIndex + endIndex)/2
        }

        //binary search for target number.
        while startIndex + 1 != endIndex {
            if nums[middleIndex] == target { return middleIndex }
            if target > nums[middleIndex] {
                startIndex = middleIndex
            } else if target < nums[middleIndex] {
                endIndex = middleIndex
            }
        }
        //if can't find target, find where to insert.
        if startIndex == 0 && endIndex == nums.count - 1 { //if elements == 2.
            if target <= nums[0] {
                return 0
            } else if nums[0] < target && target <= nums[endIndex] {
                return 1
            } else if target > nums[endIndex] {
                return 2
            }

        } else if startIndex == 0 { //if two points is at leftmost.
            return (target > nums[0]) ? 1 : 0
        } else if endIndex == nums.count - 1 {  //if two points is at rightmost.
            return (target > nums[nums.count - 1]) ? endIndex + 1 : endIndex
        }

        return startIndex + 1
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
