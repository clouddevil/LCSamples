// 226. Invert Binary Tree

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

class InvertBinaryTree {
    func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard let root = root else {
            return nil
        }
        let r = invertTree(root.right)
        let l = invertTree(root.left)
        root.left = r
        root.right = l
        return root
    }

//    func invertTree(_ root: TreeNode?) -> TreeNode? {
//        guard let root = root else { return nil }
//        if root.left == nil && root.right == nil { return root }
//        return TreeNode(root.val, invertTree(root.right), invertTree(root.left))
//    }
//
//    func invertTree(_ root: TreeNode?) -> TreeNode? {
//        var stack = [root]
//        while !stack.isEmpty {
//            var node = stack.removeLast()
//            if var node = node {
//                (node.left, node.right) = (node.right, node.left)
//                stack.append(node.right)
//                stack.append(node.left)
//            }
//        }
//        return root
//    }
}
