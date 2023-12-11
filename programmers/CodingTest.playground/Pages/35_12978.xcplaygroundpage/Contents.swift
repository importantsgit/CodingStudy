import Foundation

//
func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    
    var queue = Queue()
    var distance = [Int](repeating: 500001, count: N+1)
    distance[1] = 0
    
    var graph:[[Int]] = [[Int]](repeating: [Int](repeating: 500001, count: N+1), count: N+1)
    
    for road in road {
        graph[road[0]][road[1]] = min(road[2], graph[road[0]][road[1]])
        graph[road[1]][road[0]] = min(road[2], graph[road[0]][road[1]])
    }
    
    queue.enqueue([1, 0])
    
    while let current = queue.dequeue() {
        for (idx, time) in graph[current[0]].enumerated() {
            if time != 500001 && distance[idx] > current[1] + time {
                distance[idx] = current[1] + time
                queue.enqueue([idx, distance[idx]])
            }
        }
    }
    return distance.filter { $0 <= k }.count

}


class Queue {
    var queue: [[Int]] = []
    var index = 0
    
    func enqueue(_ item: [Int]) {
        queue.append(item)
        //  O(N) 최악의 상황 -> 메모리 재할당
        
    }
    
    func dequeue() -> [Int]? {
        guard queue.isEmpty == false && index < queue.count else { return nil }
        let item = queue[index]
        queue[index] = []
        index += 1
        
        if index > 2 {
            queue.removeFirst(3)
            //O(N)
            index = 0
        }
        
        return item
    }

}

solution(5, [[1,2,1],[2,3,3],[5,2,2],[1,4,2],[5,3,1],[5,4,2]], 3)


func solution1(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    
    var queue:PriorityQueue<NodePriority> = PriorityQueue(sort: <, [NodePriority(node: 1, priority: 0)])
    var distance = [Int](repeating: 500001, count: N+1)
    distance[1] = 0
    var graph:[[Int]] = [[Int]](repeating: [Int](repeating: 500001, count: N+1), count: N+1)
    
    for road in road {
        graph[road[0]][road[1]] = min(road[2], graph[road[0]][road[1]])
        graph[road[1]][road[0]] = min(road[2], graph[road[0]][road[1]])
    }
    while let current = queue.dequeue() {
        for (idx, time) in graph[current.node].enumerated() {
            if time != 500001 && distance[idx] > current.priority + time {
                distance[idx] = current.priority + time
                queue.enqueue(NodePriority(node: idx, priority: distance[idx]))
            }
        }
    }
    return distance.filter { $0 <= k }.count

}

solution1(5, [[1,2,1],[2,3,3],[5,2,2],[1,4,2],[5,3,1],[5,4,2]], 3)


struct NodePriority: Comparable {
    static func < (lhs: NodePriority, rhs: NodePriority) -> Bool {
        lhs.priority > rhs.priority
    }
    var node: Int = 0
    var priority: Int = 0
}

/**
 PriorityQueue
 
 - Parameters:
 - heap : Heap 정렬구조
 
 - Important: sort < : 오름차순
 */
struct PriorityQueue<T: Comparable> {
    var heap: Heap<T>
    
    init(sort: @escaping (T, T) -> Bool, _ elements: [T] = []) {
        heap = Heap(elements: elements, sortFunction: sort)
    }
    
    var count: Int {
        return heap.count
    }
    
    var isEmpty: Bool {
        return heap.isEmpty
    }
    
    func getTopElement() -> T? {
        return heap.peek
    }
    
    mutating func dequeue() -> T? {
        return heap.pop()
    }
    
    mutating func enqueue(_ element: T) {
        return heap.insert(node: element)
    }
}


struct Heap<T: Comparable> {
    var elements: [T] = []
    private let sorFunction: (T, T) -> Bool
    
    var isEmpty: Bool {
        self.elements.count == 1
    }
    
    var peek: T? {
        if self.isEmpty { return nil }
        return self.elements[1]
    }
    
    var count: Int {
        self.elements.count - 1
    }
    
    init(elements: [T] = [], sortFunction: @escaping (T, T) -> Bool) {
        if elements.isEmpty == false {
            self.elements = [elements[0]] + elements
        }
        else {
            self.elements = elements
        }
        
        self.sorFunction = sortFunction
        
        if elements.count > 1 {
            self.buildHeap()
        }
    }
    
    func leftChild(of index: Int) -> Int {
        index * 2
    }
    
    func rightChild(of index: Int) -> Int {
        index * 2 + 1
    }
    
    func parent(of index: Int) -> Int {
        index / 2
    }
    
    mutating func buildHeap() {
        // self.elements.count / 2 맨 리프노드들의 부모들 부터
        for index in (1...(self.elements.count / 2)).reversed() {
            self.diveDown(from: index)
        }
    }
    
    mutating func insert(node: T) {
        guard self.isEmpty == false else {
            self.elements.append(node)
            return
        }
        
        // O(1)
        self.elements.append(node)
        
        // O(log N)
        self.swimUp(from: self.elements.endIndex - 1)
    }
    
    mutating func diveDown(from index: Int) {
        var higherPriority = index
        let leftIndex = self.leftChild(of: index)
        let rightIndex = self.rightChild(of: index)
        
        if leftIndex < self.elements.endIndex
            && self.sorFunction(self.elements[leftIndex], self.elements[higherPriority]) {
            higherPriority = leftIndex
        }
        
        if rightIndex < self.elements.endIndex &&
            self.sorFunction(self.elements[rightIndex], self.elements[higherPriority]) {
            higherPriority = rightIndex
        }
        
        if higherPriority != index {
            self.elements.swapAt(higherPriority, index)
            self.diveDown(from: higherPriority)
        }
    }

    mutating func swimUp(from index: Int) {
        var index = index
        
        // index가 최상단이 아님
        // 현재 element와 그 element의 parent를 비교한 결과가 true일 때
        // if sortFunction > 이면 최상단에 큰 값이 배치됨
        // 최악의 경우 끝에서 처음까지 거슬러 올라가기 때문에 O(log N)
        while index != 1 && self.sorFunction(self.elements[index], self.elements[self.parent(of: index)]) {
            self.elements.swapAt(index, self.parent(of: index))
            index = self.parent(of: index)
        }
    }
    
    mutating func pop() -> T? {
        if self.isEmpty { return nil }
        self.elements.swapAt(1, elements.endIndex - 1)
        let popElement = elements.popLast()
        self.diveDown(from: 1)
        
        return popElement
    }
    
    mutating func remove() {
        if self.isEmpty { return }
        self.elements.swapAt(1, elements.endIndex - 1)
        elements.removeLast()
        self.diveDown(from: 1)
    }
}
