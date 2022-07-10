//
//  LongestSubstringWithoutRepeatingCharacters.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 9/7/2022.
//  https://leetcode.com/problems/longest-substring-without-repeating-characters/

import XCTest

class LongestSubstringWithoutRepeatingCharacters: XCTestCase {

    /// Given a string s, find the length of the longest substring without repeating characters.
    func lengthOfLongestSubstring(_ s: String) -> Int {
        let characters = Array(s)
        var result = 0

        for startIndex in 0..<characters.count {
            var s: Set<Character> = []
            var endIndex = startIndex
            var sum = 0
            while endIndex <= characters.count-1 {
                s.insert(characters[endIndex])
                if s.count != (endIndex-startIndex)+1 {
                    result = max(result, sum)
                    break
                } else if endIndex == characters.count-1 {
                    sum += 1
                    result = max(result, sum)
                }
                sum += 1
                endIndex += 1
            }
        }
        return result
    }

    /// Constraints:
    ///  - 0 <= s.length <= 5 * 104
    ///  - s consists of English letters, digits, symbols and spaces.
    func test_LengthOfLongestSubstring() {

        //Explanation: The answer is "abc", with the length of 3.
        check(input: "abcabcbb", expect: 3)

        //Explanation: The answer is "b", with the length of 1.
        check(input: "bbbbb", expect: 1)

        //Explanation: The answer is "wke", with the length of 3.
        //Notice that the answer must be a substring, "pwke" is a subsequence and not a substring.
        check(input: "pwwkew", expect: 3)

        check(input: " ", expect: 1)

        check(input: "a", expect: 1)
        check(input: "", expect: 0)
        check(input: "ertypoiu", expect: 8)
        check(input: "qweqpoiu", expect: 7)
    }

    func check(input: String, expect: Int) {
        XCTAssertEqual(lengthOfLongestSubstring(input), expect)
    }
}
