import Foundation


func firstUniqChar(_ s: String) -> Int {
    var hMap = [Character: Int]()
    
    for ch in s {
        hMap[ch] = (hMap[ch] ?? 0) + 1
    }
    print(hMap)
    
    let index = s.firstIndex(where: { hMap[$0] == 1 })?.utf16Offset(in: s)
    return index ?? -1
}

//firstUniqChar("loveleetcode")
//firstUniqChar("leetcode")
//firstUniqChar("ss")
