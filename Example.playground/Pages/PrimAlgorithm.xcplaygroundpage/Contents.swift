//MARK: 프림 알고리즘
// 1. 먼저 사이클인지 파악
// 2. 사이클이 아니라면 노드를 연결
// 2-1. 두 노드의 부모 찾기
// 2-2. 사이클이 아닌지 확인
// 2-3. 합치기

func solution(_ n: Int,_ costs: [[Int]]) -> Int {
    var mst: [[Int]] = []
    
    var costs = costs.sorted { $0[2] < $1[2] }
    var connectedNode = [1]
    var result = 0
    
    while mst.count < (n - 1) {
        
    }
    
    
    
    return result
}
