///  DFS Depth First Search
///  깊이 우선 탐색
///  탐색하려는 노드 자식부터 탐색

func DFS(_ links: [[String]]) {
    var graph: [String: [String]] = [:]
    var visitedNodes: [String] = []
    var visitingStack: [String] = ["A"]
    
    for link in links {
        graph[link[0], default: []].append(link[1])
        graph[link[1], default: []].append(link[0])
    }
    
    while let node = visitingStack.popLast() {
        if visitedNodes.contains(node) { continue }
        visitedNodes.append(node)
        print(node)
        let visitingNodes = graph[node, default: []]
        
        visitingStack += visitingNodes
    }
}


DFS([["A", "C"], ["A", "D"], ["C", "D"], ["E", "D"]])
