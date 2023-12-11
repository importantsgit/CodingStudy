import Foundation

func solution(_ storey:Int) -> Int {
    var storey = storey, devide = 10, result = 0
    var storeyCount = String(storey).count
    
    while storeyCount != 0 {
        
        var num = storey % devide / (devide / 10)
        
        
        if num > 5 {
            result += 10 - num
            storey += devide
        }
        else if num == 5 {
            let nextDevide = devide * 10
            var nextNum = storey % nextDevide / (nextDevide / 10)
            if nextNum < 5 {
                result += num
            }
            else {
                result += 10 - num
                storey += devide
            }
        }
        else {
            result += num
        }

        storey -= storey % devide
        devide *= 10
        storeyCount -= 1
    }
    
    return storey != 0 ? result + 1 : result
}


solution(50)

