import Foundation

func solution(_ r1:Int, _ r2:Int) -> Int64 {
    
    let r1Area = r1*r1, r2Area = r2*r2
    var result: Int64 = 0
    
    for x in 1...r2 {
        // y의 제곱
        let r1YSqrt = r1Area - x*x
        let r2YSqrt = r2Area - x*x
        
        // Y의 범위
        let maxY = Int64(floor(sqrt(Double(r2YSqrt))))
        let minY = r1YSqrt < 0 ? 0 : Int64(ceil(sqrt(Double(r1YSqrt))))
        // y가 음수라면 sqrt에서 nan을 반환 -> 음수일때 0으로 반환
        
        result += maxY - minY + 1
    }
    
    return result * 4
}

solution(2, 3)
