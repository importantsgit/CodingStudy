import Foundation
//
//func solution(_ board:[[Int]]) -> Int {
//
//    var board = board
//
//    for y in 0..<board.count {
//        for x in 0..<board[0].count {
//            if board[y][x] == 1 {
//                for iy in -1...1 {
//                    for ix in -1...1 {
//
//                        if 0 <= iy+y && board.count > iy+y && 0 <= ix+x && board[0].count > ix+x {
//                            if board[y+iy][x+ix] == 1 {continue}
//                            else {
//                                board[y+iy][x+ix] = 2
//                            }
//
//                        }
//                    }
//                }
//            }
//        }
//    }
//
//    return board.reduce(0, { $0 + $1.filter({ $0 == 0 }).count
//    })
//}
//
//solution([[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 1, 0, 0], [0, 0, 0, 0, 0]] )
////16
//solution([[0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 0, 0, 0], [0, 0, 1, 1, 0], [0, 0, 0, 0, 0]])
////13
//solution([[1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1], [1, 1, 1, 1, 1, 1]])
////0


//import Foundation
//
//func solution(_ d:[Int], _ budget:Int) -> Int {
//    let d = d.sorted(by: <)
//    var budget = budget
//    var index = 0
//
//    while budget > 0 {
//        if d.count <= index { break }
//        var b = d[index]
//        if budget < b {
//            break
//        }
//        budget -= b
//        index += 1
//    }
//
//
//    return index
//}

//solution([1,3,2,5,4], 9)
//solution([2,2,3,3], 10)

//func solution(_ s:String) -> String {
//    return String(s.sorted(by: >))
//}
//solution("Zbcdefg") // gfedcbZ

//import Foundation
//
//func solution(_ n:Int) -> Int {
//    var result = 0
//    if n <= 3 { return 0 }
//
//    for num in 4...n {
//        var check = 0
//        for i in 1...num {
//            if num.isMultiple(of: i) {
//                check += 1
//            }
//        }
//        if check >= 3 {
//            result += 1
//        }
//
//    }
//    return result
//}

//solution(10)
//solution(15)

import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    var dic = [
        "R": 0,
        "T": 0,
        "C": 0,
        "F": 0,
        "J": 0,
        "M": 0,
        "A": 0,
        "N": 0
    ]
    
    for (idx, sol) in survey.enumerated() {
        let survey = sol.map {String($0)}
        let left = survey[0],
            right = survey[1]
        let choice = choices[idx]
        let num =  abs(4 - choice)
        if choice < 4 {
            dic[left]! += num
        }
        else if choice > 4 {
            dic[right]! += num
        }
    }
    
    var string = ""
    
    for item in [["R","T"],["C","F"],["J","M"],["A","N"]] {
        if dic[item[0]]! >= dic[item[1]]! {
            string += item[0]
        }
        else {
            string += item[1]
        }
    }
    

    
    return string
}




//1=왼쪽3 2=왼쪽2 3=왼쪽1 4=0 5=오른쪽1 6=오른쪽2 7=오른쪽3
solution(["AN", "CF", "MJ", "RT", "NA"], [5,3,2,7,5])
//solution(["TR", "RT", "TR"], [7, 1, 3])

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

