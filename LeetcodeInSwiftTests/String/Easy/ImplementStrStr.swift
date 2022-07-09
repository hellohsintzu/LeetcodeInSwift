//
//  ImplementStrStr.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 8/7/2022.
//  https://leetcode.com/problems/implement-strstr/

import XCTest

class ImplementStrStr: XCTestCase {

    /// Implement strStr().
    /// Given two strings needle and haystack, return the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
    ///
    /// - What should we return when needle is an empty string? This is a great question to ask during
    /// interview.
    /// - For the purpose of this problem, we will return 0 when needle is an empty string. This is consistent to C's strstr() and Java's indexOf().
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let hl = haystack.count
        let nl = needle.count
        //If needle is empty or needle == haystack, than return 0.
        guard !needle.isEmpty && needle != haystack else { return 0 }

        //if haystack is smaller then needle, return -1.
        guard hl >= nl else { return -1 }

        var checkPoint = haystack.startIndex    //every check start from this index

        for i in 0...(hl-nl) {
            //find the last index of every check
            let lastPoint = haystack.index(checkPoint, offsetBy: nl)
            //check the range of start to end is equal to needle.
            if haystack[checkPoint..<lastPoint] == needle { return i }
            //if no match, move the check point forward.
            checkPoint = haystack.index(checkPoint, offsetBy: 1)
        }
        return -1
    }

    /// Constraints:
    ///  - 1 <= haystack.length, needle.length <= 104
    ///  - haystack and needle consist of only lowercase English characters.
    func test_strStr() {
        check(input: "hello", needle: "ll", expect: 2)
        check(input: "aaaaa", needle: "bba", expect: -1)
        check(input: "issip", needle: "issip", expect: 0)
        check(input: "mississippi", needle: "issip", expect: 4)
        check(input: "abc", needle: "c", expect: 2)
    }

    func check(input: String, needle: String, expect: Int) {
        XCTAssertEqual(strStr(input, needle), expect)
    }
}
