import Foundation

func isPrimeNumber(_ num: Int) -> Bool {
    if num < 2 { return false }
    
    for i in 2...Int(sqrt(Double(num))) {
        if num % i == 0 { return false }
    }
    
    return true
}

isPrimeNumber(5)
isPrimeNumber(6)


func getPrimeNumber(_ num: Int) -> [Int] {
    var primeNumberFlag = [Bool](repeating: true, count: num+1)
    primeNumberFlag[0] = false
    primeNumberFlag[1] = false
    
    for i in 2...Int(sqrt(Double(num))) {
        if primeNumberFlag[i] {
            var j = 2
            while i * j <= num {
                primeNumberFlag[i * j] = false
                j += 1
            }
        }
    }
    
    return primeNumberFlag.enumerated().filter { $0.1 == true }.map{ $0.0 }
}
 
print(getPrimeNumber(97))
