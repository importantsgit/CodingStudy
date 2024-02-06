func minimumCheck(_ n: Int, _ conveyor: [Int], _ items: [Int]) -> Int {
    var itemsToDeliver = items
    var totalItemsToDeliver = items.reduce(0, +)
    
    // 필터링 (만약 답을 도출할 수 없다면 -1 반환)
    for (item, count) in items.enumerated() {
        let itemCount = conveyor.filter { $0 == item + 1 }.count
        if itemCount < count {
            return -1
        }
    }
    
    var minValue = 10000
    
    // 인덱스를 하나씩 늘려 그 위치에서 계산
    for i in 0..<n {
        var currentPosition = i
        var itemsChecked = 1
        itemsToDeliver = items
        
        // 아이템 계산
        while itemsToDeliver.reduce(0, +) > 0 {
            // If there are items to deliver
            if itemsToDeliver[conveyor[currentPosition] - 1] > 0 {
                itemsToDeliver[conveyor[currentPosition] - 1] -= 1
                itemsChecked += 1
            }
            currentPosition = (currentPosition + 1) % n
        }
        
        // while문이 끝나면 체크한 값과 저장되어 있는 값을 비교해 minValue에 저장
        minValue = min(minValue, itemsChecked)
    }
    
    return minValue
}

let n = 7
let conveyor = [1, 1, 1, 3, 3, 3, 3]
let items = [1, 0, 2, 0, 0]

print(minimumCheck(n, conveyor, items))
