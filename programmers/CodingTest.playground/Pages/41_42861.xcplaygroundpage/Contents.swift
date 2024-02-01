
import Foundation

func solution(_ n:Int, _ costs:[[Int]]) -> Int {
    var costs = costs.sorted(by: {$0[2] < $1[2]})
    var mst: [[Int]] = []
    
    var parent: [Int: Int] = [:]
    var rank: [Int: Int] = [:]
    
    for index in 0..<n {
        parent.updateValue(index, forKey: index)
        rank.updateValue(0, forKey: index)
    }
    
    
    // if AC 간선에서 A, C의 Root Node의 값을 찾아냄
    func find(_ node: Int) -> Int {
        if node != parent[node]! {
            parent[node] = find(parent[node]!)
        }
        return parent[node]!
    }
    
    // if 만약 find에서 찾아낸 A, C의 Root Node 값이 다를 경우 둘을 합치는 다음 작업을 함
    func union(_ nodeV: Int, _ nodeU: Int) {
        let rankV = find(nodeV)
        let rankU = find(nodeU)
        
        if rankV > rankU {
            parent[rankU] = rankV
        }
        else {
            parent[nodeV] = nodeU
            if rankV == rankV {
                rank[rankU]! += 1
            }
        }
    }
    
    while mst.count < n-1 {
        print("costs: \(costs)")
        let node = costs.removeFirst()
        // if 01 간선에서 0, 1의 Root Node의 값을 찾아냄
        let nodeV = min(node[0], node[1])
        let nodeU = max(node[0], node[1])
        if find(nodeV) != find(nodeU) {
            // if 만약 find에서 찾아낸 0, 1의 Root Node 값이 다를 경우 둘을 합치는 다음 작업을 함
            union(nodeV, nodeU)
            mst.append(node)
        }
        else {
            // 만약 parent 값이 같을 경우 사이클임
            // 0->2 (parent: 0)  / 0->1->3 (parent: 0)
            // 이 경우 그냥 넘어감
            
        }
        print("mst. : \(mst)")
    }
    return mst.reduce(0, {$0 + $1[2]})
}



solution(4, [[0,1,1],[0,2,2],[1,2,5],[1,3,1],[2,3,8]])//,[4,5,1]])




func solution2(_ n:Int, _ costs:[[Int]]) -> Int {

    return 0
}


solution(4, [[0,1,1],[0,2,2],[1,2,5],[1,3,1],[2,3,8]])
