import Foundation

func solution() {
//    var lands: [Int] = []
//    let NMB = readLine()!.split(separator: " ").compactMap {Int($0)}
//
//    for _ in 0..<NMB[0] {
//        lands += readLine()!.split(separator: " ").compactMap {Int($0)}
//    }
    
    let NMB = [2,2,3]
    let lands = [0,0,3,3]
    
    var maxBlock = lands.max() ?? 256
    var minBlock = lands.min() ?? 0
    var minTime = Int.max
    var resultBlock = 0
    
    if minBlock == maxBlock {
        print(0, lands[0])
        return
    }
    
    for height in minBlock...maxBlock {
        var times = 0
        var inventory = NMB[2]
        
        for landBlock in lands {
            if landBlock > height {
                times += (landBlock - height) * 2
                inventory += (landBlock - height)

            }
            else if landBlock < height {
                times += (height - landBlock)
                inventory -= (height - landBlock)
            }
        }
        
        if inventory >= 0 && times <= minTime {
            minTime = times
            resultBlock = height
        }
    }
    print(minTime, resultBlock)
    return
}

solution()
