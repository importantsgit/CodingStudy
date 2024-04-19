
var arr = [1,2,3,4,5]

for (index, num) in arr.enumerated() {
    print(index, num)
}
for i in arr.indices {
    print(i)
}

var ans = 0
var A = [1,2,3]
var B = [1,2,3]

// zip sequence 나열
for (AItem, BItem) in zip(A, B) {
    ans += AItem * BItem
}

extension Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}


