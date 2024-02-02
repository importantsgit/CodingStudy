import Foundation

func solution(_ N:Int, _ road:[[Int]], _ k:Int) -> Int {
    var map: [[Int]] = [[Int]](repeating: [Int](repeating: 500001, count: N+1), count: N+1)

    
    for r in road {
        map[r[0]][r[1]] = min(r[2], map[r[0]][r[1]])
        map[r[1]][r[0]] = min(r[2], map[r[0]][r[1]])
    }
    
    var distances = [Int](repeating: 500001, count: N+1)
    var visitingTown = Queue()
    visitingTown.enqueue(item: [1, 0])
    
    while let town = visitingTown.dequeue() {
        for (destination, time) in map[town[0]].enumerated() {
            if distances[destination] > time + town[1] && time != 500001 {
                distances[destination] = time + town[1]
                visitingTown.enqueue(item: [destination, time + town[1]])
            }
        }
    }
    
    print(distances)
    return 1
}

solution(5, [[1,2,1],[2,3,3],[5,2,2],[1,4,2],[5,3,1],[5,4,2]], 3)

solution(6, [[1,2,1],[1,3,2],[2,3,2],[3,4,3],[3,5,2],[3,5,3],[5,6,1]], 4)

struct Queue {
    private var elements: [[Int]?] = []
    private var index = 0
    
    mutating func enqueue(item: [Int]) {
        elements.append(item)
    }
    
    mutating func dequeue() -> [Int]? {
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


struct Heap {
    private var elements: [Int]
    private var orderCriteria: (Int, Int) -> Bool
    
    var isEmpty: Bool {
        elements.count <= 1
    }
    
    var peak: Int? {
        isEmpty ? nil : elements[1]
    }
    
    
    init(elements: [Int] = [], sort: @escaping (Int, Int) -> Bool) {
        self.elements = [0] + elements
        self.orderCriteria = sort
        
        if elements.isEmpty == false {
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
        (index - 1) / 2
    }
    
    mutating func buildHeap() {
        for index in (1...(self.elements.count / 2)).reversed() {
            self.diveDown(from: index)
        }
    }
    
    mutating func swimUp(from index: Int) {
        var index = index
        var parentIndex = parent(of: index)
        
        while parentIndex >= 1
                && orderCriteria(elements[index], elements[parentIndex]) {
            elements.swapAt(index, parentIndex)
            
            index = parentIndex
        }
    }
    
    mutating func insert(to item: Int) {
        elements.append(item)
        if isEmpty { return }
        
        swimUp(from: elements.endIndex)
    }
    
    
    mutating func diveDown(from index: Int) {
        var priorityIndex = index
        var leftChildIndex = leftChild(of: index)
        var rightChildIndex = rightChild(of: index)
        
        if leftChildIndex <= elements.endIndex
            && orderCriteria(elements[priorityIndex], elements[leftChildIndex]) {
            priorityIndex = leftChildIndex
        }
        
        if rightChildIndex <= elements.endIndex
            && orderCriteria(elements[priorityIndex], elements[rightChildIndex]) {
            priorityIndex = rightChildIndex
        }
        
        if index != priorityIndex {
            elements.swapAt(index, priorityIndex)
            diveDown(from: priorityIndex)
        }
    }
    
    mutating func pop() -> Int? {
        if isEmpty { return nil }
        else if elements.count == 2 { return elements.removeLast() }
        
        elements.swapAt(1, elements.endIndex)
        let popItem = elements.removeLast()
        diveDown(from: 1)
        
        return popItem
    }
}
