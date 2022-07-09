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
        guard !needle.isEmpty else { return 0 }
        var haystacks = Array(haystack)

        for h in 0..<haystack.count {
            if String(haystacks).hasPrefix(needle) { return h }
            else {
                haystacks.removeFirst()
            }
        }
        return -1
    }

    func test() {
        check(input: "mississippi", needle: "issip", expect: 4)
    }
    /// Constraints:
    ///  - 1 <= haystack.length, needle.length <= 104
    ///  - haystack and needle consist of only lowercase English characters.
    func test_strStr() {
        check(input: "hello", needle: "ll", expect: 2)
        check(input: "aaaaa", needle: "bba", expect: -1)
        check(input: "mississippi", needle: "issip", expect: 4)
    }

    func check(input: String, needle: String, expect: Int) {
        XCTAssertEqual(strStr(input, needle), expect)
    }
}
