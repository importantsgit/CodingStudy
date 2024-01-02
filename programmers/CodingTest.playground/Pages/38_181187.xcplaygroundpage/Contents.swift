//import Foundation
//
//func solution(_ elements:[Int]) -> Int {
//    var result: Set<Int> = []
//    let elements = elements + elements
//    let count = (elements.count-1)
//
//    for i in 0...count/2 {
//        let sum = 0
//        for j in 0...(count-i) {
//            if j+i > count/2+i { continue }
//            result.insert(elements[j...(j+i)].reduce(0, +))
//            if i == count/2 { break }
//        }
//    }
//
//    print(result.sorted())
//    return result.count
//}
//
//let arr = [7, 9, 1, 1, 4]
//
//solution(arr)


import Foundation

func solution(_ elements:[Int]) -> Int {
    var result: Set<Int> = []
    let count = elements.count
    
    for index in 0...count {
        var sum = 0
        for gap in 0..<count {
            sum = sum + elements[(index+gap)%count]
            result.insert(sum)
        }
    }
    
    return result.count
}


let arr = [7, 9, 1, 1, 4]

solution(arr)
