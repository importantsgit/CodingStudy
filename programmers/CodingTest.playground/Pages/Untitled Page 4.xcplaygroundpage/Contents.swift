//var minusNumbers: [Int] = [-1]
//var plusNumbers: [Int] = [2,1,3]
//var zero = 0

//var minusNumbers: [Int] = [-3]
//var plusNumbers: [Int] = [2,3,4]
//var zero = 1
//var one = 0

let n = Int(readLine()!)!
var minusNumbers: [Int] = []
var plusNumbers: [Int] = []
var zero = 0
var one = 0

for _ in 0..<n {
    let num = Int(readLine()!)!
    if num == 0 {
        zero += 1
    }
    else if num == 1 {
        one += 1
    }
    else {
        num > 0 ? plusNumbers.append(num) : minusNumbers.append(num)
    }
}

minusNumbers.sort()
plusNumbers.sort(by: >)
var result = 0
var skip = false

if plusNumbers.isEmpty == false {
    for i in 0..<plusNumbers.count {
        if skip {
            skip = false
            continue
        }
        if plusNumbers[i] == 1 {
            result += 1
        }
        else if i < plusNumbers.count - 1  {
            result += plusNumbers[i] * plusNumbers[i+1]
            skip = true
        }
        else {
            result += plusNumbers[i]
        }
    }
}

skip = false

if minusNumbers.isEmpty == false {
    for i in 0..<minusNumbers.count {
        if skip {
            skip = false
            continue
        }
        if i < minusNumbers.count - 1  {
            result += minusNumbers[i] * minusNumbers[i+1]
            skip = true
        }
        else {
            if zero > 0 { zero -= 1 }
            else { result += minusNumbers[i] }
        }
    }
}

print(result + one)
