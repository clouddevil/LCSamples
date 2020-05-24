import Foundation


class LRUCache {
    class Node {
        var key = 0
        var value = 0
        var next: Node?
        var prev: Node?

        init(key: Int, value: Int) {
            self.key = key
            self.value = value
        }
    }

    var head: Node?
    var tail: Node?
    var hm = [Int: Node]()
    let capacity: Int

    init(_ capacity: Int) {
        self.capacity = capacity
    }

    func get(_ key: Int) -> Int {
        guard let n = hm[key] else {
            return -1
        }
        removeNode(n)
        insertNode(n)
        return n.value
    }

    func put(_ key: Int, _ value: Int) {
        if let n = hm[key] {
            n.value = value
            removeNode(n)
            insertNode(n)
        } else {
            if hm.count >= capacity {
                if let h = head {
                    hm.removeValue(forKey: h.key)
                    removeNode(h)
                }
            }
            
            let node = Node(key: key, value: value)
            insertNode(node)
            hm[key] = node
        }
    }
    
    private func removeNode(_ n: Node) {
        if (n.prev != nil) {
            n.prev?.next = n.next
        } else {
            head = n.next
        }
        if (n.next != nil) {
            n.next?.prev = n.prev
        } else {
            tail = n.prev
        }
    }
    
    private func insertNode(_ n: Node) {
        if (tail != nil) {
            tail?.next = n
        }
        n.prev = tail
        n.next = nil
        tail = n
        if (head == nil) {
            head = tail
        }
    }
}


//["LRUCache","put","put","put","put","get","get","get","get","put","get","get","get","get","get"]
//[[3],[1,1],[2,2],[3,3],[4,4],[4],[3],[2],[1],[5,5],[1],[2],[3],[4],[5]]
//var cache = LRUCache(3)
//
//cache.put(1, 1)
//cache.put(2, 2)
//cache.put(3, 3)
//cache.put(4, 4)
//cache.get(4)
//cache.get(3)
//cache.get(2)
//cache.get(1)
//cache.put(5, 5)
//cache.get(1)
//cache.get(2)
//cache.get(3)
//cache.get(4)
//cache.get(5)
//
////[null,null,null,null,null,4,3,2,-1,null,-1,2,3,-1,5]
