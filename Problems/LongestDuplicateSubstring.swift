// 1044. Longest Duplicate Substring

// LTE
class LongestDupSubstring1 {
    final class TrieNode {
        var next: [TrieNode?]!
        var i: Int = 0
        var depth: Int = 0
        
        var isLeaf: Bool {
            return next == nil
        }

        init(_ i: Int, _ depth: Int) {
            self.i = i
            self.depth = depth
        }
        
        func setNext(_ index: Int, _ v: TrieNode) {
            if (next == nil) {
               next = Array(repeating: nil, count: 26)
            }
            next[index] = v
        }
    }
    
    let charA: Int = Int(Character("a").asciiValue!)
    var sArray: [Int]!
    
    func longestDupSubstring(_ S: String) -> String {
        sArray = Array(S).map { Int($0.asciiValue!) - charA }
        var maxLo = 0
        var maxLength = 0
        
        let root = TrieNode(0, 0)
        var i = 1
        while ((i + maxLength) < S.count) {
            let len = addNew(root, i)
            if (len > maxLength) {
                maxLength = len
                maxLo = i
            }
            i += 1
        }
        print(maxLo)
        print(maxLength)
        let s = sArray[maxLo..<(maxLo + maxLength)]
        return String(s.map {
            Character(UnicodeScalar($0 + charA)!)
        })
    }

    func getIndex(_ i: Int, _ depth: Int) -> Int {
        return sArray[i + depth]
    }

    func addNew(_ node: TrieNode, _ i: Int) -> Int {
        let depth = node.depth
        if (i + depth >= sArray.count) {
            return depth
        }
        if node.isLeaf {
            let index = getIndex(node.i, node.depth)
            node.setNext(index, TrieNode(node.i, depth + 1))
        }
        let c = getIndex(i, node.depth)
        if let x = node.next[c] {
            return addNew(x, i)
        }
        node.setNext(c, TrieNode(i, depth + 1))
        return depth
    }
}


// LTE
class LongestDupSubstring0 {
    
    func longestDupSubstring0(_ S: String) -> String {
        let n = S.count
        for l in (2...(n-1)).reversed() {
            var strSet = Set<String>()
            for i in 0...(n-l) {
                let start = S.index(S.startIndex, offsetBy: i)
                let end = S.index(S.startIndex, offsetBy: i + l)
                let s = String(S[start..<end])
                if strSet.contains(s) {
                    return s
                } else {
                    strSet.insert(s)
                }
            }
        }
        return ""
    }
}
