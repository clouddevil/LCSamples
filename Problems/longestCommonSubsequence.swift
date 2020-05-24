import Foundation

func lcs(_ c1: [Character], _ ci: Int, _ c2: [Character], _ cj: Int) -> Int {
    if (c1.count == ci) || (c2.count == cj) {
        return 0
    }
    if (c1[ci] == c2[cj]) {
        return lcs(c1, ci + 1, c2, cj + 1) + 1
    }
    
    return max(lcs(c1, ci + 1, c2, cj), lcs(c1, ci, c2, cj + 1))
    
}

func longestCommonSubsequence(_ text1: String, _ text2: String) -> Int {
    return lcs(Array(text1), 0, Array(text2), 0)
}

func lcs(_ c1: [Character], _ c2: [Character]) -> Int {
    var chs = Array(repeating: Array(repeating: 0, count: c1.count + 1), count: c2.count + 1)
    for i in 1...c1.count {
        for j in 1...c2.count {
            if (c1[i - 1] == c2[j - 1]) {
                chs[j][i] = chs[j - 1][i - 1] + 1
            } else {
                chs[j][i] = max(chs[j - 1][i], chs[j][i - 1])
            }
            //print(chs[j][i])
        }
    }
    return chs[c2.count][c1.count]
}

func longestCommonSubsequence1(_ text1: String, _ text2: String) -> Int {
    if (text1.isEmpty || text2.isEmpty) {
        return 0
    }
    return lcs(Array(text1), Array(text2))
}


func lcs2(_ c1: [Character], _ c2: [Character]) -> Int {
    var chs = Array(repeating: Array(repeating: 0, count: c1.count + 1), count: c2.count + 1)
    for i in 1...c1.count {
        for j in 1...c2.count {
            if (c1[i - 1] == c2[j - 1]) {
                chs[j][i] = chs[j - 1][i - 1] + 1
            } else {
                chs[j][i] = max(chs[j - 1][i], chs[j][i - 1])
            }
            //print(chs[j][i])
        }
    }
    return chs[c2.count][c1.count]
}

func longestCommonSubsequence2(_ text1: String, _ text2: String) -> Int {
    let c1 = Array(text1)
    let c2 = Array(text2)
    let c1Len = c1.count

    var row1 = Array(repeating: 0, count: c1Len + 1)
    
    var y = c2.count - 1
    while y >= 0 {
        var x = c1Len - 1
        let row0 = row1
        while x >= 0 {
            if c1[x] == c2[y] {
                row1[x] = row0[x + 1] + 1
            } else {
                row1[x] = max(row1[x + 1], row0[ x ])
            }
            x -= 1
        }
        y -= 1
    }
    return row1[0]
}

//longestCommonSubsequence("", "cba")
//longestCommonSubsequence("abc", "")
//longestCommonSubsequence("abcde", "ace")
//longestCommonSubsequence("abc", "abc")
//longestCommonSubsequence("abc", "cba")
//longestCommonSubsequence("pmjghexybyrgzczy", "hafcdqbgncrcbihkd")
//
