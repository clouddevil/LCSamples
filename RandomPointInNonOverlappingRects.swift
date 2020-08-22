//  497. Random Point in Non-overlapping Rectangles

final class Solution {
    let rects: [[Int]]
    var areas = [Int]()
    var totalArea = 0
    init(_ rects: [[Int]]) {
        self.rects = rects        
        
        for rect in rects {
            totalArea += (rect[2] - rect[0] + 1) * (rect[3] - rect[1] + 1)
            areas.append(totalArea)
        }
    }
    
    func pick() -> [Int] {
        let randInt = Int.random(in: 0..<totalArea)
        
        for (index, area) in areas.enumerated() {
            if area > randInt {
                let rect = rects[index]
                let rcWidth = (rect[2] - rect[0] + 1)
                let rcArea = (area - randInt - 1)
                let x = rect[0] + rcArea % rcWidth
                let y = rect[1] + rcArea / rcWidth
                return [x, y]
            }
        }        
        assert(false)
    }
}
