/**
 Question:
 Given a binary tree where all the right nodes are either leaf nodes with a sibling (a left
 node that shares the same parent node) or empty, flip it upside down and turn it into a tree
 where the original right nodes turned into left leaf nodes. Return the new root.
 
 For example:
 Given a binary tree {1, 2, 3, 4, 5},
     1
    / \
   2   3
  / \
 4   5
 return the root of the binary tree [4, 5, 2, #, #, 3, 1].
     4
    / \
   5   2
      / \
     3   1
 
 Hint:
 At each node you want to assign:
 p.left = parent.right
 p.right = parent
 */

import Foundation

/**
 Definition for a binary tree node
 */
public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

/**
 Top down approach:
 We need to be very careful when reassigning current node’s left and right children. Besides making a copy of the parent node, you would also need to make a copy of the parent’s right child too. The reason is the current node becomes the parent node in the next iteration.
 */
class Solution {
    func upsideDownBinaryTree(_ root: TreeNode?) -> TreeNode? {
        var p = root
        var parent: TreeNode?
        var parentRight: TreeNode?
        while p != nil {
            let left = p!.left
            p!.left = parentRight
            parentRight = p!.right
            p!.right = parent
            parent = p
            p = left
        }
        return parent
    }
}

/**
 Bottom up approach:
 If we reassign the bottom-level nodes before the upper ones, we won’t have to make copies and worry about overwriting something. We know the new root will be the left-most leaf node, so we begin the reassignment here.
 */
class Solution2 {
    func upsideDownBinaryTree(_ root: TreeNode?) -> TreeNode? {
        return bottomUp(root, nil)
    }
    
    private func bottomUp(_ p: TreeNode?, _ parent: TreeNode?) -> TreeNode? {
        if p == nil {
            return parent
        }
        let root = bottomUp(p!.left, p)
        p!.left = (parent == nil) ? parent : parent!.right
        p!.right = parent
        return root
    }
}