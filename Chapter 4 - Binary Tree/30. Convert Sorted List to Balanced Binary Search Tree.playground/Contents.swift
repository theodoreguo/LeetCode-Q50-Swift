/**
 Question:
 Given a singly linked list where elements are sorted in ascending order, convert it to a height balanced BST.
 
 Hint:
 Things get a little more complicated when you have a singly linked list instead of an array. Please note that in linked list, you no longer have random access to an element in O(1) time.
 How about inserting nodes following the list’s order? If we can achieve this, we no longer need to find the middle element, as we are able to traverse the list while inserting nodes to the tree.
 
 Link: https://oj.leetcode.com/problems/convert-sorted-list-to-binary-search-tree/
 */

import Foundation

/**
 Definition for singly-linked list
 */
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}

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

class Solution {
    func sortedListToBST(_ head: ListNode?) -> TreeNode? {
        
    }
}