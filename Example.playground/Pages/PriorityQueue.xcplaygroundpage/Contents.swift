struct Heap<T: Comparable> {
    private var elements: [T]
    private var orderCriteria: (T, T) -> Bool
    
    var isEmpty: Bool {
        elements.count <= 1
    }
    
    var peak: T? {
        isEmpty ? nil : elements[1]
    }
    
    init(elements: [T] = [], sort: @escaping (T, T) -> Bool) {
        if elements.isEmpty == false {
            self.elements = [elements[0]] + elements
        }
        else {
            self.elements = elements
        }
        
        self.orderCriteria = sort
        
        if self.elements.count > 1 {
            
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
        for index in (1...(self.elements.count/2)).reversed() {
            diveDown(from: index)
        }
    }
    
    mutating func swimUp(from index: Int) {
        var index = index
        let parentIndex = parent(of: index)
        
        while parentIndex >= 1 && orderCriteria(elements[index], elements[parentIndex]) {
            elements.swapAt(index, parentIndex)
            index = parentIndex
        }
    }
    
    mutating func insert(element: T) {
        if elements.isEmpty {
            elements.append(element)
        }
        elements.append(element)
        swimUp(from: elements.endIndex - 1)
    }
    
    mutating func diveDown(from index: Int) {
        var higherPriority = index
        let leftChildIndex = leftChild(of: index)
        let rightChildIndex = rightChild(of: index)
        
        if leftChildIndex <= elements.endIndex - 1 && orderCriteria(elements[higherPriority], elements[leftChildIndex]) {
            higherPriority = leftChildIndex
        }
        
        if rightChildIndex <= elements.endIndex - 1 && orderCriteria(elements[higherPriority], elements[rightChildIndex]) {
            higherPriority = rightChildIndex
        }
        
        if higherPriority != index {
            elements.swapAt(higherPriority, index)
            diveDown(from: higherPriority)
        }
    }
    
    mutating func pop() -> T? {
        if isEmpty {
            return nil
        }
        else if elements.count == 2 {
            return elements.removeLast()
        }
        
        
        elements.swapAt(1, elements.endIndex - 1)
        let popItem = elements.removeLast()
        diveDown(from: 1)
        return popItem
    }
}

struct PriorityQueue<T: Comparable> {
    private var heap: Heap<T>
    
    init(sort: @escaping (T, T) -> Bool) {
        self.heap = Heap(sort: <)
    }
    
    init(_ eleements: [T], sort: @escaping (T, T) -> Bool) {
        self.heap = Heap(elements: eleements, sort: sort)
    }
    
    mutating func getPeak() -> T? {
        self.heap.peak
    }
    
    mutating func push(element: T) {
        self.heap.insert(element: element)
    }
    
    mutating func pop() -> T? {
        self.heap.pop()
    }
}
