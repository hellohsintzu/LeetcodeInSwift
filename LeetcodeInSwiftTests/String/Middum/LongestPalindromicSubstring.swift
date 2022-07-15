//
//  LongestPalindromicSubstring.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 15/7/2022.
//  https://leetcode.com/problems/longest-palindromic-substring/

import XCTest

class LongestPalindromicSubstring: XCTestCase {

    /// Given a string s, return the longest palindromic substring in s.
    func longestPalindrome(_ s: String) -> String {
        let len = s.count
        let arr = Array(s)
        if len <= 1 { return s }

        var lhs = 0
        var rhs = 0
        var dp = Array(repeating: Array(repeating: false, count: len), count: len)

        for i in 1..<len {
            for j in 0..<i where arr[j] == arr[i] && (dp[j+1][i-1] || i - j <= 2) {
                dp[j][i] = true
                if i - j > rhs - lhs {
                    lhs = j
                    rhs = i
                }
            }
        }
        return String(arr[lhs...rhs])
    }

    /// Constraints:
    ///  - 1 <= s.length <= 1000
    ///  - s consist of only digits and English letters.
    func test_longestPalindrome() {

        //Explanation: "aba" is also a valid answer.
        check(input: "babad", expect: "bab")
        check(input: "cbbd", expect: "bb")
    }

    func check(input: String, expect: String) {
        XCTAssertEqual(longestPalindrome(input), expect)
    }
}
