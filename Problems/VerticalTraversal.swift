
// 987. Vertical Order Traversal of a Binary Tree

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

class VerticalTraversal {
    private var result: [Int: [(Int, Int)]] = [:]

    private func recVerticalTraversal(_ root: TreeNode?, level: Int, depth: Int) {
        guard let root = root else {
            return
        }
        
        if result[level] == nil {
            result[level] = [(root.val, depth)]
        } else {
            result[level]!.append((root.val, depth))
        }
        recVerticalTraversal(root.right, level: level + 1, depth: depth + 1)
        recVerticalTraversal(root.left, level: level - 1, depth: depth + 1)
    }

    func verticalTraversal(_ root: TreeNode?) -> [[Int]] {
        recVerticalTraversal(root, level: 0, depth: 0)

        return result.keys.sorted { $0 < $1 }
            .map { result[$0]!.sorted { $0.1 == $1.1 ? $0.0 < $1.0: $0.1 < $1.1 }.map { $0.0 } }
    }
}
