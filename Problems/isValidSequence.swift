import Foundation

func isValidSequence(_ root: TreeNode?, _ arr: [Int]) -> Bool {
    var index = 0
    var lNode = root
    var rNode: TreeNode?
    while (index < arr.count) {
        let val = arr[index]
        if (val == lNode?.val) {
            rNode = lNode?.right
            lNode = lNode?.left
        } else if (val == rNode?.val) {
            lNode = rNode?.left
            rNode = rNode?.right
        } else {
            return false
        }
        
        index += 1
    }
    return (lNode == nil) && (rNode == nil)
}


class IIsValidSequence {
    var arr: [Int]!
    var index = 0
    
    func isValidSequenceImpl(_ root: TreeNode?, _ arr: [Int], _ index: Int) -> Bool {
        if (index >= arr.count) {
            return false
        }
        let val = arr[index]
        if (val == root?.val) {
            if (root?.left == nil && root?.right == nil) {
                return (index == arr.count - 1)
            }
            return isValidSequenceImpl(root?.left, arr, index + 1) || isValidSequenceImpl(root?.right, arr, index + 1)
        }
        return false
    }

    func isValidSequence(_ root: TreeNode?, _ arr: [Int]) -> Bool {
        isValidSequenceImpl(root, arr, 0)
    }
}

//
//print("\(val)   \(lNode?.left)  \(rNode?.right)")
//let tree = bstFromPreorder([0,1,0,0,1,0,nil,nil,1,0,0])
//let tree = TreeNode(0)
//tree.left = TreeNode(1)
//tree.right = TreeNode(0)
//tree.right?.left = TreeNode(0)
//tree.left?.left = TreeNode(0)
//tree.left?.left?.left = TreeNode(1)
//tree.left?.right = TreeNode(1)
//tree.left?.right?.left = TreeNode(0)
//tree.left?.right?.right = TreeNode(0)
//let s = Solution()
//s.isValidSequence(tree, [0, 1, 1 ])
