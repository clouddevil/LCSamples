import Foundation


class Solution {
    
    var res = Int.min
    
    private func maxPathSumImpl(_ root: TreeNode?) -> Int {
        guard let root = root else {
            return 0
        }
        let lp = maxPathSumImpl(root.left)
        let rp = maxPathSumImpl(root.right)
        
        let maxLeaf = max(max(lp, rp) + root.val, root.val)
        let maxPath = max(maxLeaf, lp + rp + root.val)
        res = max(res, maxPath)
        return maxLeaf
    }
    
    func maxPathSum(_ root: TreeNode?) -> Int {
        _ = maxPathSumImpl(root)
        return res
    }
    
}

