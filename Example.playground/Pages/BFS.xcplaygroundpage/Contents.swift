/// BFS: Breadth-First Search
/// 너비 우선 탐색
/// 같은 레벨의 노드들 다 탐색


func BFS(_ links: [[String]]) {
    var graph: [String : [String]] = [:]
    
    for link in links {
        graph[link[0], default: []].append(link[1])
        graph[link[1], default: []].append(link[0])
    }
    
    var visitedNodes: [String] = []
    var visitingQueue: Queue<String> = Queue()
    visitingQueue.enqueue(item: "A")
    
    while let node = visitingQueue.dequeue() {
        if visitedNodes.contains(node) { continue }
        print(node)
        visitedNodes.append(node)
        let visitingNodes = graph[node, default: []]
        
        for visitingNode in visitingNodes {
            visitingQueue.enqueue(item: visitingNode)
        }
    }
}


struct Queue<T> {
    var elements: [T?] = []
    var index = 0
    
    mutating func enqueue(item: T) {
        self.elements.append(item)
    }
    
    mutating func dequeue() -> T? {
        guard index < elements.count,
              let item = elements[index] else { return nil }
        
        index += 1
        
        if index > 2 {
            elements.removeFirst(3)
            index = 0
        }
        
        return item
    }
}

BFS([["A", "C"], ["A", "D"], ["E", "D"], ["C", "D"]])


