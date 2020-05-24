import Foundation

func numJewelsInStones(_ J: String, _ S: String) -> Int {
    let jews = Set(J)
    let stones = Array(S)
    
    var count = 0
    stones.forEach {
        if jews.contains($0) {
            count += 1
        }
    }
    return count
}

//numJewelsInStones("aA", "aAAbbbb")
