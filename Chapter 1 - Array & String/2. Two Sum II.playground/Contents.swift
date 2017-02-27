/**
 Question:
 Similar to Question [1. Two Sum], except that the input array is already sorted in ascending order.
 */

import Foundation

/**
 O(n log n) runtime, O(1) space – Binary search
 */
class Solution {
    private func binarySearch(_ a: [Int], _ key: Int, _ start: Int) -> Int {
        var l = start, r = a.count - 1
        while l <= r {
            let m = (l + r) / 2
            if a[m] < key {
                l = m + 1
            } else if a[m] > key {
                r = m - 1
            } else {
                return m
            }
        }
        return -1
    }
    
    func twoSum(_ numbers: [Int], _ target: Int) -> [Int] {
        for i in 0..<numbers.count {
            let j = binarySearch(numbers, target - numbers[i], i + 1)
            if (j != -1) {
                return  [i + 1, j + 1]
            }
        }
        return []
    }
}

/**
 O(n) runtime, O(1) space – Tow pointers
 Let’s assume we have two indices pointing to the ith and jth elements, Ai and Aj respectively. The sum of Ai and Aj could only fall into one of these three possibilities:
 i. Ai + Aj > target. Increasing i isn’t going to help us, as it makes the sum even bigger. Therefore we should decrement j.
 ii. Ai + Aj < target. Decreasing j isn’t going to help us, as it makes the sum even smaller. Therefore we should increment i.
 iii. Ai + Aj == target. We have found the answer.
 */
class Solution2 {
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
}

let obj = Solution()
let obj2 = Solution2()
let nums: [Int] = [3, 5, 7, 12, 23]
let target: Int = 28
obj.twoSum(nums, target)
obj2.twoSum(nums, target)
