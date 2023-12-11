//1. 실행 대기 큐(Queue)에서 대기중인 프로세스 하나를 꺼냅니다.
//2. 큐에 대기중인 프로세스 중 우선순위가 더 높은 프로세스가 있다면 방금 꺼낸 프로세스를 다시 큐에 넣습니다.
//3. 만약 그런 프로세스가 없다면 방금 꺼낸 프로세스를 실행합니다.
//  3.1 한 번 실행한 프로세스는 다시 큐에 넣지 않고 그대로 종료됩니다.


import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var queue = Queue(queue: priorities)
    var arr: [Int] = []
    var location = location
    var count = priorities.count
    
    while let item = queue.dequeue() {
        location -= 1
        
        if queue.isBiggerThen(item: item) {
            queue.enqueue(item: item)
            if location == -1 {
                location = count - 1
            }
        }
        else {
            count -= 1
            arr.append(item)
            if location == -1 {
                return arr.count
            }
            
        }
    }
    return 0
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

solution([2, 1, 3, 2], 2)
solution([1, 1, 9, 1, 1, 1], 0)
//[1, 1, 9, 1, 1, 1]    0    5
//6개의 프로세스 [A, B, C, D, E, F]가 대기 큐에 있고 중요도가 [1, 1, 9, 1, 1, 1] 이므로 [C, D, E, F, A, B] 순으로 실행됩니다. 따라서 A는 5번째로 실행됩니다.





