//
//  MergeSortedArray.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 26/6/2022.
//  https://leetcode.com/explore/learn/card/fun-with-arrays/525/inserting-items-into-an-array/3253/

import XCTest

class MergeSortedArray: XCTestCase {

    /// You are given two integer arrays `nums1` and `nums2`, sorted in non-decreasing order, and two integers `m` and `n`, representing the number of elements in `nums1` and `nums2` respectively.
    ///
    /// Merge `nums1` and `nums2` into a single array sorted in non-decreasing order.
    ///
    /// The final sorted array should not be returned by the function, but instead be stored inside the array `nums1`. To accommodate this, `nums1` has a length of `m + n`, where the first `m` elements denote the elements that should be merged, and the last `n` elements are set to 0 and should be ignored. `nums2` has a length of `n`.
    ///
    ///  Constraints:
    ///   - nums1.length == m + n
    ///   - nums2.length == n
    ///   - 0 <= m, n <= 200
    ///   - 1 <= m + n <= 200
    ///   - -109 <= nums1[i], nums2[j] <= 109
    ///
    ///   Follow up: Can you come up with an algorithm that runs in O(m + n) time?
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var temp = Array.init(repeating: 0, count: m+n)
        var tempIndex = 0
        for i in 0..<m {
            temp[tempIndex] = nums1[i]
            tempIndex += 1
        }
        for i in 0..<n {
            temp[tempIndex] = nums2[i]
            tempIndex += 1
        }
        nums1 = temp.sorted()
    }

    func test_merge() {
        // Explanation: The arrays we are merging are [1,2,3] and [2,5,6].
        // The result of the merge is [1,2,2,3,5,6] with the underlined elements coming from nums1.
        check(input: [1,2,3,0,0,0], m: 3, nums2: [2,5,6], n: 3, expect: [1,2,2,3,5,6])

        // Explanation: The arrays we are merging are [1] and [].
        // The result of the merge is [1].
        check(input: [1], m: 1, nums2: [], n: 0, expect: [1])

        // Explanation: The arrays we are merging are [] and [1].
        // The result of the merge is [1].
        // Note that because m = 0, there are no elements in nums1. The 0 is only there to ensure the merge result can fit in nums1.
        check(input: [0], m: 0, nums2: [1], n: 1, expect: [1])
    }

    func check(input nums1: [Int], m: Int, nums2: [Int], n: Int, expect: [Int]) {
        var nums1Array = nums1
        merge(&nums1Array, m, nums2, n)
        XCTAssertEqual(nums1Array, expect)
    }
}
