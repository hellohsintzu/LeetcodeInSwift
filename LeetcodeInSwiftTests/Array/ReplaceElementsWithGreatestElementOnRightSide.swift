//
//  ReplaceElementsWithGreatestElementOnRightSide.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 28/6/2022.
//  https://leetcode.com/explore/learn/card/fun-with-arrays/511/in-place-operations/3259/

import XCTest

class ReplaceElementsWithGreatestElementOnRightSide: XCTestCase {

    /// Given an array arr, replace every element in that array with the greatest element among the elements to its right, and replace the last element with -1.
    ///
    /// After doing so, return the array.
    ///
    /// Constraints:
    ///  - 1 <= arr.length <= 104
    ///  - 1 <= arr[i] <= 105
    func replaceElements(_ arr: [Int]) -> [Int] {
        var result = Array.init(repeating: -1, count: arr.count)
        for i in 0..<arr.count {
            var greater = -1
            for n in (i+1)..<arr.count {
                if arr[n] > greater {
                    greater = arr[n]
                }
            }
            result[i] = greater
        }
        return result
    }

    func test_ReplaceElements() {

        /**
         Explanation:
         - index 0 --> the greatest element to the right of index 0 is index 1 (18).
         - index 1 --> the greatest element to the right of index 1 is index 4 (6).
         - index 2 --> the greatest element to the right of index 2 is index 4 (6).
         - index 3 --> the greatest element to the right of index 3 is index 4 (6).
         - index 4 --> the greatest element to the right of index 4 is index 5 (1).
         - index 5 --> there are no elements to the right of index 5, so we put -1.
         */
        check(input: [17,18,5,4,6,1], expect: [18,6,6,6,1,-1])

        // Explanation: There are no elements to the right of index 0.
        check(input: [400], expect: [-1])
    }

    func check(input: [Int], expect: [Int]) {
        XCTAssertEqual(replaceElements(input), expect)
    }
}
