/**
 Question:
 Given a string, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases.
 For example,
 "A man, a plan, a canal: Panama" is a palindrome. "race a car" is not a palindrome.
 Example Questions Candidate Might Ask:
 Q: What about an empty string? Is it a valid palindrome?
 A: For the purpose of this problem, we define empty string as valid palindrome.
 */

import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    // Reduce the runtime complexity of searching a value using a dictionary that maps a value to its index
    var res = [Int]()
    var dict = [Int: Int]()
    for i in 0..<nums.count {
        let x = nums[i]
        if dict[target - x]  != nil { // The number matching the difference value has been saved in the dictionary already
            res = [dict[target - x]! + 1, i + 1]
        }
        dict[x] = i // dict.updateValue(i, forKey:x), [key, value] -> [x, i]
    }
    return res
}

let nums: [Int] = [13, 3, 5, 7, 18]
let target: Int = 8
print(twoSum(nums, target))
