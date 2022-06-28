//
//  CheckIsDoubleExist.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 26/6/2022.
//  https://leetcode.com/explore/learn/card/fun-with-arrays/527/searching-for-items-in-an-array/3250/

import XCTest

class CheckIsDoubleExist: XCTestCase {

    /// Given an array `arr` of integers, check if there exists two integers `N` and `M` such that `N` is the double of `M` ( i.e. N = 2 * M).
    ///
    /// More formally check if there exists two indices `i` and `j` such that :
    /// - i != j
    /// - 0 <= i, j < arr.length
    /// - arr[i] == 2 * arr[j]
    ///
    /// Constraints:
    ///  - 2 <= arr.length <= 500
    ///  - -10^3 <= arr[i] <= 10^3
    func checkIfExist(_ arr: [Int]) -> Bool {
        var temp: [Int] = []

        for num in arr {
            if temp.contains(num * 2) { return true }
            if num % 2 == 0 && temp.contains(num / 2) { return true }
            temp.append(num)
        }
        return false
    }

    func test_checkIfExist() {

        // Explanation: N = 10 is the double of M = 5,that is, 10 = 2 * 5.
        check(input: [10,2,5,3], expect: true)

        // Explanation: N = 14 is the double of M = 7,that is, 14 = 2 * 7.
        check(input: [7,1,14,11], expect: true)

        // Explanation: In this case does not exist N and M, such that N = 2 * M.
        check(input: [3,1,7,11], expect: false)

        // Be careful 0 = 0 * 2, and 0 is its self.
        check(input: [-2,0,10,-19,4,6,-8], expect: false)
        check(input: [-10,12,-20,-8,15], expect: true)
        check(input: [7,1,28,11], expect: false)
        check(input: [0,0], expect: true)
        check(input: [], expect: false)

        check(input:  [102,-592,457,802,98,-132,883,356,-857,461,-453,522,250,476,991,540,-852,-485,-637,999,-803,-691,-880,881,-584,750,-124,745,-909,-892,304,-814,868,665,50,-40,26,-242,-797,-360,-918,-741,88,-933,-93,360,-738,833,-191,563,449,840,806,-87,-950,508,74,-448,-815,-488,639,-334],
              expect: false)
    }

    func check(input: [Int], expect: Bool) {
        XCTAssertEqual(checkIfExist(input), expect)
    }
}
