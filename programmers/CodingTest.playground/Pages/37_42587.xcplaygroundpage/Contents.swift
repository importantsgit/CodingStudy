import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var queue = priorities
    var arr: [Int] = []
    var location = location
    var result = 0
    
    while location != -1 {
        
        let item = queue.removeFirst()
        location -= 1
        
        if queue.contains(where: {
            item < $0
        }) {
            queue.append(item)
            
            if location == -1 {
                location = queue.count - 1
            }
        }
        else {
            arr.append(item)
            if location == -1 {
                result = arr.count
            }
        }
    }

    return result
}



solution([2,1,3,2], 2)
solution([1, 1, 9, 1, 1, 1], 0)




class Queue {
    private var queue: [Int?] = []
    private var index = 0
    
    func enqueue(_ item: Int) {
        
    }
    
    func dequeue() -> Int? {
        guard index < queue.count,
              let item = queue[index] else {return nil}
        
        index += 1
        
        if index > 2 {
            queue.removeFirst(3)
            index = 0
        }
        
        return item
    }
}
