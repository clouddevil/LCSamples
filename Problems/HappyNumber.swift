import Foundation


 class HappyNumber {
    public init() {
        
    }
    
     func newIt(_ n: Int) -> Int {
        var p = n
        var result = 0
        while (p > 0) {
            let i = (p % 10)
            p /= 10
            result += i * i
        }
        return result
    }
    
    public func isHappy(_ n: Int) -> Bool {
        var p = n
        var results = Set<Int>()

        while ((p != 1) && !results.contains(p)) {
            results.insert(p)
            p = newIt(p)
        }
        return (p == 1)
    }
}

