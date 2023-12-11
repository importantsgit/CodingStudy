import Foundation

func solution(_ p:String) -> String {
    return re(p)
}

func re(_ p: String) -> String {
    if p.isEmpty { return p }
    
    var stack: [String] = []
    var u = "", v = "", result = ""
    // leftPcount 여는 소괄호 / rightPcount 닫는 소괄호
    var leftPcount = 0, rightPcount = 0
    
    for i in 0..<p.count {
        let insertChar = p.getChar(idx: i)
        if insertChar == "(" {
            leftPcount += 1
        }
        else {
            rightPcount += 1
        }
         
        if let lastStackItem = stack.last,
           lastStackItem == "(" && insertChar == ")" {
            stack.removeLast()
        }
        else {
            stack.append(insertChar)
        }

        if stack.count == 0 {
            var subStr = p.getSubStrings(frontCount: i+1)
            u = subStr[0]
            v = subStr[1]
            
            result = u + re(v)
            break
        }
        else if leftPcount == rightPcount {
            print("i:\(i)")
            var subStr = p.getSubStrings(frontCount: i+1)
            print("subStr: \(subStr)")
            u = subStr[0]
            v = subStr[1]
            u.removeFirst()
            u.removeLast()
            
            result = "(" + re(v) + ")" + u.map { $0 == "(" ? ")" : "(" }
            break
        }
        
        
    }
    return result
}

extension String {
    
    func getSubStrings(frontCount: Int) -> [String] {
        if frontCount <= 0 || frontCount > self.count { return [] }
        if count == 1 { return [self, ""]}
        let lastIndex = self.index(self.startIndex, offsetBy: frontCount)
        
        
        return [String(self[..<lastIndex]), String(self[lastIndex...])]
    }
    
    func getChar(idx: Int) -> String {
        if idx < 0 || idx > self.count { return "" }
        let index = self.index(self.startIndex, offsetBy: idx)
        return String(self[index])
        
    }
}
var str = "))()))(((("
var result = solution(str)
var compare = "()()((()))"
print("result:\(result)")
print("compare:\(compare)")

print(result == compare)


//1. 입력이 빈 문자열인 경우, 빈 문자열을 반환합니다.
//2. 문자열 w를 두 "균형잡힌 괄호 문자열" u, v로 분리합니다. 단, u는 "균형잡힌 괄호 문자열"로 더 이상 분리할 수 없어야 하며, v는 빈 문자열이 될 수 있습니다.
//3. 문자열 u가 "올바른 괄호 문자열" 이라면 문자열 v에 대해 1단계부터 다시 수행합니다.
//  3-1. 수행한 결과 문자열을 u에 이어 붙인 후 반환합니다.
//4. 문자열 u가 "올바른 괄호 문자열"이 아니라면 아래 과정을 수행합니다.
//  4-1. 빈 문자열에 첫 번째 문자로 '('를 붙입니다.
//  4-2. 문자열 v에 대해 1단계부터 재귀적으로 수행한 결과 문자열을 이어 붙입니다.
//  4-3. ')'를 다시 붙입니다.
//  4-4. u의 첫 번째와 마지막 문자를 제거하고, 나머지 문자열의 괄호 방향을 뒤집어서 뒤에 붙입니다.
//  4-5. 생성된 문자열을 반환합니다.
