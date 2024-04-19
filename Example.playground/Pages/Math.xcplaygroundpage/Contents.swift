import Foundation

//MARK: - radix
/// 10진수 만들기
let radix2 = 1100100
var str = String(radix2)
var radix10 = Int(str, radix: 2) ?? 0

/// 2진수 만들기
str = String(radix10, radix: 2)

/// 10진수 말고 다른 진수로 바꾸기 위해서는 먼저 10진수여야하고 String으로 변환
str = String(11001001)
radix10 = Int(str, radix: 2) ?? 0
let radix16 = String(radix10, radix: 16)

//MARK: - 자릿수 구하기
/// 자릿수 구하기 -> 4321
var num = 4321
let oooo = (num % 10000) / 1000
let ooo = (num % 1000) / 100
let oo = (num % 100) / 10
let o = (num % 10) / 1

//MARK: - 절대값
let absNum = abs(-10)

//MARK: - 제곱
let sqrtNum = Int(sqrt(Double(100)))
let powNum = Int(pow(Double(10), 2))

//MARK: - 반올림
round(1.0)
//MARK: - 내림
floor(1.0)
//MARK: - 올림
ceil(1.0)
