import Foundation


func stringShift(_ s: String, _ shift: [[Int]]) -> String {
    if s.isEmpty {
        return ""
    }
    var total = shift.reduce(0) { (r: Int, sht: [Int]) -> Int in
        r + ((sht[0] == 0) ? sht[1] : (0 - sht[1]))
    }
    total = total % s.count
    if (total < 0) {
        total += s.count
    }
    return s.suffix(s.count - total).appending(s.prefix(total))
}
