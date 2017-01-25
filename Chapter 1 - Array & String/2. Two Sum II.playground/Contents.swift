/**
 Question:
 Similar to Question [1. Two Sum], except that the input array is already sorted in ascending order.
 */

import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var i = 0
    var j = nums.count - 1
    while i < j {
        let sum = nums[i] + nums[j]
        if sum < target {
            i += 1
        } else if sum > target {
            j -= 1
        } else {
            return [i + 1, j + 1]
        }
    }
    return []
}

let nums: [Int] = [3, 5, 7, 12, 23]
let target: Int = 28
print(twoSum(nums, target))
