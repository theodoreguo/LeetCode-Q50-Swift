/**
 Question:
 Given two strings S and T, determine if they are both one edit distance apart. 
 
 Hint:
 1. If | n – m | is greater than 1, we know immediately both are not one-edit distance apart.
 2. It might help if you consider these cases separately, m == n and m ≠ n.
 3. Assume that m is always ≤ n, which greatly simplifies the conditional statements.
 If m > n, we could just simply swap S and T.
 4. If m == n, it becomes finding if there is exactly one modified operation. If m ≠ n, you do not have to consider the delete operation. Just consider the insert operation in T.
 */

import Foundation

class Solution {
    func isOneEditDistance(_ s: String, _ t: String) -> Bool {
        let sChars = [Character](s.characters)
        let tChars = [Character](t.characters)
        let m = sChars.count, n = tChars.count
        if m > n {
            return isOneEditDistance(t, s)
        }
        if n - m > 1 {
            return false
        }
        var i = 0, shift = n - m
        while i < m && sChars[i] == tChars[i] {
            i += 1
        }
        // Append operation
        if i == m {
            return shift > 0
        }
        // Modify operation
        if shift == 0 {
            i += 1
        }
        // Insert operation
        while i < m && sChars[i] == tChars[i + shift] {
            i += 1
        }
        return i == m
    }
}

let obj = Solution()
let s1 = "abacdfdcab"
let s2 = "abacdgfdcab"
obj.isOneEditDistance(s1, s2)
