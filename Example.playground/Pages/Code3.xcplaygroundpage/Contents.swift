func generateCombinations(S: [Int], n: Int) -> [Int]{
    // n == 1
    if n == 1 {
        return S
    }
    // n == 2
    else if n == 2 {
        return [Int](S[0...1])
    }
    
    var cache: [Int] = [S[0]+S[1]], S = S
    var result:[Int] = [S[0], S[1]]
    
    func insertCombination(_ n: Int) {
        cache = result.map{ $0 + n } + cache.map { $0 + n } + cache
        result.append(n)
    }
    
    var point = 2
    
    while result.count < n {
        var item = S[point]
        print(item, cache, result)
        if cache.contains(S[point]) == false {
            // 포함 안됨
            insertCombination(item)
        }
        
        point += 1
    }
    
    return result
}
var S1 = [4, 6, 7, 10, 11, 13, 17]
generateCombinations(S: S1, n: 3)

var S2 = [1,1,2,5,6,6,7]
generateCombinations(S: S2, n: 3)



