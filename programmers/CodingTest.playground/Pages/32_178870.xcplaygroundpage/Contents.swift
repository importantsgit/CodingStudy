//import Foundation
//
//enum Const {
//    static var sequence: [Int] = []
//    static var k = 0
//    static var cache: [[Int?]] = []
//    static var idx = (lIdx: 0, rIdx: 1000000000)
//}
//
//
//func solution(_ sequence:[Int], _ k:Int) -> [Int] {
//
//    Const.k = k
//    Const.sequence = sequence.filter { $0 <= k }
//    Const.cache = [[Int?]](repeating: [Int?](repeating: nil, count: Const.sequence.count), count: Const.sequence.count)
//    re(lIdx: -1, rIdx: Const.sequence.count - 1)
//    print("\(Const.cache)")
//    return [Const.idx.lIdx, Const.idx.rIdx]
//}
//
//func re(lIdx: Int, rIdx: Int) -> Int? {
//    print("lIdx \(lIdx) rIdx: \(rIdx)")
//    if rIdx >= Const.sequence.count {
//        return 0
//    }
//    if lIdx == rIdx {
//        if Const.sequence[lIdx] == Const.k { Const.idx = (lIdx: lIdx, rIdx: lIdx) }
//        Const.cache[lIdx][rIdx] = Const.sequence[lIdx]
//        return Const.cache[lIdx][rIdx]
//    }
//    var lIdx = lIdx == -1 ? 0 : lIdx
//    if let cache = Const.cache[lIdx][rIdx] {
//        return cache
//    }
//    var currentNum: Int? = nil
//
//    for idx in lIdx+1...rIdx {
//
//        guard let sum = re(lIdx: lIdx+1, rIdx: idx) else {return nil}
//        currentNum = Const.sequence[lIdx] + sum
//        Const.cache[lIdx][idx] = currentNum
//        if currentNum == Const.k {
//            var currentGap = rIdx - lIdx
//            var resultGap = Const.idx.rIdx - Const.idx.lIdx
//            //print("resultGap = \(Const.idx.rIdx) - \(Const.idx.lIdx) = \(resultGap), currentGap = \(rIdx) - \(lIdx) = \(currentGap)")
//            if (resultGap > currentGap) || (resultGap == currentGap && Const.idx.lIdx > lIdx) {
//                Const.idx = (lIdx: lIdx, rIdx: rIdx)
//            }
//        }
//    }
//    return currentNum
//}
//

//solution1([2, 2, 2, 2, 2], 6)
//
//func solution1(_ sequence:[Int], _ k:Int) -> [Int] {
//
//    var idx = [0,0]
//
//
//
//    return idx
//}


func solution2(_ sequence:[Int], _ k:Int) -> [Int] {
    var cache = [[Int]](repeating: [Int](repeating: 0, count: sequence.count), count: sequence.count)
    var minIdx = [1000000001,Int.max]

    for lIdx in sequence.indices {
        var sum = 0
        for rIdx in lIdx..<sequence.count {
            var currentGap = rIdx - lIdx
            var resultGap = minIdx[1] - minIdx[0]
            if lIdx == 0 {
                sum += sequence[rIdx]
                cache[lIdx][rIdx] = sum
                if cache[lIdx][rIdx] == k && ((minIdx[0] > lIdx && (resultGap > currentGap)) || (resultGap > currentGap)) {
                    minIdx = [lIdx, rIdx]
                }
            }
            else {
                cache[lIdx][rIdx] = cache[0][rIdx] - cache[0][lIdx-1]
                if cache[lIdx][rIdx] == k && ((minIdx[0] > lIdx && (resultGap > currentGap)) || (resultGap > currentGap)){
                    minIdx = [lIdx, rIdx]
                }
            }

        }
    }
    return minIdx
}
solution2([1, 1, 1, 2, 3, 4, 5], 5)

func solution(_ sequence:[Int], _ k:Int) -> [Int] {
    var idx = [0,0]
    var minIdx = [0,100000000000]
    var sum = sequence.first!

    while idx[0] <= idx[1] && idx[1] < sequence.count {
        if sum < k {
            idx[1] += 1
            if idx[1] < sequence.count {
                
                sum += sequence[idx[1]]
                continue
            }
        }
        else if sum == k {
            if minIdx[1] - minIdx[0] > idx[1] - idx[0] {
                minIdx = idx
            }
        }
        sum -= sequence[idx[0]]
        idx[0] += 1

    }
    return minIdx
}
solution2([1, 2, 3, 4, 5], 7)
