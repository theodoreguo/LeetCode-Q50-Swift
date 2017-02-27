/**
 Question:
 Implement strStr().
 Returns the index of the first occurrence of needle in haystack, or -1 if needle is not part of haystack.
 
 Link: https://oj.leetcode.com/problems/implement-strstr/
 */

import Foundation

class Solution {
    func strStr(_ haystack: String, _ needle: String) -> Int {
        let hChars = Array(haystack.characters)
        let nChars = Array(needle.characters)
        
        for i in 0...hChars.count {
            for j in 0...nChars.count {
                if j == nChars.count {
                    return i // Looping through needle done
                }
                if i + j == hChars.count {
                    return -1 // needle’s length is greater than haystack’s length or no match
                }
                if (nChars[j] != hChars[i + j]) {
                    break // Encounter non-matched character, break to next loop
                }
            }
        }
        return -1
    }
}

let obj = Solution()
let haystack = "mississippi"
let needle = "issi"
obj.strStr(haystack, needle)
