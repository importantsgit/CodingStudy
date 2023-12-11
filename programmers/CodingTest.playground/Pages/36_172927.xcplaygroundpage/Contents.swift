import Foundation

func solution(_ picks:[Int], _ minerals:[String]) -> Int {
    var picks = picks
    var mineralsCount = picks.reduce(0, {$0 + $1}) * 5
    var minerals = mineralsCount < minerals.count ? Array(minerals[0..<mineralsCount]) : minerals
    var new: [[Int]] = []
    var cutIndex = 0
    var result = 0
    
    while let splitMinerals = minerals.getItems(start: cutIndex) {
        new.append(splitMinerals)
        cutIndex += 5
    }
    
    new.sort { lhs, rhs in
        lhs[3] > rhs[3]
    }
    
    
    for (idx, pick) in picks.enumerated() {
        if new.isEmpty {break}
        if pick == 0 { continue }
        var pick = pick, isFull = false
        
        if new.count < pick {
            isFull = true
        }
        
        switch idx {
        case 0:
            (isFull ? new : Array(new[0..<pick])).forEach { mineral in
                result += mineral[0] + mineral[1] + mineral[2]
            }
            
        case 1:
            (isFull ? new : Array(new[0..<pick])).forEach { mineral in
                result += mineral[0] * 5 + mineral[1] + mineral[2]
            }
            
        case 2:
            (isFull ? new : Array(new[0..<pick])).forEach { mineral in
                result += mineral[0] * 25 + mineral[1] * 5 + mineral[2]
            }
            
        default: ()
        }
        
        if isFull == true {
            break
        }
        
        new.removeFirst(pick)
    }
    
    return result
}

extension Array where Element == String {
    func getItems(start: Int) -> [Int]? {
        guard start < self.count else { return nil }
        var diaCount = 0, ironCount = 0, stoneCount = 0, maxCount = 0
        var split: [String] = []
        
        if self[start...].count < 5 {
            split = Array(self[start...])
        }
        else {
            split = Array(self[start..<(start+5)])
        }
        
        split.forEach {
            switch $0 {
            case "diamond":
                diaCount += 1
            case "iron":
                ironCount += 1
            case "stone":
                stoneCount += 1
            default :()
            }
        }
        maxCount = diaCount * 25 + ironCount * 5 + stoneCount
        
        return [diaCount, ironCount, stoneCount, maxCount]
    }
}






var arr1 = ["diamond", "diamond", "diamond", "iron", "iron", "diamond", "iron", "stone", "stone", "stone"]
var arr2 = ["diamond", "diamond", "diamond", "diamond", "diamond", "iron", "iron", "iron", "iron", "iron", "diamond"]

var arr3 = ["iron", "iron", "diamond", "iron", "stone", "diamond", "diamond", "diamond"]
//solution([1, 3, 2], arr1)


//solution([0, 1, 1], arr2)
solution([1, 1, 0], arr3)
