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
        guard !s.isEmpty else { return 0 }

        var char: [Character] = [], maxLength = 0

        for c in s {
            //If there is any duplicate character in char, get the index
            if let duplicateIndex = char.firstIndex(of: c) {
                //Remove character in char from index 0 to the duplicateIndex
                char.removeSubrange(0...duplicateIndex)
            }
            char.append(c)  //Add c at the end of char.
            //Since there are all unique character in char, compare the length with maximum length
            maxLength = max(maxLength, char.count)
        }
        return maxLength
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
