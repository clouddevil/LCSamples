

// 129. Sum Root to Leaf Numbers


/**
* Definition for a binary tree node.
* struct TreeNode {
*     int val;
*     TreeNode *left;
*     TreeNode *right;
*     TreeNode() : val(0), left(nullptr), right(nullptr) {}
*     TreeNode(int x) : val(x), left(nullptr), right(nullptr) {}
*     TreeNode(int x, TreeNode *left, TreeNode *right) : val(x), left(left), right(right) {}
* };
*/

class SumRootToLeafNumbers {
    func sumNumbers(_ root: TreeNode?) -> Int {
        return sumNumbers(root, 0)
    }
    
    private func sumNumbers(_ root: TreeNode?, _ sum: Int) -> Int {
        guard let root = root else {
            return 0
        }
        let newSum = sum * 10 + root.val
        if (root.left == nil) && (root.right == nil) {
            return newSum
        }
        return sumNumbers(root.left, newSum) + sumNumbers(root.right, newSum)
    }
}
