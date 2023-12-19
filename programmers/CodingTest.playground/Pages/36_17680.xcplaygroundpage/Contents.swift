import Foundation

func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    var cache: [String] = []
    var time = 0
    if cacheSize == 0 { return cities.count * 5 }
    for city in cities {
        var city = city.lowercased()
        if let index = cache.firstIndex(of: city) {
            cache.remove(at: index)
            time += 1
        }
        else {
            time += 5
            
            if cache.count >= cacheSize {
                cache.removeFirst()
            }
        }
        cache.append(city)
    }
    return time
}

class Node {
    var next: Node?
    var prev: Node?
    var value: String
    
    init(value: String, next: Node? = nil, prev: Node? = nil) {
        self.next = next
        self.prev = prev
        self.value = value
    }
}

class DoublyLinkedList {
    private var head: Node?
    private var tail: Node?
    private var count: Int = 0
    var max: Int = 0
    var time: Int = 0
    
    
    func removeLast() {
        
        // item 1개일 경우
        if head?.next == nil {
            head = nil
            tail = nil
            return
        }
        
        tail?.prev?.next = tail?.next
        tail = tail?.prev
    }
    
    func LRU(data: String) {
        if head == nil || tail == nil {
            head = Node(value: data)
            tail = head
            count += 1
            time += 5
            return
        }
        
        var pivotNode = head
        
        while let node = pivotNode {
            if node.value.compare(data, options: [.caseInsensitive]) == .orderedSame {
                node.prev?.next = node.next
                node.next?.prev = node.prev
                
                node.next = head
                head?.prev = node
                node.prev = nil
                head = node
                time += 1
                return
            }
            
            pivotNode = node.next
        }
        
        let newNode = Node(value: data)
        newNode.next = head
        head?.prev = newNode

        head = newNode
        count += 1
        
        if count > max {
            removeLast()
        }
        time += 5
    }
}


solution(3, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"]) // 50

solution(3, ["Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul", "Jeju", "Pangyo", "Seoul"]) // 21

solution(2, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]) // 60

solution(5, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]) // 52

solution(2, ["Jeju", "Pangyo", "NewYork", "newyork"]) // 16

solution(0, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA"]) // 25


//테스트 1 〉    통과 (0.10ms, 16.5MB)
//테스트 2 〉    통과 (0.11ms, 16.5MB)
//테스트 3 〉    통과 (0.13ms, 16.5MB)
//테스트 4 〉    통과 (0.10ms, 16.5MB)
//테스트 5 〉    통과 (0.04ms, 16.3MB)
//테스트 6 〉    통과 (0.07ms, 16.2MB)
//테스트 7 〉    실패 (0.13ms, 16.4MB)
//테스트 8 〉    통과 (0.07ms, 16.3MB)
//테스트 9 〉    실패 (시간 초과)
//테스트 10 〉    통과 (1.90ms, 16.6MB)
//테스트 11 〉    실패 (시간 초과)
//테스트 12 〉    실패 (0.00ms, )
//테스트 13 〉    실패 (시간 초과)
//테스트 14 〉    실패 (시간 초과)
//테스트 15 〉    실패 (시간 초과)
//테스트 16 〉    실패 (시간 초과)
//테스트 17 〉    실패 (시간 초과)
//테스트 18 〉    실패 (시간 초과)
//테스트 19 〉    실패 (시간 초과)
//테스트 20 〉    실패 (시간 초과)
