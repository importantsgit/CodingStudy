
func solution(_ cacheSize:Int, _ cities:[String]) -> Int {
    return 0
}
 

solution(3, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "Jeju", "Pangyo", "Seoul", "NewYork", "LA"]) // 50

solution(2, ["Jeju", "Pangyo", "Seoul", "NewYork", "LA", "SanFrancisco", "Seoul", "Rome", "Paris", "Jeju", "NewYork", "Rome"]) // 60


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
    
    func append(data: String) {
        if head == nil || tail == nil {
            head = Node(value: data)
            tail = head
            return
        }
        
        let newNode = Node(value: data, next: nil, prev: node)
        tail?.next = newNode
        newNode.prev = tail
        tail = newNode
        
    }
    
    func insert(data: String, at index: Int) {
        if head == nil {
            head = Node(value: data)
        }
        
        var node = head, index = index
        
        for _ in 0..<index {
            if node.next != nil {
                node = node?.next
            }
            else {
                break
            }
        }
        let insertNode = Node(value: data, next: node?.next, prev: node)
        node?.next.prev = node?.next
        node?.next = insertNode
    }
}
