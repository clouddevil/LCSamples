import Foundation


public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        left = nil
        right = nil
    }
}


public func bstFromPreorder(_ preorder: [Int]) -> TreeNode? {
    if (preorder.isEmpty) {
        return nil
    }
    
    let treeNode = TreeNode(preorder[0])
    
    for i in 1..<preorder.count {
        let val = preorder[i]
        insert(val, to: treeNode)
    }
    
    return treeNode
}

func insert(_ val: Int, to tree: TreeNode) {
    if val < tree.val {
        if let left = tree.left {
            insert(val, to: left)
        } else {
            tree.left = TreeNode(val)
        }
        
    } else if val > tree.val {
        if let right = tree.right {
            insert(val, to: right)
        } else {
            tree.right = TreeNode(val)
        }
    }
}













func bstFromPreorder1(_ preorder: [Int]) -> TreeNode? {
    if (preorder.isEmpty) {
        return nil
    }
    let rootVal = preorder[0]
    let rootNode = TreeNode(rootVal)
    let sorted = preorder.sorted()
    let rootIndex = sorted.firstIndex(of: rootVal)!
    let leftPart = sorted.prefix(rootIndex)
    let rightPart = sorted.suffix(sorted.count - rootIndex - 1)
    // TODO: filter once
    rootNode.left = bstFromPreorder(preorder.filter { leftPart.contains($0) })
    rootNode.right = bstFromPreorder(preorder.filter { rightPart.contains($0) })
    return rootNode
}


//let s = [8,5,1,7,10,12]
////bstFromPreorder(s)
//
//let sorted = s//.sorted()
//let index = sorted.firstIndex(of: 10)!
//sorted.prefix(index).sorted()
//sorted.suffix(sorted.count - index - 1)
