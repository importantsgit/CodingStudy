import Foundation

var n = 3
var cache = [[Int]](repeating: [Int](repeating: -1, count: 3), count: n)

var escalatorMap = [
    ["0", "0", "0"],
    ["0", "1", "0"],
    ["1", "0", "1"]
]

func findMinimumMoves(line: Int, currentPosition: Int, moveCount: Int) -> Int {
    if line == n - 1 { return moveCount } // 기저조건
    
    var minMoves = 100000
    print(line, currentPosition, moveCount)
    // 다음 줄의 칸 검색
    for movePosition in 0...2 {
        // 캐시에 값이 저장되어 있으면 바로 불러오기
        if cache[line + 1][movePosition] != -1 {
            minMoves = min(cache[line + 1][movePosition], minMoves)
        }
        // 캐시에 값이 저장되어 있지 않으면 escalatorMap == "0" 경우 체크
       else if escalatorMap[line + 1][movePosition] == "0" {
            var findMoveCount = findMinimumMoves(
                line: line + 1,
                currentPosition: movePosition,
                moveCount: moveCount + abs(movePosition - currentPosition)
            )
            // 값 캐시에 저장
            cache[line + 1][movePosition] = findMoveCount
            // min 값 비교
            minMoves = min(minMoves, findMoveCount)
        }
    }
    
    return minMoves
}

print(findMinimumMoves(line: -1, currentPosition: 1, moveCount: 0))

func findMinimumMoves2() -> Int {
    var DP = [[Int]](repeating: [Int](repeating: 100000, count: 3), count: n + 1)
    DP[0] = [1,0,1]
    
    for (lineIndex, line) in escalatorMap.enumerated() {
        for (movePosition, canMove) in line.enumerated() {
            if canMove == "0" {
                DP[lineIndex+1][movePosition] = min(
                    DP[lineIndex][0] + abs(movePosition - 0),
                    DP[lineIndex][1] + abs(movePosition - 1),
                    DP[lineIndex][2] + abs(movePosition - 2)
                )
            }
        }
    }

    return DP.last?.min() ?? 0
}

findMinimumMoves2()
