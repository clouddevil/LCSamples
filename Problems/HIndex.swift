
// 275. H-Index II

class HIndex {
    func hIndex(_ citations: [Int]) -> Int {
        let len = citations.count
        var i = 0
        for c in citations {
            if (c >= len - i) {
                return len - i
            } else {
                i += 1
            }
        }
        return 0
    }
}
