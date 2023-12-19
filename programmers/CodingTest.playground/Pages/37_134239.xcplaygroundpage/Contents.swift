import Foundation

func solution(_ k:Int, _ ranges:[[Int]]) -> [Double] {
    let k = k
    let collatz = makeCollatz(k)
    var result: [Double] = []
    var cache: [[Double]] = [[Double]](repeating: [Double](repeating: -1.0, count: collatz.count), count: collatz.count)
    
    print(collatz)
    for range in ranges {
        var a = range[0],
            b = (collatz.count - 1) + range[1]
    
        if a >= collatz.count { a = collatz.count - 1 }
        if b >= collatz.count { b = collatz.count - 1 }

        if b == a {
            result.append(0)
            continue
        }
        else if b < a {
            result.append(-1.0)
            continue
        }
        
        
        var num = 0.0
        for i in (a+1)...b {
            let maxHeight = max(collatz[i], collatz[i-1])
            let minHeight = min(collatz[i], collatz[i-1])
            let height = maxHeight - minHeight
            num += minHeight + (height / 2.0)
        }
        result.append(num)
    }
    
    return result
}


func makeCollatz(_ k: Int) -> [Double] {
    var k = k
    var collatz: [Double] = []
    
    collatz.append(Double(k))
    
    while k != 1 {
        k = k.isMultiple(of: 2) ? (k / 2) : (k * 3 + 1)
        collatz.append(Double(k))
    }
    
    return collatz
}
//solution(8989, [])
//solution(11, [])
//solution(10, [])
//solution(9, [])
//solution(8, [])
//solution(7, [[0,0],[0,-1],[2,-3],[3,-3]])
//solution(6, [[0,0],[0,-1],[2,-3],[3,-3]])
//solution(5, [[0,0],[0,-1],[2,-3],[3,-3]])
//solution(4, [[0,0], [1,-2], [3,-3]])
//solution(3, [[0,0], [1,-2], [3,-3]])
//solution(2, [[0,0],[0,-1],[2,-3],[3,-3]])
solution(5, [[0,0],[0,-1],[2,-3],[3,-3]]) // [33.0,31.5,0.0,-1.0]
solution(3, [[0,0], [1,-2], [3,-3]]) // [47.0,36.0,12.0]
