import Foundation

/// Stiring 관련 함수

var string = "123456"
var string2 = "AbCDE"

// subString
let rangeStartIndex = string.index(string.startIndex, offsetBy: 0)
let rangeEndIndex = string.index(string.endIndex, offsetBy: -1) // 마지막 인덱스에서 -1이 마지막 값
let subString = string[rangeStartIndex...rangeEndIndex]

let rangeStartIndex1 = string.index(after: string.startIndex) // 첫번째 값에서 +1
let rangeEndIndex2 = string.index(before: string.endIndex) // 마지막 값
let subString2 = string[rangeStartIndex1...rangeEndIndex2]

let prefixString = string.prefix(2) // 2글자 가져오기
let suffixString = string.suffix(2) // 2글자 가져오기

let upperString = string2.uppercased()
let lowerString = string2.lowercased()

extension String {
    subscript(_ index: Int) -> Character {
        return self[self.index(self.startIndex, offsetBy: index)]
    }
    
    subscript(_ range: Range<Int>) -> String {
        let fromIndex = self.index(self.startIndex, offsetBy: range.startIndex)
        let toIndex = self.index(self.startIndex, offsetBy: range.endIndex)
        return String(self[fromIndex..<toIndex])
    }
}

let replacingString = string2.replacingOccurrences(of: "A", with: "D")
let str = string[Range(1...2)]
