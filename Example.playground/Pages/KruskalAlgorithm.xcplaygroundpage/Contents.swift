//MARK: 크러스컬 알고리즘
// 1. 먼저 사이클인지 파악
// 2. 사이클이 아니라면 노드를 연결
// 2-1. 두 노드의 부모 찾기
// 2-2. 사이클이 아닌지 확인
// 2-3. 합치기


func solution(_ n: Int,_ costs: [[Int]]) -> Int {
    var mst: [[Int]] = []
    
    var costs = costs.sorted { $0[2] < $1[2] }
    var parents = [Int](0..<n)
    var result = 0
    
    // 노드의 root 부모 찾기
    func getNodeParent(_ node: Int) -> Int {
        if node != parents[node] {
            // 노드의 부모 업데이트 (노드가 합쳐지면서 root 노드가 바뀔 수 있음)
            parents[node] = getNodeParent(parents[node])
        }
        
        return parents[node]
    }
    
    // 노드 합치기
    func union(_ leftNode: Int,_ rightNode: Int) {
        let leftNodeParent = getNodeParent(leftNode)
        let rightNodeParent = getNodeParent(rightNode)
        
        if leftNodeParent > rightNodeParent {
            parents[leftNodeParent] = rightNodeParent
        }
        else {
            parents[rightNodeParent] = leftNodeParent
        }
    }
    
    // 신장트리에는 정확히 n-1개의 간선이 있음
    while mst.count < (n - 1) {
        for cost in costs {
            
            let leftNode = getNodeParent(cost[0])
            let rightNode = getNodeParent(cost[1])
            
            // 부모가 같지 않다면 == 사이클이 아니라면
            if leftNode != rightNode {
                union(leftNode, rightNode)
                mst.append(cost)
            }
        }
    }
    
    return mst.reduce(0, { $0 + $1[2] })
}

solution(4, [[0,1,1],[0,2,2],[1,2,5],[1,3,1],[2,3,8]])
