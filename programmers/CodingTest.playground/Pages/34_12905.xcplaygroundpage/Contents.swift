import Foundation

var cache = [[Int]](repeating: [Int](repeating: -1, count: 5), count: 5)
var copyBoard: [[Int]] = []

func solution(_ board:[[Int]]) -> Int {
    var answer: Int = 0
    
    if board.count == 1 || board[0].count == 1 {
        if board.flatMap({ $0 }).filter({$0 == 1}).isEmpty == false { return 1 }
        else { return 0 }
    }
    copyBoard = board
    
    for y in copyBoard.indices {
        for x in copyBoard[0].indices {
            answer = max(answer, re(y: y, x: x))
        }
    }

    return answer * answer
}

func re(y: Int, x: Int) -> Int {
    if copyBoard.count <= y || copyBoard[0].count <= x {
        cache[y][x] = 0
        return cache[y][x]
    }
    if copyBoard[y][x] == 0 {
        cache[y][x] = 0
        return cache[y][x]
    }
    if cache[y][x] != -1 { return cache[y][x] }
    
    cache[y][x] = min(re(y: y, x: x+1), re(y: y+1, x: x), re(y: y+1, x: x+1)) + 1
    
    return cache[y][x]
}

func check(y: Int, x: Int) -> Bool {
    return copyBoard.count > y && copyBoard[0].count > x
}





func solution1(_ board:[[Int]]) -> Int {
    var dp = board
    
    if board.count == 1 || board[0].count == 1 {
        if board.flatMap({ $0 }).filter({$0 == 1}).isEmpty == false { return 1 }
        else { return 0 }
    }
    var maxNum = 0
    for y in 1..<dp.count {
        for x in 1..<dp[0].count {
            if dp[y][x] != 0 {
                dp[y][x] = min(dp[y-1][x],dp[y-1][x-1],dp[y][x-1]) + 1
                maxNum = max(maxNum, dp[y][x])
            }
            printArray(arr: dp)
        }
    }

    return maxNum * maxNum
}

var s1 = [[0,1,1,1],[1,1,1,1],[1,1,1,1],[0,0,1,0]]
var s2 = [[0,0,1,1],[1,1,1,1]]
solution(s1)
//solution(s2)
solution1(s1)
solution1(s2)


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
    print("\n")
}
