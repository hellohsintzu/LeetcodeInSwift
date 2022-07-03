//
//  FindSmalledtPositiveInteger.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 3/7/2022.
//  https://app.codility.com/c/run/demo6779BJ-JE7/

import XCTest

class FindSmallestPositiveInteger: XCTestCase {

    /// Given an array A of N integers, returns the smallest positive integer (greater than 0) that does not occur in A.
    func solution(_ A : inout [Int]) -> Int {
        let s = Array(Set(A)).sorted()
        for i in 0..<s.count {
            if s[i] > 0 && s[i] != i+1 {
                return i+1
            }
        }
        return s.last! > 0 ? s.last! + 1 : 1
    }

    /// N is an integer within the range [1..100,000];
    /// each element of array A is an integer within the range [−1,000,000..1,000,000].
    func test_solution() {
        check(input: [0], expect: 1)
        check(input: [1], expect: 2)
        check(input: [-1,-3], expect: 1)
        check(input: [1,2,3], expect: 4)
        check(input: [1,1,1,1], expect: 2)
        check(input: [-1,-2,1,2], expect: 3)
        check(input: [1,3,6,4,1,2], expect: 5)
    }


    func check(input: [Int], expect: Int) {
        var input = input
        XCTAssertEqual(solution(&input), expect)
    }
}
