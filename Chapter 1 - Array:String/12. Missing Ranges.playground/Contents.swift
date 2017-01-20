/**
 Question:
 Given a sorted integer array where the range of elements are [0, 99] inclusive, return its missing ranges.
 For example, given [0, 1, 3, 50, 75], return [“2”, “4->49”, “51->74”, “76->99”]
 
 Example Questions Candidate Might Ask:
 Q: What if the given array is empty?
 A: Then you should return [“0->99”] as those ranges are missing.
 Q: What if the given array contains all elements from the ranges? A: Return an empty list, which means no range is missing.
 */

import Foundation

class Solution {
    func findMissingRanges(_ vals: [Int], _ start: Int, _ end: Int) -> Array<String> {
        var ranges = [String]()
        var prev = start - 1
        for i in 0...vals.count {
            let curr = i == vals.count ? end + 1 : vals[i]
            if curr - prev >= 2 {
                ranges.append(getRange(prev + 1, curr - 1))
            }
            prev = curr
        }
        return ranges
    }
    
    private func getRange(_ from: Int, _ to: Int) -> String {
        return from == to ? String(from) : String(from) + "->" + String(to)
    }
}

let obj = Solution()
let a1 = [0, 1, 3, 50, 75]
let a2 = [Int]()
var a3 = [Int]()
for i in 0...99 {
    a3.append(i)
}
obj.findMissingRanges(a1, 0, 99)
obj.findMissingRanges(a2, 0, 99)
obj.findMissingRanges(a3, 0, 99)
