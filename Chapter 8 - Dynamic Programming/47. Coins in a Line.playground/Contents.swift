/**
 Question:
 There are n coins in a line. (Assume n is even). Two players take turns to take a coin from one of the ends of the line until there are no more coins left. The player with the larger amount of money wins.
 1. Would you rather go first or second? Does it matter?
 2. Assume that you go first, describe an algorithm to compute the maximum amount of money you can win.
 
 Hints:
 If you go first, is there a strategy you can follow which prevents you from losing? Try to consider how it matters when the number of coins is odd vs. even.
 */

import Foundation

class Solution {
    private let MAX_N = 100
    
    func printMoves(_ P: [[Int]], _ A: [Int], _ N: Int) {
        var P = P
        var m = 0, n = N - 1
        var myTurn = true
        while m <= n {
            let P1 = P[m + 1][n]
            let P2 = P[m][n - 1]
            let player = myTurn ? "I" : "You"
            print(player + " take coin No.", terminator: "")
            if (P1 <= P2) {
                let str1 = String(m + 1)
                let str2 = String(A[m])
                let str = str1 + "(" + str2 + ")."
                print(str)
                m += 1
            } else {
                let str1 = String(n + 1)
                let str2 = String(A[n])
                let str = str1 + "(" + str2 + ")"
                print(str)
                n -= 1
            }
            myTurn = !myTurn
        }
        let amount = String(P[0][N-1])
        print("The total amount of money (maximum) I get is " + amount + ".")
    }
    
    func maxMoney(_ A: [Int], _ N: Int) -> Int {
        var P = Array(repeating: Array(repeating: 0, count: MAX_N), count: MAX_N)
        var a: Int?, b: Int?, c: Int?
        for i in 0..<N {
            var m = 0, n = i
            while n < N {
                assert(m < N)
                assert(n < N)
                a = ((m + 2 <= N - 1) ? P[m + 2][n] : 0)
                b = ((m + 1 <= N - 1 && n - 1 >= 0) ? P[m + 1][n - 1] : 0)
                c = ((n - 2 >= 0) ? P[m][n - 2] : 0)
                P[m][n] = max(A[m] + min(a!, b!), A[n] + min(b!, c!))
                m += 1; n += 1
            }
        }
        printMoves(P, A, N)
        return P[0][N-1]
    }
}

let obj = Solution()
let a1 = [2, 1, 5, 2]
let n1 = 4
obj.maxMoney(a1, n1)
