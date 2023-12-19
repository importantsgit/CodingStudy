
import Foundation

func solution(_ rows:Int, _ columns:Int, _ queries:[[Int]]) -> [Int] {
    
    var arr: [[Int?]] = []
    var result = [Int](repeating: 10000, count: queries.count)
    var num = 1
    arr.append([Int](repeating: 0, count: columns+1))
    for _ in 1...rows {
        arr.append([0]+Array(num..<(num+columns)))
        num = num+columns
    }
    
    if queries.count == 1 && (queries[0][0] == 1 && queries[0][1] == 1) && (queries[0][0] == rows && queries[0][1] == columns) {
        return [ arr[queries[0][0]][queries[0][1]]! ]
    }
    
    for (idx,query) in queries.enumerated() {
        var changeNum = arr[query[0]][query[1]]
        result[idx] = min(result[idx], changeNum!)
        
        for i in query[0]+1...query[2] {
            arr[i-1][query[1]] = arr[i][query[1]]
            result[idx] = min(result[idx], arr[i][query[1]]!)
        }

        for i in query[1]+1...query[3] {
            arr[query[2]][i-1] = arr[query[2]][i]
            result[idx] = min(result[idx], arr[query[2]][i]!)
        }

        for i in (query[0]+1...query[2]).reversed() {
            arr[i][query[3]] = arr[i-1][query[3]]
            result[idx] = min(result[idx], arr[i-1][query[3]]!)
        }
        
        for i in (query[1]+1...query[3]).reversed() {
            arr[query[0]][i] = arr[query[0]][i-1]
            result[idx] = min(result[idx], arr[query[0]][i-1]!)
        }
        arr[query[0]][query[1]+1] = changeNum
    }

    return result
}

//solution(6, 6, [[2,2,5,5],[3,3,6,6],[5,1,6,3]]) // [8, 10, 25]
//solution(3, 3, [[1,1,2,2],[1,2,2,3],[2,1,3,2],[2,2,3,3]]) // [1, 1, 5, 3]
//solution(100, 97, [[1,1,100,97]]) // [1]
//solution(100, 100, [[1,1,2,2]]) // [1]
//solution(2,3, [[1,1,1,3]])


// 출력하는 함수
func printArray(arr: [[Int?]]) {
    var grid: [String] = []
    for i in 0..<arr.count {
        var row = ""
        for j in 0..<arr.first!.count {
            let value = arr[i][j]
            if value != 1000000 {
                row += "\(value ?? -1) \t"
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


let num = 1

switch num {
case 1:
    print("1")
case 1...3:
    print("2")
case 1...5:
    print("3")
default:
    print("4")
}
