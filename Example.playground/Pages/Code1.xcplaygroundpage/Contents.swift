import Foundation

var n = 4
var cache = [[Int]](repeating: [Int](repeating: -1, count: 3), count: n)

var escalatorMap = [
    ["0", "1", "0"],
    ["0", "1", "0"],
    ["1", "0", "0"],
    ["0", "1", "0"]
]

func findMinimumMoves(line: Int, currentPosition: Int, moveCount: Int) -> Int {
    if line == n - 1 { return moveCount } // 기저사례

    var minMoves = 100000
    // 다음 줄의 칸 검색
    for movePosition in 0...2 {
        // 캐시에 값이 저장되어 있지 않으면 escalatorMap == "0" 경우 체크
       if escalatorMap[line + 1][movePosition] == "0" {
           if cache[line + 1][movePosition] != -1 {
               minMoves = min(minMoves, cache[line + 1][movePosition])
           }
           else {
               var findMoveCount = findMinimumMoves(
                   line: line + 1,
                   currentPosition: movePosition,
                   moveCount: moveCount + abs(movePosition - currentPosition)
               )
               minMoves = min(minMoves, findMoveCount)
               
           }

        }
    }
    
    cache[line][currentPosition] = minMoves

    return minMoves
}


print(findMinimumMoves(line: 0, currentPosition: 1, moveCount: 0))
printArray(arr: cache)




//func findMinimumMoves2() -> Int {
//    var DP = [Int](repeating: 0, count: 3)
//    DP = [1,0,1]
//
//    for line in escalatorMap {
//        var remainDP = DP
//
//        for (movePosition, canMove) in line.enumerated() {
//            if canMove == "0" {
//                DP[movePosition] = min(
//                    remainDP[0] + abs(movePosition - 0),
//                    remainDP[1] + abs(movePosition - 1),
//                    remainDP[2] + abs(movePosition - 2)
//                )
//            }
//            else {
//                // 최솟값 계산 중 막힌 칸을 필터링 하기 위해
//                DP[movePosition] = 100000
//            }
//        }
//        print(DP)
//    }
//
//    return DP.min() ?? 0
//}
//
//findMinimumMoves2()


// 출력하는 함수
func printArray(arr: [[Int]]) {
    var grid: [String] = []
    for i in 0..<arr.count {
        var row = ""
        for j in 0..<arr.first!.count {
            let value = arr[i][j]
            if value != 1000000 {
                row += "\(value) \t"
            } else {
                row += "INF\t"
            }
        }
        grid.append(row)
    }

    let edgesDescription = grid.joined(separator: "\n\n")
    print(edgesDescription)
}
