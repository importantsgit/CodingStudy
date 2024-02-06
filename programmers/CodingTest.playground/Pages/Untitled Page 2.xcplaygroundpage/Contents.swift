

re()


func re() -> Int {
    let n = 7
    let arr = [1, 3, 2, 3, 4, 4, 5]
    var items = [1, 0, 2, 0, 0]
    var item = items
    
    for (index, item) in items.enumerated() {
        if arr.filter({$0 == index + 1}).count < item {
            return -1
        }
    }
    
    var value = 201
    
    for index in arr.indices {
        var point = 0
        
        while items.reduce(0, +) != 0 {
            print((index+point) % (n - 1))
            items[arr[(index+point) % (n - 1)] - 1] -= items[arr[(index+point) % (n - 1)] - 1] > 0 ? 1 : 0
            point += 1
        }
        value = min(value, point)
    }

    return value
}
