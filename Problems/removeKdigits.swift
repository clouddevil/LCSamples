import Foundation


func removeKdigits(_ num: String, _ k: Int) -> String {
    var result = [Character]()
    var index = k
    for v in num {
        //while ((result.count > 0) && (result.last! > v) && (index > 0)) {
        while index > 0, let l = result.last, l > v {
            _ = result.popLast()
            index -= 1
        }
        if (result.count > 0) || (v != "0") {
            result.append(v)
        }
    }
    while index > 0 {
        _ = result.popLast()
        index -= 1
    }
    return result.isEmpty ? "0" : String(result)
}

//removeKdigits("10200", 1)
//removeKdigits("1432219", 3)
//removeKdigits("10", 2)

