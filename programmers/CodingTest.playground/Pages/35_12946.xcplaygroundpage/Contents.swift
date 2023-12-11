import Foundation

var stack:[[Int]] = []

func solution(_ n:Int) -> [[Int]] {
    re(n, 1, 2, 3)
    return stack
}

func re(_ n: Int,_ from: Int,_ tmp: Int,_ to: Int) {
    if n == 1 {
        // print("n:\(n) from: \(from) to: \(to)")
        stack.append([from, to])
        return
    }
    else {
        // 맨 마지막 판을 제외한 나머지를 1->2로 옮기기
        re(n-1, from, to, tmp)
        
        // 맨 마지막 판을 3번째에 옮김
        // print("n:\(n) from: \(from) to: \(to)")
        stack.append([from, to])
        
        // 마지막 판 제외한 나머지 판들을 다시 돌리기
        re(n-1, tmp, from, to)
    }
}

solution(2)

/*
123 0 0

23  0  1
3   2  1
3   12 0
0   12 3
1    2 3


1234    0     0
234     0     1
34      2     0
4       12    3
4       123   0
0       123   4
*/
