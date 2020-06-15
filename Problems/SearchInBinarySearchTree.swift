// 700. Search in a Binary Search Tree

/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     public var val: Int
 *     public var left: TreeNode?
 *     public var right: TreeNode?
 *     public init() { self.val = 0; self.left = nil; self.right = nil; }
 *     public init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
 *     public init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
 *         self.val = val
 *         self.left = left
 *         self.right = right
 *     }
 * }
 */
class SearchInBinarySearchTree {
    func searchBST(_ root: TreeNode?, _ val: Int) -> TreeNode? {
        guard let r = root else {
            return nil
        }
        if r.val == val {
            return r
        } else if val > r.val {
            return searchBST(r.right, val)
        } else {
            return searchBST(r.left, val)
        }
    }
}
