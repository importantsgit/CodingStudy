

func slideWindow(arr: [Int], count: Int, max: Int) {
    var result = arr[0..<count].reduce(0, +)
    var resultArr: [[Int]] = []
    
    if result == max {
        resultArr.append([0, count - 1])
    }
    
    for index in 0..<((arr.count - 1) - (count - 1)) {
        let startIndex = index
        let endIndex = index + count
        result -= arr[startIndex]
        result += arr[endIndex]
        
        if result == max {
            resultArr.append([index+1, endIndex])
        }
    }
    print(resultArr)
    resultArr.forEach {
        print(arr[$0[0]...$0[1]])
        print(arr[$0[0]...$0[1]].reduce(0, +))
    }
}



slideWindow(arr: [1,2,34,5,3,43,2,3,4,55,5,51,12,2,3,31,2,4,1,2,3,4,5,6], count: 3, max: 9)
