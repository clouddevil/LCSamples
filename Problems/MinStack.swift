import Foundation


class MinStack {

    var stack = [(Int, Int)]()
    init() {
        
    }
    
    func push(_ x: Int) {
        var newMin = x
        if !stack.isEmpty {
            newMin = min(x, getMin())
        }
        stack.append((x, newMin))
    }
    
    func pop() {
        stack.removeLast(1)
    }
    
    func top() -> Int {
        let (v, _) = stack.last!
        return v
    }
    
    func getMin() -> Int {
        let (_, v) = stack.last!
        return v
    }
}
