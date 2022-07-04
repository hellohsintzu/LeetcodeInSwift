//
//  LongestCommonPrefix.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 4/7/2022.
//  https://leetcode.com/problems/longest-common-prefix/

import XCTest

class LongestCommonPrefix: XCTestCase {

    /// Write a function to find the longest common prefix string amongst an array of strings.
    /// If there is no common prefix, return an empty string `""`.
    func longestCommonPrefix(_ strs: [String]) -> String {
        guard !strs.isEmpty else { return "" }
        var common = strs[0]    //Use the first str as standard.

        for ch in strs {
            while !ch.hasPrefix(common) {           //in first loop, `ch` == common
                //keep drop last of common and check is still has common prefix via loop.
                common = String(common.dropLast())
            }
        }
        //Keep check over the strs until get the shortest common(or no common, then return "")
        return common
    }

    /// Constraints:
    ///  - 1 <= strs.length <= 200
    ///  - 0 <= strs[i].length <= 200
    ///  - strs[i] consists of only lowercase English letters.
    func test_LongestCommonPrefix() {

        check(input: ["flower","flow","flight"], expect: "fl")

        //Explanation: There is no common prefix among the input strings.
        check(input: ["dog","racecar","car"], expect: "")
//        check(input: [""], expect: "")
        check(input: ["cir","car"], expect: "c")
        check(input: ["reflower","flow","flight"], expect: "")
        check(input: ["flower","fkow"], expect: "f")
    }

    func check(input: [String], expect: String) {
        XCTAssertEqual(longestCommonPrefix(input), expect)
    }
}
