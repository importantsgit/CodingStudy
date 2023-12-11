
import Foundation

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    var deliveries = deliveries, pickups = pickups
    var deliveriesIdx = deliveries.lastIndex(where: { $0 != 0 }) ?? -1
    var pickupsIdx = pickups.lastIndex(where: { $0 != 0 }) ?? -1
    deliveries.removeLast(deliveriesIdx == -1 ? deliveries.count : deliveries.count - deliveriesIdx - 1)
    pickups.removeLast(pickupsIdx == -1 ? pickups.count : pickups.count - pickupsIdx - 1)
    var result = 0
    
    while deliveriesIdx >= 0 || pickupsIdx >= 0 {
        result += max(deliveries.count, pickups.count) * 2
        var currentCap = cap
        
        while deliveriesIdx >= 0 {
            if deliveries[deliveriesIdx] > currentCap {
                deliveries[deliveriesIdx] -= currentCap
                break
            }
            currentCap -= deliveries[deliveriesIdx]
            deliveries.removeLast()
            deliveriesIdx -= 1
            
        }
        currentCap = cap
        
        while pickupsIdx >= 0 {
            if pickups[pickupsIdx] > currentCap {
                pickups[pickupsIdx] -= currentCap
                break
            }
            currentCap -= pickups[pickupsIdx]
            pickups.removeLast()
            pickupsIdx -= 1
        }
    }
    return Int64(result)
}

solution(4, 5, [0,0,0,0,0], [0,3,0,4,0])
