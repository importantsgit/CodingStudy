import Foundation

//let n = Int(readLine()!)!
//var arr: [[String]] = []
//for _ in 0..<n {
//    arr.append(readLine()!.split(separator: " ").map{ String($0) })
//}
var n = 3
var cache = [[Int]](repeating: [Int](repeating: -1, count: 3), count: n+1)
var arr =
[["0", "0", "0"],
["0", "1", "0"],
["1", "0", "1"]]

print(findMinimumMoves(line: -1, currentPosition: 1, moveCount: 0))

func findMinimumMoves(line: Int, currentPosition: Int, moveCount: Int) -> Int {
    if line == n - 1{ return moveCount }
    var minMoves = 10000
    
    for i in 0...2 {
        if cache[line+1][i] != -1 {
            minMoves = min(cache[line+1][i], minMoves)
        }

        if arr[line+1][i] == "0" {
            cache[line+1][i] = findMinimumMoves(line: line+1, currentPosition: i, moveCount: moveCount + abs(i - currentPosition))
            minMoves = min(minMoves, cache[line+1][i])
        }
    }
    
    return minMoves
}

