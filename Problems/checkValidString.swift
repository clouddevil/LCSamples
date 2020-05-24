import Foundation



func checkValidString(_ s: String) -> Bool {
    var lb = 0
    var rb = 0
    for v in s {
        if (v == "(") {
            lb += 1
            rb += 1
        } else if (v == "*") {
            lb -= 1
            rb += 1
        } else { // )
            lb -= 1
            rb -= 1
        }
        if (rb < 0) { return false }
        lb = max(lb, 0)
    }
    return lb == 0
}

