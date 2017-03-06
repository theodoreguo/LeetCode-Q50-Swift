/**
 Question:
 Design and implement a TwoSum class. It should support the following operations: add and find.
 add(input) – Add the number input to an internal data structure.
 find(value) – Find if there exists any pair of numbers which sum is equal to the value.
 For example,
 add(1); add(3); add(5); find(4)->true; find(7)->false
 */

import Foundation

class TwoSum {
    var dict = [Int: Int]()
    
    func add(_ input: Int) {
        var length: Int = 0
        length = dict[input] != nil ? dict[input]! : 0
        dict[input] = length + 1
    }

    func find(_ value: Int) -> Bool {
        // Get array of keys
        let keys = Array(dict.keys)
        for i in keys {
            let target = value - i
            if i == target {
                // For duplicates, ensure there are at least two individual numbers
                if dict[i]! >= 2 {
                    return true
                }
            } else if dict[target] != nil {
                return true
            }
        }
        return false
    }
}

let obj: TwoSum = TwoSum()
for i in 0...5 {
    obj.add(i)
}
obj.add(4)
obj.add(7)
obj.dict
var res: Bool = obj.find(8)
