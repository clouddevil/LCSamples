import Foundation


func level(_ root: TreeNode?, _ lvl: Int, _ val: Int) -> Int {
    if root == nil {
        return 0
    }
    if root?.val == val {
        return lvl
    }
    let newLvl = level(root?.left, lvl + 1, val)
    if newLvl != 0 {
        return newLvl
    }
    return level(root?.right, lvl + 1, val)
}

func parent(_ root: TreeNode?, _ val: Int) -> TreeNode? {
    guard  let root = root else {
        return nil
    }
    if ((root.right?.val == val) || (root.left?.val == val)) {
        return root
    }
    if let n = parent(root.left, val) {
        return n
    }
    return parent(root.right, val)
}

func isCousins(_ root: TreeNode?, _ x: Int, _ y: Int) -> Bool {
    if (x == y) {
        return false
    }
    if level(root, 0, x) != level(root, 0, y) {
        return false
    }
    
    let xParent = parent(root, x)?.val ?? 0
    let yParent = parent(root, y)?.val ?? 0
    return (xParent != yParent)
}
