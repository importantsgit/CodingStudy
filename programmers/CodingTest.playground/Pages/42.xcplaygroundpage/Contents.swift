

import Foundation
//let n = 3
//var arr = [
//    [1, 3],
//    [2, 4],
//    [3, 5]
//]
//var times: PriorityQueue = PriorityQueue(<)
//var classCount = 0


//let n = Int(readLine()!)!
//var arr: [[Int]] = []
//var times: PriorityQueue = PriorityQueue(<)
//var classCount = 0
//
//for i in 0..<n {
//    arr.append(readLine()!.split(separator: " ").map{ Int($0)! })
//}
//
//arr = arr.sorted(by: {($0[0], $0[1]) < ($1[0], $1[1])})
//
//while arr.isEmpty == false {
//
//    let time = arr.removeFirst()
//
//    // 현재 강의실 중 가장 빨리 끝나는 강의실 선택 -> endTime 비교
//    if let leastTime = times.checkPeek(),
//       leastTime <= time[0] {
//        _ = times.pop()
//        times.push(time[1])
//    }
//    else {
//        times.push(time[1])
//    }
//
//
//}
//print(times.heap.count)
//
//struct PriorityQueue {
//    var heap: Heap
//
//    init(_ sort: @escaping (Int,Int) -> Bool) {
//        heap = Heap(<)
//    }
//
//    mutating func checkPeek() -> Int? {
//        return heap.peek
//    }
//
//    mutating func push(_ element: Int) {
//        heap.insert(item: element)
//    }
//
//    mutating func pop() -> Int? {
//        return heap.remove()
//    }
//}
//
//
//// heap 정렬
//struct Heap {
//    private var elements: [Int]
//    private let sortFunction: (Int, Int) -> Bool
//
//    var isEmpty: Bool {
//        return self.elements.count == 1
//    }
//
//    var peek: Int? {
//        if self.isEmpty { return nil }
//        return self.elements[1]
//    }
//
//    var count: Int {
//        return self.elements.count - 1
//    }
//
//    init(elements: [Int] = [0],_ sortFunction: @escaping (Int, Int) -> Bool) {
//        if elements.isEmpty == false {
//            self.elements = [elements.first!] + elements
//        }
//        else {
//            self.elements = elements
//        }
//        self.sortFunction = sortFunction
//        if elements.count > 1 {
//            buildHeap()
//        }
//    }
//
//    func leftChild(of index: Int) -> Int {
//        return index * 2
//    }
//
//    func rightChild(of index: Int) -> Int {
//        return index * 2 + 1
//    }
//
//    func parent(of index: Int) -> Int {
//        return index / 2
//    }
//
//    mutating func buildHeap() {
//        for index in (1...(self.elements.count / 2)).reversed() {
//            self.diveDown(from: index)
//        }
//    }
//
//    // 현재 주어진 index에서 위로 올라감
//    mutating func swimUp(from index: Int) {
//        var index = index
//        // index가 1이면 끝 && 현재 index의 숫자와 부모의 숫자를 비교
//        while index != 1 &&
//                self.sortFunction(self.elements[index], self.elements[self.parent(of: index)]) {
//            //
//            self.elements.swapAt(index, self.parent(of: index))
//            index = self.parent(of: index)
//        }
//    }
//
//    mutating func insert(item: Int) {
//        if self.isEmpty {
//            self.elements.append(item)
//            return
//        }
//        self.elements.append(item)
//        self.swimUp(from: self.elements.endIndex - 1)
//    }
//
//    // 조정
//    mutating func diveDown(from index: Int) {
//        var higherPriority = index
//        let leftIndex = self.leftChild(of: index)
//        let rightIndex = self.rightChild(of: index)
//
//        // 마지막 노드 이상의 index가 아닌 인덱스 && 값 비교
//        if leftIndex < self.elements.endIndex &&
//            self.sortFunction(self.elements[leftIndex], self.elements[higherPriority]) {
//            higherPriority = leftIndex
//        }
//
//        if rightIndex < self.elements.endIndex &&
//            self.sortFunction(self.elements[rightIndex], self.elements[higherPriority]) {
//            higherPriority = rightIndex
//        }
//
//        // 변환
//        if higherPriority != index {
//            self.elements.swapAt(higherPriority, index)
//            self.diveDown(from: higherPriority)
//        }
//    }
//
//    mutating func remove() -> Int? {
//        if self.isEmpty { return nil }
//        self.elements.swapAt(1, elements.endIndex - 1)
//        let deleted = elements.removeLast()
//        self.diveDown(from: 1)
//        return deleted
//    }
//}

//let n = 3
//var arr = [
//    [1, 3],
//    [2, 4],
//    [3, 5]
//]

let n = Int(readLine()!)!
var arr: [[Int]] = []
var current = 0
var result = 0

for _ in 0..<n {
    arr.append(readLine()!.split(separator: " ").map{ Int($0)! })
}

var times: [(hour: Int, isStartTime: Bool)] = []

for classTime in arr {
    times.append((hour: classTime[0], isStartTime: true))
    times.append((hour: classTime[1], isStartTime: false))
}

times.sort {
    if $0.hour != $1.hour {
        return $0.hour < $1.hour
    }
    else {
        return $0.isStartTime == false
    }
}

for time in times {
    if time.isStartTime {
        current += 1
        result = max(result, current)
    }
    else {
        current -= 1
    }
}

print(result)
