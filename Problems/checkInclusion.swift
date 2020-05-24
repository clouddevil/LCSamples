import Foundation



let delta = Character("a").asciiValue!

func val(_ ch: Character) -> Int {
    return Int(ch.asciiValue! - delta)
}

func equals(_ a: [Int], _ b: [Int]) -> Bool {
    for i in 0..<a.count {
        if a[i] != b[i] {
            return false
        }
    }
    return true
}

func checkInclusion(_ s1: String, _ s2: String) -> Bool {
    guard s1.count <= s2.count else {
        return false
    }
    
    var s1map = Array(repeating: 0, count: 26)
    for v in s1 {
        s1map[val(v)] += 1
    }
    let s2Array = Array(s2)
    for i in 0...(s2.count - s1.count) {
        var s2map = Array(repeating: 0, count: 26)
        for j in 0..<s1.count {
            s2map[val(s2Array[i + j])] += 1
        }
        if (equals(s2map, s1map)) {
            return true
        }
    }
    return false
}

//checkInclusion("ab", "eidbaooo")
//checkInclusion("ab", "eidboaoo")
//checkInclusion("", "")
