

// 1032. Stream of Characters

final class StreamChecker {
    
    final class TrieNode {
    var isWord: Bool = false
    var chars = [Character: TrieNode]()
}

    
    var queried = [Character]()
    var root: TrieNode
    
    init(_ words: [String]) {
        root = TrieNode()
        
        for word in words {
            var node = root
            for char in word.reversed() {
                if node.chars[char] == nil {
                    node.chars[char] = TrieNode()
                }
                node = node.chars[char]!
            }
            node.isWord = true
        }
    }
    
    func query(_ letter: Character) -> Bool {
         queried.insert(letter, at: 0)
        
        var node = root
        for char in queried {
            if let next = node.chars[char] {
                if next.isWord { return true }
                node = next
            } else {
                break
            }
        }
        
        return false
    }
}

/**
 * Your StreamChecker object will be instantiated and called as such:
 * let obj = StreamChecker(words)
 * let ret_1: Bool = obj.query(letter)
 */