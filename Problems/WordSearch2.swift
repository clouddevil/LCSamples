
// 212. Word Search II

class WordSearch2 {
    private final class TrieNode {
        var children: [Character: TrieNode] = [:]
        var word: String?
    }

    private var res: [String] = []

    func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
        let m = board.count
        let n = board[0].count
        if m == 0 { return [] }
        let root = buildTrie(words)
        var mBoard = board
        for i in 0..<m {
            for j in 0..<n {
                dfs(&mBoard, i, j, m, n, root)
            }
        }
        return res
    }

    private func dfs(_ board: inout [[Character]], _ i: Int, _ j: Int, _ m: Int, _ n: Int, _ node: TrieNode) {
        guard i >= 0 && i < m else {
            return
        }
        guard j >= 0 && j < n else {
            return
        }
        if board[i][j] == "." {
            return
        }
        let char = board[i][j]
        guard let child = node.children[char] else { return }
        if let word = child.word {
            res.append(word)
            child.word = nil
        }
        board[i][j] = "."
        dfs(&board, i + 1, j, m, n, child)
        dfs(&board, i - 1, j, m, n, child)
        dfs(&board, i, j + 1, m, n, child)
        dfs(&board, i, j - 1, m, n, child)
        board[i][j] = char
    }

    private func buildTrie(_ words: [String]) -> TrieNode {
        let root = TrieNode()
        for word in words {
            var p = root
            let arr = Array(word)
            for c in arr {
                if p.children[c] == nil {
                    p.children[c] = TrieNode()
                }
                p = p.children[c]!
            }
            p.word = word
        }
        return root
    }
}

/*
let chs: [[Character]] = [
    ["o", "a", "a", "n"],
    ["e", "t", "a", "e"],
    ["i", "h", "k", "r"],
    ["i", "f", "l", "v"]
]

let words = ["oath", "pea", "eat", "rain"]

let v = WordSearch2()
v.findWords(chs, words)
*/



