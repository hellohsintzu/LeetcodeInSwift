//
//  LongestPalindromicSubstring.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 15/7/2022.
//  https://leetcode.com/problems/longest-palindromic-substring/

import XCTest

class LongestPalindromicSubstring: XCTestCase {

    func isPalindrome(for string: String) -> Bool {
        guard !string.isEmpty else { return false }
        let characters: [Character] = Array(string)
        var lhs = 0
        var rhs = characters.count-1

        while lhs < rhs {
            if characters[lhs] != characters[rhs] {
                return false
            }
            lhs += 1
            rhs -= 1
        }
        return true
    }

    /// Given a string s, return the longest palindromic substring in s.
    func longestPalindrome(_ s: String) -> String {
        let characters: [Character] = Array(s)
        var result = ""
        for l in 0..<characters.count {
            for r in l..<characters.count {
                let s = String(characters[l...r])
                if isPalindrome(for: s) && s.count > result.count {
                    result = s
                }
            }
        }
        return result
    }

    /// Constraints:
    ///  - 1 <= s.length <= 1000
    ///  - s consist of only digits and English letters.
    func test_longestPalindrome() {

        //Explanation: "aba" is also a valid answer.
        check(input: "babad", expect: "bab")
        check(input: "cbbd", expect: "bb")
    }

    func test_isPalindrome() {
        XCTAssertEqual(isPalindrome(for: ""), false)
        XCTAssertEqual(isPalindrome(for: "a"), true)
        XCTAssertEqual(isPalindrome(for: "aa"), true)
        XCTAssertEqual(isPalindrome(for: "ab"), false)
        XCTAssertEqual(isPalindrome(for: "aba"), true)
        XCTAssertEqual(isPalindrome(for: "abb"), false)
    }

    func check(input: String, expect: String) {
        XCTAssertEqual(longestPalindrome(input), expect)
    }
}
