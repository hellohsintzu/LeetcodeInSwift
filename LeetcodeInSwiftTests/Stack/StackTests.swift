//
//  StackTests.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 13/6/2022.
//

import XCTest
import LeetcodeInSwift

class StackTests: XCTestCase {

    func test_Reversed() {
        var testArray: [Int] = []
        for i in 0...10 {
            XCTAssertEqual(testArray.reversedByStack(), testArray.reversed())
            testArray.append(i)
        }
    }

    func test_isParentheses() {
        var testString = ""
        XCTAssertEqual(testString.isParentheses(), false)
        testString = "()"
        XCTAssertEqual(testString.isParentheses(), true)
        testString = "((()))"
        XCTAssertEqual(testString.isParentheses(), true)
        testString = ")("
        XCTAssertEqual(testString.isParentheses(), false)
        testString = "(().ladfhjs()))"
        XCTAssertEqual(testString.isParentheses(), false)
        testString = "h((e))llo(world)()"
        XCTAssertEqual(testString.isParentheses(), true)
        testString = "(hello world"
        XCTAssertEqual(testString.isParentheses(), false)
    }
}
