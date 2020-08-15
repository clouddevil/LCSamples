
// 435. Non-overlapping Intervals

class EraseOverlapIntervals {
    func eraseOverlapIntervals(_ intervals: [[Int]]) -> Int {
        guard !intervals.isEmpty else {
            return 0
        }
        
        let sortedIntervals = intervals.sorted { $0[1] < $1[1] }
        var count = 1
        var end = sortedIntervals[0][1]
        for i in 1..<sortedIntervals.count {
            if (sortedIntervals[i][0] >= end) {
                end = sortedIntervals[i][1]
                count += 1
            }
        }
        return sortedIntervals.count - count
    }
}

//let s = EraseOverlapIntervals()
//s.eraseOverlapIntervals([[1, 2], [1, 2], [1, 2]])
//s.eraseOverlapIntervals([[1,2],[2,3],[3,4],[1,3]])
//s.eraseOverlapIntervals([[1, 2], [2, 3]])
