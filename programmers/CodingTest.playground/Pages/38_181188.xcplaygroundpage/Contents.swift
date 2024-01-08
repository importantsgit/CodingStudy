import Foundation

func solution(_ targets:[[Int]]) -> Int {
    
    if targets.count == 1 { return 1 }
    
    var targets = targets.sorted {
        ($0[0], $0[1]) < ($1[0], $1[1])
    }
    
    var start = 0, end = targets[0][1], count = 1
    
    targets.forEach { target in
        
        if target[0] >= end {
            start = target[0]
            end = target[1]
            count += 1
        }
        else {
            
            if target[0] > start {
                start = target[0]
            }
            
            if target[1] < end {
                end = target[1]
            }
        }
    }
    
    return count
}

let target = [[4,5],[4,8],[10,14],[11,13],[5,12],[3,7],[1,4]]
solution(target)
