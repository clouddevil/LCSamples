import Foundation


class StockSpanner {
    var prices = [Int]()
    var weights = [Int]()

    init() {
        
    }
    
    func next(_ price: Int) -> Int {
        var w = 1
        while let l = prices.last, l <= price {
            prices.removeLast()
            w += weights.removeLast()
        }
        prices.append(price)
        weights.append(w)
        return w
    }
}


//let obj = StockSpanner()
//obj.next(11)
//obj.next(3)
//obj.next(9)
//obj.next(5)
//obj.next(6)
//obj.next(4)
//obj.next(7)
////print(obj.weights)
//obj.next(2)

