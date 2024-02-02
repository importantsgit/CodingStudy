func twoPoint(arr: [Int], max: Int) {
    var startIndex = 0, endIndex = 0
    var sum = arr[0]
    var resultArr: [[Int]] = []
    
    for start in 0..<arr.count {
        startIndex = start
        
        while sum < max && endIndex < arr.count - 1 {
            endIndex += 1
            sum += arr[endIndex]
        }
        
        if sum == max {
            resultArr.append([startIndex, endIndex])
        }
        
        sum -= arr[startIndex]
        
    }
    
    resultArr.forEach {
        print(arr[$0[0]...$0[1]])
        print(arr[$0[0]...$0[1]].reduce(0, +))
    }
}

twoPoint(arr: [1,2,3,4,5,1,2,3,4,5,1,2,3,4,5], max: 10)
