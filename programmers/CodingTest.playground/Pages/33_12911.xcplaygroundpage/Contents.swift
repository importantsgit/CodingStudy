import Foundation

func solution(_ n:Int) -> Int{
    var answer: Int = 0
    
    answer = n
    while true {
        answer += 1
        let radix = String(answer, radix: 2).filter{ $0 == "1" }.count
        let compare = String(n, radix: 2).filter{ $0 == "1" }.count
        if radix == compare {break}
    }
    
    return answer
}

print(solution(78))
