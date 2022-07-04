//
//  RomanToInteger.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 4/7/2022.
//  https://leetcode.com/problems/roman-to-integer/

import XCTest

class RomanToInteger: XCTestCase {

    /// Roman numerals are represented by seven different symbols: `I`, `V`, `X`, `L`, `C`, `D` and `M`.
    ///
    /// For example, `2` is written as `II` in Roman numeral, just two ones added together. `12` is written as `XII`, which is simply `X + II`. The number `27` is written as `XXVII`, which is `XX + V + II`.
    ///
    /// Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not `IIII`. Instead, the number four is written as `IV`. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as `IX`. There are six instances where subtraction is used:
    ///
    ///  - `I` can be placed before `V` (5) and `X` (10) to make 4 and 9.
    ///  - `X` can be placed before `L` (50) and `C` (100) to make 40 and 90.
    ///  - `C` can be placed before `D` (500) and `M` (1000) to make 400 and 900.
    func romanToInt(_ s: String) -> Int {
        var remanString = s
        let basicRomanTable: [String: Int] = ["I": 1, "X": 10, "C": 100, "M": 1000,
                                   "V": 5, "L": 50, "D": 500]

        //Replace all of the combination to basic roman string.
        remanString = remanString.replacingOccurrences(of: "IV", with: "IIII")
        remanString = remanString.replacingOccurrences(of: "IX", with: "VIIII")
        remanString = remanString.replacingOccurrences(of: "XL", with: "XXXX")
        remanString = remanString.replacingOccurrences(of: "XC", with: "LXXXX")
        remanString = remanString.replacingOccurrences(of: "CD", with: "CCCC")
        remanString = remanString.replacingOccurrences(of: "CM", with: "DCCCC")

        var result = 0
        for c in remanString {
            result += basicRomanTable[String(c)]!
        }
        return result
    }

    /// Constraints:
    ///  - 1 <= s.length <= 15
    ///  - s contains only the characters ('I', 'V', 'X', 'L', 'C', 'D', 'M').
    ///  - It is guaranteed that s is a valid roman numeral in the range [1, 3999].
    func test_RomanToInt() {

        //Explanation: III = 3.
        check(input: "III", expect: 3)

        //Explanation: L = 50, V= 5, III = 3.
        check(input: "LVIII", expect: 58)

        //Explanation: M = 1000, CM = 900, XC = 90 and IV = 4.
        check(input: "MCMXCIV", expect: 1994)
    }

    func check(input: String, expect: Int) {
        XCTAssertEqual(romanToInt(input), expect)
    }
}
