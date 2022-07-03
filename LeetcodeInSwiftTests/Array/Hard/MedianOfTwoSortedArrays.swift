//
//  MedianOfTwoSortedArrays.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 3/7/2022.
//  https://leetcode.com/problems/median-of-two-sorted-arrays/

import XCTest

class MedianOfTwoSortedArrays: XCTestCase {

    /// Given two sorted arrays `nums1` and `nums2` of size `m` and `n` respectively, return `the median` of the two sorted arrays.
    ///
    /// The overall run time complexity should be `O(log (m+n))`.
    func findMedianSortedArrays(_ nums1: [Int], _ nums2: [Int]) -> Double {
        let m = merge(nums1: nums1, and: nums2)
        return m.count % 2 == 0 ? (Double(m[m.count/2] + m[(m.count/2) - 1])/2) : Double(m[m.count/2])
    }

    private func merge(nums1: [Int], and nums2: [Int]) -> [Int] {
        guard !nums1.isEmpty || !nums2.isEmpty else { return nums1.isEmpty ? nums2 : nums1 }
        var index1 = 0
        var index2 = 0
        var result = Array.init(repeating: 0, count: nums1.count + nums2.count)

        for i in 0..<result.count {
            if index1 > (nums1.count - 1) {         //Run out of nums1.
                result[i] = nums2[index2]
                index2 += 1
            } else if index2 > (nums2.count - 1) {  //Run out of nums2.
                result[i] = nums1[index1]
                index1 += 1
            } else {                                //Compare nums1 and nums2 elements.
                if nums1[index1] < nums2[index2] {
                    result[i] = nums1[index1]
                    index1 += 1
                } else {
                    result[i] = nums2[index2]
                    index2 += 1
                }
            }
        }
        return result
    }

    func test_merge() {
        checkMerge(input: [], and: [])
        checkMerge(input: [1], and: [])
        checkMerge(input: [1,3], and: [2])
        checkMerge(input: [1,2], and: [3,4])
        checkMerge(input: [1,2,3,3], and: [3,4,4,5,6])
    }

    func checkMerge(input nums1: [Int], and nums2: [Int]) {
        let expect = (nums1 + nums2).sorted()
        XCTAssertEqual(merge(nums1: nums1, and: nums2), expect)
    }

    /// Constraints:
    ///  - nums1.length == m
    ///  - nums2.length == n
    ///  - 0 <= m <= 1000
    ///  - 0 <= n <= 1000
    ///  - 1 <= m + n <= 2000
    ///  - -10^6 <= nums1[i], nums2[i] <= 10^6
    func test_FindMedianSortedArrays() {
        //Explanation: merged array = [1,2,3] and median is 2.
        check(input: [1,3], and: [2], expect: 2.00000)

        //Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.
        check(input: [1,2], and: [3,4], expect: 2.50000)
    }

    func check(input nums1: [Int], and nums2: [Int], expect: Double) {
        XCTAssertEqual(findMedianSortedArrays(nums1, nums2), expect)
    }
}
