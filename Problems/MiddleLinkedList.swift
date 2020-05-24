import Foundation


// Definition for singly-linked list.
 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init(_ val: Int) {
         self.val = val
         self.next = nil
     }
 }


public class MiddleLinkedList {
    public init() {}
    
    func middleNode(_ head: ListNode?) -> ListNode? {
        guard head?.next != nil else { return head }
        var slowPointer = head
        var fastPointer = head
        while fastPointer != nil && fastPointer?.next != nil {
            slowPointer = slowPointer?.next
            fastPointer = fastPointer?.next?.next
        }
        return slowPointer
    }
    
//    func middleNode(_ head: ListNode?) -> ListNode? {
//        var count = 0
//        var result = head
//        while(result != nil) {
//            result = result?.next
//            count += 1
//        }
//        count /= 2
//        result = head
//        while(count > 0) {
//            result = result?.next
//            count -= 1
//        }
//        return result
//    }
}
