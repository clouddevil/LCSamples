import Foundation

public class MaxProfit {
    
    public init() {}
    
    public func maxProfit(_ prices: [Int]) -> Int {
        if (prices.isEmpty) {
            return 0
        }
        var maxProfit = 0
        for i in 1..<prices.count {
            let delta = prices[i] - prices[i - 1]
            if (delta > 0) {
                maxProfit += delta
            }
        }
        return maxProfit
    }
}


//
//class Solution {
//    public int maxProfit(int[] prices) {
//        int maxprofit = 0;
//        for (int i = 1; i < prices.length; i++) {
//            if (prices[i] > prices[i - 1])
//                maxprofit += prices[i] - prices[i - 1];
//        }
//        return maxprofit;
//    }
//}
