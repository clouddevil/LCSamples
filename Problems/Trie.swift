import Foundation


class Trie {
 
    private var children = [Character: Trie]()
    private var holdsWord = false
    
    init() {}
    
    func insert(_ word: String) {
        guard let firstCharacter = word.first else {
            holdsWord = true
            return
        }

        let child: Trie
        if let existingChild = children[firstCharacter] {
            child = existingChild
        } else {
            child = Trie()
            children[firstCharacter] = child
        }
        child.insert(String(word.suffix(word.count - 1)))
    }
    
    func search(_ word: String) -> Bool {
        if let s = subTrie(word) {
            return s.holdsWord
        }
        return false
    }
    
    func startsWith(_ prefix: String) -> Bool {
        if let _ = subTrie(prefix) {
            return true
        }
        return false
    }

    private func subTrie(_ word: String) -> Trie? {
        guard let firstCharacter = word.first else {
            return self
        }
        
        let child = children[firstCharacter]
        return child?.subTrie(String(word.suffix(word.count - 1)))
    }
}


//let trie = Trie()
//
//trie.insert("apple")
//trie.search("apple")   // returns true
//trie.search("app")     // returns false
//trie.startsWith("app") // returns true
//trie.insert("app")
//trie.search("app")     // returns true
