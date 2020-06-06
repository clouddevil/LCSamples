
// 406. Queue Reconstruction by Height

class ReconstructQueue {
    func reconstructQueue(_ people: [[Int]]) -> [[Int]] {
        let sortedArray = people.sorted { (a, b) -> Bool in
            if a[0] == b[0] {
                return a[1] < b[1]
            }
            return a[0] > b[0]
        }
        var result = [[Int]]()
        for p in sortedArray {
            result.insert(p, at: p[1])
        }
        return result
    }
}
