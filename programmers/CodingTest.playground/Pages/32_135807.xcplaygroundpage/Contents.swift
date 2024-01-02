import Foundation

func solution(_ r1:Int, _ r2:Int) -> Int64 {
    var r1Count = Int64(pow(Double((2 * r1) - 1), 2)) + 4
    var r2Count = Int64(pow(Double((2 * r2) - 1), 2)) + 4
    
    return r2Count - r1Count + 4
}

solution(2, 3)
