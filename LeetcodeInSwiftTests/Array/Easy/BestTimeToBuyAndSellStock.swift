//
//  BestTimeToBuyAndSellStock.swift
//  LeetcodeInSwiftTests
//
//  Created by Gordon Feng on 3/7/2022.
//  https://leetcode.com/problems/best-time-to-buy-and-sell-stock/

import XCTest

class BestTimeToBuyAndSellStock: XCTestCase {

    /// You are given an array `prices` where `prices[i]` is the price of a given stock on the `ith` day.
    ///
    /// You want to maximize your profit by choosing a `single day` to buy one stock and choosing a `different day in the future` to sell that stock.
    ///
    /// Return `the maximum profit you can achieve from this transaction. If you cannot achieve any profit, return 0`.
    func maxProfit(_ prices: [Int]) -> Int {

        var currProfit = 0
        var maxSoFar = 0
        for i in 1..<prices.count {
            currProfit += prices[i] - prices[i-1]   //Add daily profit everyday.
            currProfit = max(0, currProfit)         //if current profit is negative, set to 0.
            maxSoFar = max(maxSoFar, currProfit)    //record every highest profit.
        }
        return maxSoFar
    }

    /// Constraints:
    ///  - 1 <= prices.length <= 10^5
    ///  - 0 <= prices[i] <= 10^4
    func test_MaxProfit() {
        /**
         Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
         Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
         */
        check(input: [7,1,5,3,6,4], expect: 5)

        //Explanation: In this case, no transactions are done and the max profit = 0.
        check(input: [7,6,4,3,1], expect: 0)

        check(input: [1,4,1,4,3,1], expect: 3)
        check(input: [2,4,1], expect: 2)
    }

    func check(input: [Int], expect: Int) {
        XCTAssertEqual(maxProfit(input), expect)
    }

}
