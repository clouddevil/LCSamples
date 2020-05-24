import Foundation



public class CountingElements {
    public init() {}
    
    public func countElements(_ arr: [Int]) -> Int {
        var hash = [Int: Bool]()
        arr.forEach { hash[$0] = true }
        return arr.reduce(0) { res, value in
            return (hash[value + 1] == true) ? res + 1 : res
        }
    }
    
    
}
//
//
//let s = Set(arr)
//return arr.reduce(0) { res, value in
//    return s.contains(value + 1) ? res + 1 : res
//}
