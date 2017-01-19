/**
 Question:
 Implement atoi to convert a string to an integer.
 The atoi function first discards as many whitespace characters as necessary until the first non-whitespace character is found. Then, starting from this character, takes an optional initial plus or minus sign followed by as many numerical digits as possible, and interprets them as a numerical value.
 The string can contain additional characters after those that form the integral number, which are ignored and have no effect on the behavior of this function.
 If the first sequence of non-whitespace characters in str is not a valid integral number, or if no such sequence exists because either str is empty or it contains only whitespace characters, no conversion is performed.
 If no valid conversion could be performed, a zero value is returned. If the correct value is out of the range of representable values, the maximum integer value (2147483647) or the minimum integer value (–2147483648) is returned.
 
 Link: https://oj.leetcode.com/problems/string-to-integer-atoi/
 */

import Foundation

class Solution {
    func myAtoi(_ str: String) -> Int {
        var res = 0
        var flag = 1
        var index = 0
        let intMax = 2147483647
        let intMin = -2147483648
        
        // Trim
        let content = [Character](str.characters)
        while index < content.count {
            guard content[index] == " " else {
                break
            }
            index += 1
        }
        guard index < content.count else {
            return res
        }
        
        // Flag dispose
        if content[index] == "-" {
            flag = -1
            index += 1
        } else if content[index] == "+" {
            index += 1
        }
        
        while index < content.count {
            guard isDigit(content[index]) else {
                break
            }
            
            res = res * 10 + Int(String(content[index]))!
            
            if res >= intMax {
                if flag == 1 {
                    return intMax
                } else if res > intMax && flag == -1 {
                    return intMin
                }
            }
            
            index += 1
        }
        
        return flag * res
    }
    
    private func isDigit(_ char: Character) -> Bool {
        return char >= "0" && char <= "9"
    }
}

//let obj = Solution()
//let s1 = "A man, a plan, a canal: Panama"
//let s2 = "race a car"
//let s3 = ""
//obj.isPalindrome(s1)
//obj.isPalindrome(s2)
//obj.isPalindrome(s3)
