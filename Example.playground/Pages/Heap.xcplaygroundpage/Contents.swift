struct Heap {
    private var elements: [Int]
    private var orderCriteria: (Int, Int) -> Bool
    
    var isEmpty: Bool {
        self.elements.count == 1
    }
    
    var peak: Int? {
        isEmpty ? nil : elements[1]
    }
    
    init(elements: [Int] = [0], sort: @escaping (Int, Int) -> Bool) {
        self.elements = elements
        self.orderCriteria = sort
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
    
    mutating func swimUp(from index: Int) {
        var index = index
        while index != 1
                && self.orderCriteria(elements[index], elements[parent(of: index)]) {
            elements.swapAt(index, parent(of: index))
            index = parent(of: index)
        }
    }
    
    mutating func insert(item: Int) {
        if isEmpty {
            self.elements.append(item)
            return
        }
        
        self.elements.append(item)
        self.swimUp(from: self.elements.endIndex - 1)
    }
    
    mutating func diveDown(from index: Int) {
        let leftChildIndex = self.leftChild(of: index)
        let rightChildIndex = self.rightChild(of: index)
        var higherPriority = index
        
        if leftChildIndex < self.elements.endIndex
            && orderCriteria(elements[index], elements[leftChildIndex]) {
            higherPriority = leftChildIndex
        }
        
        if rightChildIndex < self.elements.endIndex
            && orderCriteria(elements[index], elements[rightChildIndex]) {
            higherPriority = rightChildIndex
        }
        
        if higherPriority != index {
            self.elements.swapAt(index,higherPriority)
            diveDown(from: higherPriority)
        }
    }
    
    mutating func pop(from index: Int) -> Int? {
        if isEmpty || index > self.elements.endIndex { return nil }
        else if self.elements.endIndex == 1 { return self.elements.removeLast() }
        
        elements.swapAt(index, self.elements.endIndex)
        let popItem = self.elements.removeLast()
        
        self.diveDown(from: index)
        
        return popItem
    }
}
