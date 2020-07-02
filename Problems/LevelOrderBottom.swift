
// 107. Binary Tree Level Order Traversal II

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
class LevelOrderBottom {
    
    var result = [[Int]]()
    
    func levelOrderBottom(_ root: TreeNode?) -> [[Int]] {
        dfs(root, depth: 0)
        return result.reversed()
    }
    
    private func dfs(_ root: TreeNode?, depth: Int) {
        if let node = root {
            if (depth < result.count) {
                result[depth].append(node.val)
            } else {
                result.append([node.val])
            }
            dfs(node.left, depth: depth + 1)
            dfs(node.right, depth: depth + 1)
        }
    }
}
