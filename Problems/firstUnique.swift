import Foundation


class FirstUnique {
    class Node {
        var value = 0
        var removed = false
        var next: Node?
        var prev: Node?

        init(_ value: Int) {
            self.value = value
        }
    }

    var head: Node?
    var tail: Node?
    var hm = [Int: Node]()

    init(_ nums: [Int]) {
        nums.forEach {
            print("add \($0)")
            add($0)
            printnodes()
            printmap()
        }
    }

    func showFirstUnique() -> Int {
        return head?.value ?? -1
    }

    func add(_ value: Int) {
        
        if let v = hm[value] {
            removeNode(v)
        } else {
            hm[value] = insertNode(Node(value))
        }
    }
        
    
    func printmap() {
        var s = [Int]()
        hm.forEach { (key, node) in
            s.append(key)
        }
        print("map \(s)")
    }
    
    func printnodes() {
        var s = [Int]()
        var n = head
        while (n != nil) {
            s.append(n!.value)
            n = n?.next
        }
        print("nodes \(s)")
    }
    
    private func removeNode(_ n: Node) {
        if (n.removed) {
            return
        }
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
        n.removed = true
    }
    
    private func insertNode(_ n: Node) -> Node {
        if (tail != nil) {
            tail?.next = n
        }
        n.prev = tail
        n.next = nil
        tail = n
        if (head == nil) {
            head = tail
        }
        return n
    }
}

//var s = FirstUnique([4,7,4,1,4,7,5,1,7])
//s.printmap()
//s.printnodes()
//s.showFirstUnique()

//s.add(1)
//s.showFirstUnique()
//s.add(2)
//s.showFirstUnique()
//s.add(3)
//s.add(3)
//s.showFirstUnique()

//let firstUnique =  FirstUnique([4,7,4,1,4,7,5,1,7]);
//firstUnique.showFirstUnique(); // return -1
//firstUnique.add(7);            // the queue is now [7,7,7,7,7,7,7]
//firstUnique.add(3);            // the queue is now [7,7,7,7,7,7,7,3]
//firstUnique.add(3);            // the queue is now [7,7,7,7,7,7,7,3,3]
//firstUnique.add(7);            // the queue is now [7,7,7,7,7,7,7,3,3,7]
//firstUnique.add(17);           // the queue is now [7,7,7,7,7,7,7,3,3,7,17]
//firstUnique.showFirstUnique(); // return 17

//let firstUnique = FirstUnique([2,3,5]);
//firstUnique.showFirstUnique(); // return 2
//firstUnique.add(5);            // the queue is now [2,3,5,5]
//firstUnique.showFirstUnique(); // return 2
//firstUnique.add(2);            // the queue is now [2,3,5,5,2]
//firstUnique.showFirstUnique(); // return 3
//firstUnique.add(3);            // the queue is now [2,3,5,5,2,3]
//firstUnique.showFirstUnique(); // return -1

//let firstUnique = FirstUnique([809]);
//firstUnique.showFirstUnique(); // return 809
//firstUnique.add(809);          // the queue is now [809,809]
//firstUnique.showFirstUnique(); // return -1
