import Foundation

func canConstruct(_ ransomNote: String, _ magazine: String) -> Bool {
    var chs = [Character: Int]()
    magazine.forEach { ch in
        let v = chs[ch] ?? 0
        chs[ch] = v + 1
    }
    for ch in ransomNote {
        let v = chs[ch]
        if (v == nil) {
            return false
        } else if (v == 0) {
            return false
        } else {
            chs[ch] = v! - 1
        }
    }
    return true
}

//canConstruct("a", "b")
//canConstruct("aa", "ab")
//canConstruct("aa", "aab")
