struct Heap {
    var elements: [Int]
    var orderCriteria: (Int, Int) -> Bool
    
    var isEmpty: Bool {
        elements.count <= 1
    }
    
    var peak: Int? {
        if isEmpty { return nil }
        return elements.last
    }
    
    init(elements: [Int] = [], sort: @escaping (Int, Int) -> Bool) {
        if elements.isEmpty {
            self.elements = [0]
        }
        else {
            self.elements = [0] + elements
        }
        
        self.orderCriteria = sort
        
        if elements.count > 1 {
            self.buildHeap()
        }
    }
    
    mutating func leftChild(of index: Int) -> Int {
        index * 2
    }
    
    mutating func rightChild(of index: Int) -> Int {
        index * 2 + 1
    }
    
    mutating func parent(of index: Int) -> Int {
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
                && orderCriteria(elements[index], elements[parentIndex]){
            elements.swapAt(index, parentIndex)
            index = parentIndex
        }
    }
    
    mutating func insert(item: Int) {
        if isEmpty {
            elements.append(item)
            return
        }
        
        elements.append(item)
        swimUp(from: elements.endIndex)
    }
    
    mutating func diveDown(from index: Int) {
        var priorityIndex = index
        let leftChildIndex = leftChild(of: index)
        let rightChildIndex = rightChild(of: index)
        
        if leftChildIndex < 0
            && orderCriteria(index, leftChildIndex) {
            priorityIndex = leftChildIndex
        }
        
        if rightChildIndex < 0
            && orderCriteria(index, rightChildIndex) {
            priorityIndex = rightChildIndex
        }
        
        if priorityIndex != index {
            elements.swapAt(priorityIndex, index)
            self.diveDown(from: priorityIndex)
        }
    }
    
    mutating func pop() -> Int? {
        if isEmpty { return nil }
        else if elements.count == 2 { return elements.removeLast() }
        
        elements.swapAt(1, elements.endIndex)
        
        let popItem = elements.removeLast()
        diveDown(from: elements.endIndex)
        
        return popItem
    }
}

struct PriorityQueue {
    var heap: Heap
    
    init(heap: [Int] = [], sort: @escaping (Int, Int) -> Bool) {
        self.heap = Heap(elements: heap, sort: sort)
    }
    
    mutating func getPeak() -> Int? {
        return heap.peak
    }
    
    mutating func push(item: Int) {
        heap.insert(item: item)
    }
    
    mutating func pop() -> Int? {
        heap.pop()
    }
}
