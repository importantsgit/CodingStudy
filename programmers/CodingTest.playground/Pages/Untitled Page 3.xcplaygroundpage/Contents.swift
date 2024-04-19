//func generateCombinations(S: [Int], n: Int) -> [Int]{
//    // n == 1
//    if n == 1 {
//        return S
//    }
//    // n == 2
//    else if n == 2 {
//        return [Int](S[0...1])
//    }
//
//    var cache: [Int] = [S[0]+S[1]], S = S
//    var result:[Int] = [S[0], S[1]]
//
//    func insertCombination(_ n: Int) {
//        cache = result.map{ $0 + n } + cache.map { $0 + n } + cache
//        result.append(n)
//    }
//
//    var point = 2
//
//    while result.count < n {
//        var item = S[point]
//        print(item, cache, result)
//        if cache.contains(S[point]) == false {
//            // 포함 안됨
//            insertCombination(item)
//        }
//
//        point += 1
//    }
//
//    return result
//}
//var S1 = [4, 6, 7, 10, 11, 13, 17]
//generateCombinations(S: S1, n: 3)
//
//var S2 = [1,1,2,5,6,6,7]
//generateCombinations(S: S2, n: 3)
//
//
//

//5
//1 3 2 -1
//2 4 4 -1
//3 1 2 4 3 -1
//4 2 4 3 3 5 6 -1
//5 4 6 -1

//struct Queue {
//    var queue: [[Int]] = []
//    var index = 0
//
//    mutating func enqueue(item: [Int]) {
//        queue.append(item)
//    }
//
//    mutating func dequeue() -> [Int]? {
//        guard index < queue.count,
//              let item = queue.last
//        else { return nil }
//
//        index += 1
//
//        if index > 2 {
//            queue.removeFirst(3)
//            index = 0
//        }
//
//        return item
//    }
//}

//let v = 5
//
//let map = [
//    1: [[3,2]],
//    2: [[4,4]],
//    3: [[1,2], [4,3]],
//    4: [[2,4], [3,3], [5,6]],
//    5: [[4,6]]
//]
//
//
//
//func dfs(v: Int, map: [Int: [[Int]]]) -> Int {
//    var result = 0
//
//    for start in 1...v {
//        guard map[start, default: []].count == 1 else { continue }
//
//        var visitingStack:[[Int]] = []
//        var visitedIndex: [Int] = []
//        visitingStack.append([start,0])
//        var total = 0
//        var sum = 0
//
//        while let node = visitingStack.popLast(), var nodes = map[node[0]] {
//
//            if visitedIndex.contains(node[0]) {
//                sum = max(node[1], sum)
//                continue
//            }
//
//            visitedIndex.append(node[0])
//
//            nodes = nodes.map { item in
//                var item = item
//                if visitedIndex.contains(item[0]) == false {
//                    item[1] = item[1] + node[1]
//                }
//                else {
//                    item[1] = node[1]
//                }
//                return item
//
//            }
//
//            visitingStack += nodes
//        }
//
//        result = max(sum, result)
//    }
//
//    return result
//}
//
//
//print(dfs(v: v, map: map))

let arr = [[1, 4], [4, 5], [5, 1], [1, 6], [6, 7], [2, 7], [7, 3], [2, 3]]

