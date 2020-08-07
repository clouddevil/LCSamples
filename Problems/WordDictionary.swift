
// 211. Add and Search Word - Data structure design

class WordDictionary {
    
    class TrieNode {
        var children = [Character: TrieNode]()
        var isEnd = false
    }
    
    class Trie {
        
        var root = TrieNode()
        
        func addWord(_ word: String) {
            var node = root
            
            for char in word {
                if node.children[char] == nil {
                    node.children[char] = TrieNode()
                }
                node = node.children[char]!
            }
            
            node.isEnd = true
        }
        
        
        func searchWord(_ word: String) -> Bool {
            return dfsSearch(Array(word), 0, root)
        }
        
        private func dfsSearch(_ wordArray: [Character],
                       _ index: Int,
                       _ node: TrieNode) -> Bool {
            if index == wordArray.count {
                return node.isEnd
            }
            
            let char = wordArray[index]
            
            if char != "." {
                guard let nextNode = node.children[char] else {
                    return false
                }
                return dfsSearch(wordArray, index + 1, nextNode)
            } else {
                for key in node.children.keys {
                    if dfsSearch(wordArray, index + 1, node.children[key]!) {
                        return true
                    }
                }
            }
            return false
        }
        
    }
    
    var trie = Trie()
    
    func addWord(_ word: String) {
        trie.addWord(word)
    }
    
    func search(_ word: String) -> Bool {
        return trie.searchWord(word)
    }
}

/*
class DictNode{
    var children: [String:DictNode]
    var isWord: Bool
    
    init(){
        children = [:]
        isWord = false
    }
    
    func add(_ word: String){
        add(word.map{"\($0)"}, 0)
    }
    
    private func add(_ word: [String], _ index: Int){
        if index == word.count{
            isWord = true
            return
        }
        
        if children[word[index]] == nil{
            children[word[index]] = DictNode()
        }
        
        children[word[index]]!.add(word, index + 1)
    }
    
    func search(_ word: String) -> Bool{
        return search(word.map{"\($0)"}, 0)
    }
    
    private func search(_ word: [String], _ index: Int)->Bool{
        if index == word.count{
            return isWord
        }
        
        if word[index] == "."{
            for key in children.keys{
                if children[key]!.search(word, index + 1){
                    return true
                }
            }
            return false
        }
            
        return children[word[index]] != nil ? children[word[index]]!.search(word, index + 1) : false
    }
}

class WordDictionary {
    private var dictNode: DictNode
    
    /** Initialize your data structure here. */
    init() {
        dictNode = DictNode()
    }
    
    /** Adds a word into the data structure. */
    func addWord(_ word: String) {
        dictNode.add(word)
    }
    
    /** Returns if the word is in the data structure. A word could contain the dot character '.' to represent any one letter. */
    func search(_ word: String) -> Bool {
        return dictNode.search(word)
    }
}

var dict = WordDictionary()
dict.addWord("bad")
dict.addWord("dad")
dict.addWord("mad")
dict.search("pad") // false
dict.search("bad") // true
dict.search(".ad") // true
dict.search("..d") // true

*/
