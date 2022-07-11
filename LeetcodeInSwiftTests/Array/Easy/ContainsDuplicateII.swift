//
//  ContainsDuplicateII.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 10/7/2022.
//  https://leetcode.com/problems/contains-duplicate-ii/

import XCTest

class ContainsDuplicateII: XCTestCase {

    /// Given an integer array nums and an integer k, return true if there are two distinct indices i and j in the array such that nums[i] == nums[j] and abs(i - j) <= k.
    func containsNearbyDuplicate(_ nums: [Int], _ k: Int) -> Bool {
        var dict: [Int: Int] = [:]
        for (currentIndex, num) in nums.enumerated() {
            //Use the `num` to check is any duplicate `num` in the dictionary, if does, get the duplicate index and check the destain is <= k.
            if let duplicateIndex = dict[num],
               currentIndex - duplicateIndex <= k {
                return true
            }
            dict[num] = currentIndex    //Save the index as value with num as key.
        }
        return false
    }

    /// Constraints:
    ///  - 1 <= nums.length <= 10^5
    ///  - -10^9 <= nums[i] <= 10^9
    ///  - 0 <= k <= 10^5
    func test_containsNearByDuplicate() {
        check(input: [1,2,3,1], k: 3, expect: true)
        check(input: [1,0,1,1], k: 1, expect: true)
        check(input: [1,2,3,1,2,3], k: 2, expect: false)
        check(input: [99,99], k: 2, expect: true)
        check(input: [2,2], k: 3, expect: true)
    }

    func check(input: [Int], k: Int, expect: Bool) {
        XCTAssertEqual(containsNearbyDuplicate(input, k), expect)
    }
}
