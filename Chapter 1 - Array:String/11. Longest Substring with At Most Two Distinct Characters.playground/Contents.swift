/**
 Question:
 Given a string S, find the length of the longest substring T that contains at most two distinct characters.
 For example,
 Given S = “eceba”,
 T is "ece" which its length is 3.
 */

import Foundation

class Solution {
    func lengthOfLongestSubstringTwoDistinct(_ s: String) -> Int {
        guard !s.isEmpty else {
            return 0
        }
        let chars = [Character](s.characters)
        var i = 0, j = -1, maxLen = 0
        for k in 1..<chars.count {
            if chars[k] == chars[k - 1] {
                continue
            }
            if j >= 0 && chars[j] != chars[k] {
                maxLen = max(k - i, maxLen)
                i = j + 1
            }
            j = k - 1
        }
        return max(chars.count - i, maxLen)
    }

    func lengthOfLongestSubstringTwoDistinct2(_ s: String) -> Int {
        guard !s.isEmpty else {
            return 0
        }
        let chars = [Character](s.characters)
        var count = [Character: Int]()
        var i = 0, numDistinct = 0, maxLen = 0
        for j in 0..<chars.count {
            guard count[chars[j]] != nil else {
                count[chars[j]] = 0
                numDistinct += 1
                continue
            }
            count[chars[j]]! += 1
            while (numDistinct > 2) {
                count[chars[i]]! -= 1
                if (count[chars[i]] == 0) {
                    numDistinct -= 1
                }
                i += 1
            }
            maxLen = max(j - i + 1, maxLen);
        }
        return maxLen
    }
}

let obj = Solution()
let s1 = "eceba"
let s2 = "tmtmtuxt"
let s3 = "abaac"
obj.lengthOfLongestSubstringTwoDistinct(s1)
obj.lengthOfLongestSubstringTwoDistinct(s2)
obj.lengthOfLongestSubstringTwoDistinct(s3)
obj.lengthOfLongestSubstringTwoDistinct2(s1)
obj.lengthOfLongestSubstringTwoDistinct2(s2)
obj.lengthOfLongestSubstringTwoDistinct2(s3)
