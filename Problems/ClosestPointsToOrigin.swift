
// 973. K Closest Points to Origin


class ClosestPointsToOrigin {
    
    func dist(_ pt: [Int]) -> Int {
        pt[0] * pt[1] + pt[1] * pt[1]
    }
    
    func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {
        var dists = Array(repeating: (0, 0), count: points.count)
        for i in 0..<dists.count {
            dists[i] = (dist(points[i]), i)
        }
        dists.sort {
            $0.0 < $1.0
        }
        var ans = Array(repeating: [Int](), count: K)
        for i in 0..<K {
            ans[i] = points[dists[i].1]
        }
        return ans
    }
    
}
