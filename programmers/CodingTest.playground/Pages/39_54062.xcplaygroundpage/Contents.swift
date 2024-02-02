//import Foundation
//
//func solution(_ stones:[Int], _ k:Int) -> Int {
////    if k == 1 {
////        return stones.min()!
////    }
////    else if k == stones.count {
////        return stones.max()!
////    }
////    else if stones.count == 1 {
////        return stones[0]
////    }
////    var result = 200000000, stones = stones
////
////    for index in 0..<stones.count-k {
////        result = min(result, stones[index..<k+index].max()!)
////    }
//    var result = 200000000, temp = stones
//
//    var min = 1, max = 200000000
//    var cnt = 0
//    while min <= max {
//        temp = stones
//        let mid = (min + max) / 2
//        for index in 0..<stones.count {
//            temp[index] -= mid
//
//            if temp[index] <= 0 {
//                cnt += 1
//
//                if cnt >= k {
//                    break
//                }
//            }
//            else {
//                cnt = 0
//            }
//        }
//        if max >= k {
//            max = mid - 1
//        }
//        else {
//            min = mid + 1
//        }
//    }
//
//    return min
//}
//
//solution([2, 4, 5, 3, 2, 1, 4, 2, 5, 1], 3)

print((1...17).randomElement())
