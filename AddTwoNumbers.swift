
// 2. Add Two Numbers

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
class Solution {
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var result = ListNode()
        var resultHead = result
        var n1 = l1
        var n2 = l2
        var carry = 0
        
        while (n1 != nil || n2 != nil) {
            let res = (n1?.val ?? 0) + (n2?.val ?? 0) + carry
            carry = res / 10
            let node = ListNode(res % 10)
            result.next = node
            result = node
            n1 = n1?.next
            n2 = n2?.next
        }
        
        if carry > 0 {
            result.next = ListNode(carry)
        }
        return resultHead.next     
    }
}
