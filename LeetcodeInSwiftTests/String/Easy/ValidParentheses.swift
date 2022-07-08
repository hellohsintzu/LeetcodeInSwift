//
//  ValidParentheses.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 8/7/2022.
//  https://leetcode.com/problems/valid-parentheses/

import XCTest

class ValidParentheses: XCTestCase {

    /// Given a string s containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
    ///
    /// An input string is valid if:
    ///
    ///  1. Open brackets must be closed by the same type of brackets.
    ///  2. Open brackets must be closed in the correct order.
    func isValid(_ s: String) -> Bool {
        var a: [Character] = [] //Use LIFO of stack to solve the problem.
        for t in Array(s) {
            if t == "(" || t == "[" || t == "{" {
                a.append(t)
            } else {
                guard let l = a.popLast() else { return false }
                if l == "(" && t != ")" {
                    return false
                } else if l == "[" && t != "]" {
                    return false
                } else if l == "{" && t != "}" {
                    return false
                }
            }
        }
        return a.isEmpty
    }

    /// Constraints:
    ///  - 1 <= s.length <= 104
    ///  - s consists of parentheses only '()[]{}'.
    func test_isValid() {
        check(input: "()", expect: true)
        check(input: "()[]{}", expect: true)
        check(input: "(]", expect: false)
        check(input: "([)]", expect: false)

        check(input: "({})", expect: true)
        check(input: "[]({})", expect: true)
        check(input: "][", expect: false)
        check(input: "(({}))(", expect: false)
    }

    func check(input: String, expect: Bool) {
        XCTAssertEqual(isValid(input), expect)
    }
}
