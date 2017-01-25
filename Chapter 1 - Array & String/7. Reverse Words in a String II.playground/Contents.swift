/**
 Question:
 Similar to Question [6. Reverse Words in a String], but with the following constraints:
 “The input string does not contain leading or trailing spaces and the words are always separated by a single space.”
 Could you do it in-place without allocating extra space?
 */

import Foundation

class Solution {
    func reverseWordsInAString(_ s: String) -> String {
        var chars = Array(s.characters)
        let len = chars.count
        reverse(&chars, 0, len)
        var i = 0
        for var j in 0...len {
            if j == len || chars[j] == " " {
                reverse(&chars, i, j)
                i = j + 1
            }
            j += 1
        }
        return String(chars)
    }
    
    private func reverse(_ chars: inout [Character], _ start: Int, _ end: Int) {
        for i in 0..<(end - start) / 2 {
            let temp = chars[start + i]
            chars[start + i] = chars[end - i - 1]
            chars[end - i - 1] = temp
        }
    }
}

let obj = Solution()
let s = "the sky is blue"
obj.reverseWordsInAString(s)
