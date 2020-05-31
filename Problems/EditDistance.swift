// 72. Edit Distance

class EditDistance {
    func minDistance(_ word1: String, _ word2: String) -> Int {
        guard !word1.isEmpty && !word2.isEmpty else {
            return max(word1.count, word2.count)
        }
        
        var row = Array(repeating: 0, count: word2.count + 1)
        for i in 0 ... word2.count {
            row[i] = i
        }

        var table = Array(repeating: row, count: word1.count + 1)

        for i in 0 ... word1.count {
            table[i][0] = i
        }

        let w1 = Array(word1)
        let w2 = Array(word2)
        for x in 1 ... word1.count {
            for y in 1 ... word2.count {
                if w1[x - 1] == w2[y - 1] {
                    table[x][y] = table[x - 1][y - 1]
                } else {
                    table[x][y] = 1 + min(table[x - 1][y - 1], table[x][y - 1], table[x - 1][y])
                }
            }
        }

        return table[word1.count][word2.count]
    }
}
