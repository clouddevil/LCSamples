
// 143. Reorder List

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
final class ReorderList {
    
    // 206. Reverse Linked List
    private func reverseList(_ head: ListNode?) -> ListNode? {
        var prev: ListNode?
        var current = head
        while (current != nil) {
            let next = current?.next
            current?.next = prev
            prev = current
            current = next
        }
        return prev
    }
    
    private func findMiddle(_ head: ListNode?) -> ListNode? {
        var p1 = head
        var p2 = head?.next
        while (p1 != nil && p2?.next != nil) {
            p1 = p1?.next
            p2 = p2?.next?.next
        }
        return p1
    }
    
    // 72ms
    func reorderList(_ head: ListNode?) {
        var p1 = findMiddle(head)
        var p2 = reverseList(p1?.next)
        p1?.next = nil
        
        p1 = head
        while (p1 != nil) {
            let n = p1?.next
            p1?.next = p2
            p1 = p2
            p2 = n
        }
    }
}

