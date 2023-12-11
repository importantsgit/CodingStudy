
import Foundation

func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
    var queue1Sum = queue1.reduce(0, {$0+$1})
    var queue2Sum = queue2.reduce(0, {$0+$1})
    let sum = queue1Sum + queue2Sum
    if sum.isMultiple(of: 2) == false {
        return -1
    }
    
    var num = 0
    var queue1 = Queue(queue: queue1)
    var queue2 = Queue(queue: queue2)
    
    
    while num <= (queue1.queue.count * 2) {
        
        if queue1Sum == queue2Sum {
            return num
        }
        else if queue1Sum > queue2Sum {
            let item = queue1.dequeue() ?? 0
            queue2.enqueue(item: item)
            queue1Sum -= item
            queue2Sum += item
        }
        else {
            let item = queue2.dequeue() ?? 0
            queue1.enqueue(item: item)
            queue1Sum += item
            queue2Sum -= item
        }

        num += 1
    }
    
    return num != (queue1.queue.count * 2) ? num : -1
}

struct Queue {
    var queue: [Int]
    var index: Int
    
    init(queue: [Int]) {
        self.index = 0
        self.queue = queue
    }
    
    mutating func enqueue(item: Int) {
        queue.append(item)
    }
    
    mutating func dequeue() -> Int? {
        guard queue.isEmpty == false && index < queue.count else { return nil }
        let item = queue[index]
        queue[index] = 0
        index += 1
        
        if index > 2 {
            queue.removeFirst(3)
            index = 0
        }
        
        return item
    }
    
    mutating func isBiggerThen(item: Int) -> Bool {
        queue.max() ?? 0 > item
    }
}
solution([1,1], [1,5])

//[3, 2, 7, 2]    [4, 6, 5, 1]    2
//[1, 2, 1, 2]    [1, 10, 1, 2]    7
//[1, 1]    [1, 5]    -1
