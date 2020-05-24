import Foundation

func lastStoneWeight(_ stones: [Int]) -> Int {
    var s = stones.sorted()
    while (s.count > 1) {
        let k = s.popLast()!
        let t = s.popLast()!
        let delta = k - t
        if (delta > 0) {
            s.append(delta)
            s = s.sorted()
        }
        
    }
    return s.first ?? 0
}
