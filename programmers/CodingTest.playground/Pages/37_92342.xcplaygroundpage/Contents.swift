import Foundation

var maxInfo: [Int] = []
var maxScore: Int = 0


func solution(_ n:Int, _ info:[Int]) -> [Int] {
    maxInfo = []
    maxScore = 0
    exhaustiveSearch(n, 0, info, [Int](repeating: 0, count: 11))
    return maxScore != 0 ? maxInfo : [-1]
}

func exhaustiveSearch(_ n: Int,_ index: Int,_ info: [Int],_ rionInfo: [Int]) {
    var arrowR = n, rionInfo = rionInfo, info = info
    
    if arrowR == 0 {
        compareScore(rionInfo: rionInfo, apeechInfo: info)
    }
    
    if index == 10 {
        // 어피치가 얻은 점수와 라이온이 얻은 점수 비교
        rionInfo[index] = arrowR
        
        compareScore(rionInfo: rionInfo, apeechInfo: info)
        return
    }
    
    let arrowA = info[index]

    // 라이온이 안쏜 경우
    exhaustiveSearch(arrowR, index+1, info, rionInfo)
    
    // 라이온의 남은 화살이 어피치의 현재 점수에 박힌 화살보다 클 경우
    if arrowR > arrowA {
        info[index] = 0
        rionInfo[index] = arrowA + 1
        exhaustiveSearch(arrowR - (arrowA + 1), index+1, info, rionInfo)
    }
}

func compareScore(rionInfo: [Int], apeechInfo: [Int]) {
    var rionScore = 0, apeechScore = 0
    
    for i in 0...10 {
        rionScore += (rionInfo[i] > 0 ? 1 : 0) * abs(10 - i)
        apeechScore += (apeechInfo[i] > 0 ? 1 : 0) * abs(10 - i)
    }
    
    let result = rionScore - apeechScore
    
    if result <= 0 || maxScore > result { return }
    print("rionInfo:   \(rionInfo), \(rionScore)")
    print("apeechInfo: \(apeechInfo), \(apeechScore)")
    print("maxScore:   \(result)\n")
    // maxScore와 같거나 큰 경우만 로직 타게
    
    if maxScore < result {
        maxScore = result
        maxInfo = rionInfo
        return
    }

    for i in (0...10).reversed() {
        if rionInfo[i] == maxInfo[i] {
            continue
        }
        else if rionInfo[i] > maxInfo[i] {
            maxScore = result
            maxInfo = rionInfo
            return
        }
        break
    }

}

//solution(5, [2,1,1,1,0,0,0,0,0,0,0])
//solution(1, [1,0,0,0,0,0,0,0,0,0,0])
//solution(2, [1,1,0,0,0,0,0,0,0,0,0])
solution(3, [0,0,1,1,0,1,0,0,0,0,0])
/*
 1. 어피치 n발 -> 라이언 n발
 2. 과녁 점수는 10~0
 3. k점에 어a발 라b발
 4-1. if a>b라면 k점 어피치에게
 4-2. else if a<b라면 k점 라이언에게
 4-3. else if a==b라면
    5-1 if a==b==0 어피치가
    5-2 else if  a==b 아무도 못가져감
 6. 라이언이 이길 수 있는 방법 ( 큰 차이 점수로 가장 낮은 점수 맞춘 방법을 리턴)
 //[2,1,1,1,0,0,0,0,0,0,0] => 11
 10~0
 */




//solution(1, [1,0,0,0,0,0,0,0,0,0,0])
//solution(9, [0,0,1,2,0,1,1,1,1,1,1])
//solution(10, [0,0,0,0,0,0,0,0,3,4,3])

// 1조건 k점수를 따려면 어피치 맞춘 갯수보다 많아야 함

