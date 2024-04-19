/*
 문제 설명
 0과 1로 이루어진 어떤 문자열 x에 대한 이진 변환을 다음과 같이 정의합니다.
 
 x의 모든 0을 제거합니다.
 x의 길이를 c라고 하면, x를 "c를 2진법으로 표현한 문자열"로 바꿉니다.
 예를 들어, x = "0111010"이라면, x에 이진 변환을 가하면 x = "0111010" -> "1111" -> "100" 이 됩니다.
 
 0과 1로 이루어진 문자열 s가 매개변수로 주어집니다. s가 "1"이 될 때까지 계속해서 s에 이진 변환을 가했을 때, 이진 변환의 횟수와 변환 과정에서 제거된 모든 0의 개수를 각각 배열에 담아 return 하도록 solution 함수를 완성해주세요.
 
 제한사항
 s의 길이는 1 이상 150,000 이하입니다.
 s에는 '1'이 최소 하나 이상 포함되어 있습니다.
 입출력 예
 s                   result
 "110010101001"      [3,8]
 "01110"             [3,3]
 "1111111"           [4,1]
 입출력 예 설명
 입출력 예 #1
 
 "110010101001"이 "1"이 될 때까지 이진 변환을 가하는 과정은 다음과 같습니다.
 회차    이진 변환 이전    제거할 0의 개수    0 제거 후 길이    이진 변환 결과
 1    "110010101001"    6    6    "110"
 2    "110"    1    2    "10"
 3    "10"    1    1    "1"
 3번의 이진 변환을 하는 동안 8개의 0을 제거했으므로, [3,8]을 return 해야 합니다.
 입출력 예 #2
 
 "01110"이 "1"이 될 때까지 이진 변환을 가하는 과정은 다음과 같습니다.
 회차    이진 변환 이전    제거할 0의 개수    0 제거 후 길이    이진 변환 결과
 1    "01110"    2    3    "11"
 2    "11"    0    2    "10"
 3    "10"    1    1    "1"
 3번의 이진 변환을 하는 동안 3개의 0을 제거했으므로, [3,3]을 return 해야 합니다.
 입출력 예 #3
 
 "1111111"이 "1"이 될 때까지 이진 변환을 가하는 과정은 다음과 같습니다.
 회차    이진 변환 이전    제거할 0의 개수    0 제거 후 길이    이진 변환 결과
 1    "1111111"    0    7    "111"
 2    "111"    0    3    "11"
 3    "11"    0    2    "10"
 4    "10"    1    1    "1"
 4번의 이진 변환을 하는 동안 1개의 0을 제거했으므로, [4,1]을 return 해야 합니다.
 
 import Foundation
 
 func solution(_ s:String) -> [Int] {
 var s = s
 var count = 0
 var zeroCount = 0
 
 while s != "1" {
 count += 1
 zeroCount += s.filter { $0 == "0" }.count
 //MARK: - 2 진수로 바꾸는 방법
 s = String(s.filter { $0 != "0" }.count, radix: 2)
 }
 
 return [count, zeroCount]
 }
 */

/*
 문제 설명
 피보나치 수는 F(0) = 0, F(1) = 1일 때, 1 이상의 n에 대하여 F(n) = F(n-1) + F(n-2) 가 적용되는 수 입니다.
 
 예를들어
 
 F(2) = F(0) + F(1) = 0 + 1 = 1
 F(3) = F(1) + F(2) = 1 + 1 = 2
 F(4) = F(2) + F(3) = 1 + 2 = 3
 F(5) = F(3) + F(4) = 2 + 3 = 5
 와 같이 이어집니다.
 
 2 이상의 n이 입력되었을 때, n번째 피보나치 수를 1234567으로 나눈 나머지를 리턴하는 함수, solution을 완성해 주세요.
 
 제한 사항
 n은 2 이상 100,000 이하인 자연수입니다.
 입출력 예
 n    return
 3    2
 5    5
 입출력 예 설명
 피보나치수는 0번째부터 0, 1, 1, 2, 3, 5, ... 와 같이 이어집니다.
 
 
 var cache: [Int] = []
 
 func re(_ n: Int) -> Int {
 if n == 1 { return 1 }
 else if n == 0 { return 0 }
 
 if cache[n] != -1 { return cache[n] }
 
 return (solution(n-2) + solution(n-1)) % 1234567
 }
 
 func solution(_ n:Int) -> Int {
 if n == 1 { return 1 }
 else if n == 0 { return 0 }
 
 cache = [Int](repeating: -1, count: n+1)
 
 return re(n)
 }
 
 func solution(_ n:Int) -> Int {
 if n == 1 { return 1 }
 else if n == 0 { return 0 }
 
 var dp = [0, 1]
 for _ in 2...n {
 dp = [dp[1], (dp[0] + dp[1]) % 1234567]
 }
 
 return dp[1]
 }
 */


/*
 문제 설명
 짝지어 제거하기는, 알파벳 소문자로 이루어진 문자열을 가지고 시작합니다. 먼저 문자열에서 같은 알파벳이 2개 붙어 있는 짝을 찾습니다. 그다음, 그 둘을 제거한 뒤, 앞뒤로 문자열을 이어 붙입니다. 이 과정을 반복해서 문자열을 모두 제거한다면 짝지어 제거하기가 종료됩니다. 문자열 S가 주어졌을 때, 짝지어 제거하기를 성공적으로 수행할 수 있는지 반환하는 함수를 완성해 주세요. 성공적으로 수행할 수 있으면 1을, 아닐 경우 0을 리턴해주면 됩니다.
 
 예를 들어, 문자열 S = baabaa 라면
 
 b aa baa → bb aa → aa →
 
 의 순서로 문자열을 모두 제거할 수 있으므로 1을 반환합니다.
 
 제한사항
 문자열의 길이 : 1,000,000이하의 자연수
 문자열은 모두 소문자로 이루어져 있습니다.
 입출력 예
 s    result
 baabaa    1
 cdcd    0
 입출력 예 설명
 입출력 예 #1
 위의 예시와 같습니다.
 입출력 예 #2
 문자열이 남아있지만 짝지어 제거할 수 있는 문자열이 더 이상 존재하지 않기 때문에 0을 반환합니다.
 
 import Foundation
 
 func solution(_ s:String) -> Int{
 guard s.count.isMultiple(of: 2) else { return 0 }
 var stack: [Character] = []
 
 for i in s {
 if stack.last == i {
 stack.popLast()
 }
 else {
 stack.append(i)
 }
 }
 return stack.isEmpty ? 1 : 0
 }
 
 extension String {
 subscript(_ index: Int) -> String? {
 guard 0 <= index && index < self.count else { return nil }
 return String(self[self.index(self.startIndex, offsetBy: index)])
 }
 
 subscript(_ startIndex: Int,_ endIndex: Int) -> String? {
 guard 0 <= startIndex && endIndex < self.count,
 startIndex <= endIndex
 else { return nil }
 let start = self.index(self.startIndex, offsetBy: startIndex)
 let end = self.index(self.startIndex, offsetBy: endIndex)
 return String(self[start...end])
 }
 }
 
 solution("aabb")
 */
/*
 문제 설명
 1부터 n까지 번호가 붙어있는 n명의 사람이 영어 끝말잇기를 하고 있습니다. 영어 끝말잇기는 다음과 같은 규칙으로 진행됩니다.
 
 1번부터 번호 순서대로 한 사람씩 차례대로 단어를 말합니다.
 마지막 사람이 단어를 말한 다음에는 다시 1번부터 시작합니다.
 앞사람이 말한 단어의 마지막 문자로 시작하는 단어를 말해야 합니다.
 이전에 등장했던 단어는 사용할 수 없습니다.
 한 글자인 단어는 인정되지 않습니다.
 다음은 3명이 끝말잇기를 하는 상황을 나타냅니다.
 
 tank → kick → know → wheel → land → dream → mother → robot → tank
 
 위 끝말잇기는 다음과 같이 진행됩니다.
 
 1번 사람이 자신의 첫 번째 차례에 tank를 말합니다.
 2번 사람이 자신의 첫 번째 차례에 kick을 말합니다.
 3번 사람이 자신의 첫 번째 차례에 know를 말합니다.
 1번 사람이 자신의 두 번째 차례에 wheel을 말합니다.
 (계속 진행)
 끝말잇기를 계속 진행해 나가다 보면, 3번 사람이 자신의 세 번째 차례에 말한 tank 라는 단어는 이전에 등장했던 단어이므로 탈락하게 됩니다.
 
 사람의 수 n과 사람들이 순서대로 말한 단어 words 가 매개변수로 주어질 때, 가장 먼저 탈락하는 사람의 번호와 그 사람이 자신의 몇 번째 차례에 탈락하는지를 구해서 return 하도록 solution 함수를 완성해주세요.
 
 제한 사항
 끝말잇기에 참여하는 사람의 수 n은 2 이상 10 이하의 자연수입니다.
 words는 끝말잇기에 사용한 단어들이 순서대로 들어있는 배열이며, 길이는 n 이상 100 이하입니다.
 단어의 길이는 2 이상 50 이하입니다.
 모든 단어는 알파벳 소문자로만 이루어져 있습니다.
 끝말잇기에 사용되는 단어의 뜻(의미)은 신경 쓰지 않으셔도 됩니다.
 정답은 [ 번호, 차례 ] 형태로 return 해주세요.
 만약 주어진 단어들로 탈락자가 생기지 않는다면, [0, 0]을 return 해주세요.
 입출력 예
 n    words    result
 3    ["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"]    [3,3]
 5    ["hello", "observe", "effect", "take", "either", "recognize", "encourage", "ensure", "establish", "hang", "gather", "refer", "reference", "estimate", "executive"]    [0,0]
 2    ["hello", "one", "even", "never", "now", "world", "draw"]    [1,3]
 입출력 예 설명
 입출력 예 #1
 3명의 사람이 끝말잇기에 참여하고 있습니다.
 
 1번 사람 : tank, wheel, mother
 2번 사람 : kick, land, robot
 3번 사람 : know, dream, tank
 와 같은 순서로 말을 하게 되며, 3번 사람이 자신의 세 번째 차례에 말한 tank라는 단어가 1번 사람이 자신의 첫 번째 차례에 말한 tank와 같으므로 3번 사람이 자신의 세 번째 차례로 말을 할 때 처음 탈락자가 나오게 됩니다.
 
 입출력 예 #2
 5명의 사람이 끝말잇기에 참여하고 있습니다.
 
 1번 사람 : hello, recognize, gather
 2번 사람 : observe, encourage, refer
 3번 사람 : effect, ensure, reference
 4번 사람 : take, establish, estimate
 5번 사람 : either, hang, executive
 와 같은 순서로 말을 하게 되며, 이 경우는 주어진 단어로만으로는 탈락자가 발생하지 않습니다. 따라서 [0, 0]을 return하면 됩니다.
 
 입출력 예 #3
 2명의 사람이 끝말잇기에 참여하고 있습니다.
 
 1번 사람 : hello, even, now, draw
 2번 사람 : one, never, world
 와 같은 순서로 말을 하게 되며, 1번 사람이 자신의 세 번째 차례에 'r'로 시작하는 단어 대신, n으로 시작하는 now를 말했기 때문에 이때 처음 탈락자가 나오게 됩니다.
 
 import Foundation
 
 func solution(_ n:Int, _ words:[String]) -> [Int] {
 var member = 0
 var count = 0
 for (idx, word) in words.enumerated() {
 if idx + 1 < words.count,
 let index = words[(idx+1)...].firstIndex(where: { $0 == word }) {
 let pivot = words[(idx+1)...].distance(to: index) + idx + 1
 member = pivot % n + 1
 count = pivot / n + 1
 break
 }
 else if idx + 1 < words.count && word.last != words[idx+1].first {
 member = (idx+1) % n + 1
 count = (idx+1) / n + 1
 break
 }
 }
 return [member, count]
 }
 
 extension Collection {
 func distance(to index: Index) -> Int { distance(from: startIndex, to: index) }
 }
 
 ----
 
 func solution(_ n:Int, _ words:[String]) -> [Int] {
 var wordSet: Set<String> = []
 for (idx, word) in words.enumerated() {
 if idx - 1 >= 0 && (word.first != words[idx-1].last) || wordSet.contains(word) {
 print(idx)
 return [(idx % n + 1), (idx / n + 1)]
 break
 }
 
 wordSet.insert(word)
 }
 return [0, 0]
 }
 
 3, ["tank", "kick", "know", "kick"] [1, 2]
 
 3, ["aba", "aba", "bba"] [2,1]
 
 
 
 */
/*
 점프와 순간이동
 OO 연구소는 한 번에 K 칸을 앞으로 점프하거나, (현재까지 온 거리) x 2 에 해당하는 위치로 순간이동을 할 수 있는 특수한 기능을 가진 아이언 슈트를 개발하여 판매하고 있습니다. 이 아이언 슈트는 건전지로 작동되는데, 순간이동을 하면 건전지 사용량이 줄지 않지만, 앞으로 K 칸을 점프하면 K 만큼의 건전지 사용량이 듭니다. 그러므로 아이언 슈트를 착용하고 이동할 때는 순간 이동을 하는 것이 더 효율적입니다. 아이언 슈트 구매자는 아이언 슈트를 착용하고 거리가 N 만큼 떨어져 있는 장소로 가려고 합니다. 단, 건전지 사용량을 줄이기 위해 점프로 이동하는 것은 최소로 하려고 합니다. 아이언 슈트 구매자가 이동하려는 거리 N이 주어졌을 때, 사용해야 하는 건전지 사용량의 최솟값을 return하는 solution 함수를 만들어 주세요.
 
 예를 들어 거리가 5만큼 떨어져 있는 장소로 가려고 합니다.
 아이언 슈트를 입고 거리가 5만큼 떨어져 있는 장소로 갈 수 있는 경우의 수는 여러 가지입니다.
 
 처음 위치 0 에서 5 칸을 앞으로 점프하면 바로 도착하지만, 건전지 사용량이 5 만큼 듭니다.
 처음 위치 0 에서 2 칸을 앞으로 점프한 다음 순간이동 하면 (현재까지 온 거리 : 2) x 2에 해당하는 위치로 이동할 수 있으므로 위치 4로 이동합니다. 이때 1 칸을 앞으로 점프하면 도착하므로 건전지 사용량이 3 만큼 듭니다.
 처음 위치 0 에서 1 칸을 앞으로 점프한 다음 순간이동 하면 (현재까지 온 거리 : 1) x 2에 해당하는 위치로 이동할 수 있으므로 위치 2로 이동됩니다. 이때 다시 순간이동 하면 (현재까지 온 거리 : 2) x 2 만큼 이동할 수 있으므로 위치 4로 이동합니다. 이때 1 칸을 앞으로 점프하면 도착하므로 건전지 사용량이 2 만큼 듭니다.
 위의 3가지 경우 거리가 5만큼 떨어져 있는 장소로 가기 위해서 3번째 경우가 건전지 사용량이 가장 적으므로 답은 2가 됩니다.
 
 제한 사항
 숫자 N: 1 이상 10억 이하의 자연수
 숫자 K: 1 이상의 자연수
 입출력 예
 N    result
 5    2
 6    2
 5000    5
 입출력 예 설명
 입출력 예 #1
 위의 예시와 같습니다.
 
 입출력 예 #2
 처음 위치 0 에서 1 칸을 앞으로 점프한 다음 순간이동 하면 (현재까지 온 거리 : 1) x 2에 해당하는 위치로 이동할 수 있으므로 위치 2로 이동합니다. 이때 1 칸을 앞으로 점프하면 위치3으로 이동합니다. 이때 다시 순간이동 하면 (현재까지 온 거리 : 3) x 2 이동할 수 있으므로 위치 6에 도착합니다. 이 경우가 건전지 사용량이 가장 적으므로 2를 반환해주면 됩니다.
 
 입출력 예 #3
 위와 같은 방식으로 합니다.
 
 
 */


/*
 func solution(_ n:Int) -> Int {
 if n == 1 { return 1 }
 var dp: [Int] = [Int](repeating: -1, count: n+1)
 dp[1] = 1
 for i in 2...n {
 dp[i] = i.isMultiple(of: 2) ? dp[i/2] : dp[i-1]+1
 }
 return dp[n]
 }
 
 거꾸로 푸는 방법을 생각해보자
 func solution(_ n:Int) -> Int {
 if n == 1 { return 1 }
 var n = n
 var count = 0
 while n != 0 {
 if n.isMultiple(of: 2) {
 n /= 2
 }
 else {
 n -= 1
 count += 1
 }
 }
 return count
 }
 */

/*
 문제 설명
 경화는 과수원에서 귤을 수확했습니다. 경화는 수확한 귤 중 'k'개를 골라 상자 하나에 담아 판매하려고 합니다. 그런데 수확한 귤의 크기가 일정하지 않아 보기에 좋지 않다고 생각한 경화는 귤을 크기별로 분류했을 때 서로 다른 종류의 수를 최소화하고 싶습니다.
 
 예를 들어, 경화가 수확한 귤 8개의 크기가 [1, 3, 2, 5, 4, 5, 2, 3] 이라고 합시다. 경화가 귤 6개를 판매하고 싶다면, 크기가 1, 4인 귤을 제외한 여섯 개의 귤을 상자에 담으면, 귤의 크기의 종류가 2, 3, 5로 총 3가지가 되며 이때가 서로 다른 종류가 최소일 때입니다.
 
 경화가 한 상자에 담으려는 귤의 개수 k와 귤의 크기를 담은 배열 tangerine이 매개변수로 주어집니다. 경화가 귤 k개를 고를 때 크기가 서로 다른 종류의 수의 최솟값을 return 하도록 solution 함수를 작성해주세요.
 
 제한사항
 1 ≤ k ≤ tangerine의 길이 ≤ 100,000
 1 ≤ tangerine의 원소 ≤ 10,000,000
 입출력 예
 k    tangerine                   result
 6    [1, 3, 2, 5, 4, 5, 2, 3]    3
 4    [1, 3, 2, 5, 4, 5, 2, 3]    2
 2    [1, 1, 1, 1, 2, 2, 2, 3]    1
 입출력 예 설명
 입출력 예 #1
 
 본문에서 설명한 예시입니다.
 입출력 예 #2
 
 경화는 크기가 2인 귤 2개와 3인 귤 2개 또는 2인 귤 2개와 5인 귤 2개 또는 3인 귤 2개와 5인 귤 2개로 귤을 판매할 수 있습니다. 이때의 크기 종류는 2가지로 이 값이 최소가 됩니다.
 입출력 예 #3
 
 경화는 크기가 1인 귤 2개를 판매하거나 2인 귤 2개를 판매할 수 있습니다. 이때의 크기 종류는 1가지로, 이 값이 최소가 됩니다.
 
 func solution(_ k:Int, _ tangerine:[Int]) -> Int {
 var arr: [[Int]] = []
 var tangerine = tangerine.sorted()
 var k = k
 var result = 0
 
 for item in tangerine {
 if let basket = arr.last,
 basket[0] == item {
 arr[arr.count-1][1] += 1
 }
 else {
 arr.append([item, 1])
 }
 }
 arr.sort { $0[1] > $1[1] }
 while k > 0 {
 k -= arr[result][1]
 result += 1
 }
 return result
 }
 
 import Foundation
 
 func solution(_ k:Int, _ tangerine:[Int]) -> Int {
 var basket: [Int: Int] = [:]
 var k = k
 var result = 0
 
 tangerine.map {
 basket[$0, default: 0] += 1
 }
 
 // MARK: - 중요 포인트
 // 모든 과일의 수를 구하고 k에 한 과일의 수만큼 빼면서 만약 연산이 된다면 result += 1해주기
 for item in basket.sorted(by: { $0.value > $1.value }) {
 k -= item.value
 result += 1
 if k <= 0 { break }
 }
 return result
 }
 */

/*
 다음 규칙을 지키는 문자열을 올바른 괄호 문자열이라고 정의합니다.
 
 (), [], {} 는 모두 올바른 괄호 문자열입니다.
 만약 A가 올바른 괄호 문자열이라면, (A), [A], {A} 도 올바른 괄호 문자열입니다. 예를 들어, [] 가 올바른 괄호 문자열이므로, ([]) 도 올바른 괄호 문자열입니다.
 만약 A, B가 올바른 괄호 문자열이라면, AB 도 올바른 괄호 문자열입니다. 예를 들어, {} 와 ([]) 가 올바른 괄호 문자열이므로, {}([]) 도 올바른 괄호 문자열입니다.
 대괄호, 중괄호, 그리고 소괄호로 이루어진 문자열 s가 매개변수로 주어집니다. 이 s를 왼쪽으로 x (0 ≤ x < (s의 길이)) 칸만큼 회전시켰을 때 s가 올바른 괄호 문자열이 되게 하는 x의 개수를 return 하도록 solution 함수를 완성해주세요.
 
 제한사항
 s의 길이는 1 이상 1,000 이하입니다.
 입출력 예
 s           result
 "[](){}"    3
 "}]()[{"    2
 "[)(]"      0
 "}}}"       0
 입출력 예 설명
 입출력 예 #1
 
 다음 표는 "[](){}" 를 회전시킨 모습을 나타낸 것입니다.
 x    s를 왼쪽으로 x칸만큼 회전    올바른 괄호 문자열?
 0    "[](){}"               O
 1    "](){}["               X
 2    "(){}[]"               O
 3    "){}[]("               X
 4    "{}[]()"               O
 5    "}[](){"               X
 올바른 괄호 문자열이 되는 x가 3개이므로, 3을 return 해야 합니다.
 입출력 예 #2
 
 다음 표는 "}]()[{" 를 회전시킨 모습을 나타낸 것입니다.
 x    s를 왼쪽으로 x칸만큼 회전    올바른 괄호 문자열?
 0    "}]()[{"    X
 1    "]()[{}"    X
 2    "()[{}]"    O
 3    ")[{}]("    X
 4    "[{}]()"    O
 5    "{}]()["    X
 올바른 괄호 문자열이 되는 x가 2개이므로, 2를 return 해야 합니다.
 입출력 예 #3
 
 s를 어떻게 회전하더라도 올바른 괄호 문자열을 만들 수 없으므로, 0을 return 해야 합니다.
 입출력 예 #4
 
 s를 어떻게 회전하더라도 올바른 괄호 문자열을 만들 수 없으므로, 0을 return 해야 합니다.
 
 import Foundation
 
 func solution(_ s:String) -> Int {
 var s = s
 var itemCase = ["(": ")", "{": "}", "[": "]"]
 var stack: [String] = []
 var pivot = 0
 
 while pivot != s.count {
 var count = 0
 var isCollect = true
 
 for item in s {
 var item = String(item)
 if itemCase.keys.contains(where: {item == $0}) {
 stack.append(item)
 }
 else if let popItem = stack.popLast(),
 let compare = itemCase[popItem],
 compare == item {
 if stack.isEmpty {
 count += 1
 }
 }
 else {
 // 올바르지 않은
 count = 0
 isCollect = false
 break
 }
 }
 
 if stack.isEmpty && isCollect { return count }
 
 var prefix = s.removeFirst()
 s += String(prefix)
 pivot += 1
 }
 
 return 0
 }
 
 */



/*
 문제 설명
 XYZ 마트는 일정한 금액을 지불하면 10일 동안 회원 자격을 부여합니다. XYZ 마트에서는 회원을 대상으로 매일 한 가지 제품을 할인하는 행사를 합니다. 할인하는 제품은 하루에 하나씩만 구매할 수 있습니다. 알뜰한 정현이는 자신이 원하는 제품과 수량이 할인하는 날짜와 10일 연속으로 일치할 경우에 맞춰서 회원가입을 하려 합니다.
 
 예를 들어, 정현이가 원하는 제품이 바나나 3개, 사과 2개, 쌀 2개, 돼지고기 2개, 냄비 1개이며, XYZ 마트에서 14일간 회원을 대상으로 할인하는 제품이 날짜 순서대로 치킨, 사과, 사과, 바나나, 쌀, 사과, 돼지고기, 바나나, 돼지고기, 쌀, 냄비, 바나나, 사과, 바나나인 경우에 대해 알아봅시다. 첫째 날부터 열흘 간에는 냄비가 할인하지 않기 때문에 첫째 날에는 회원가입을 하지 않습니다. 둘째 날부터 열흘 간에는 바나나를 원하는 만큼 할인구매할 수 없기 때문에 둘째 날에도 회원가입을 하지 않습니다. 셋째 날, 넷째 날, 다섯째 날부터 각각 열흘은 원하는 제품과 수량이 일치하기 때문에 셋 중 하루에 회원가입을 하려 합니다.
 
 정현이가 원하는 제품을 나타내는 문자열 배열 want와 정현이가 원하는 제품의 수량을 나타내는 정수 배열 number, XYZ 마트에서 할인하는 제품을 나타내는 문자열 배열 discount가 주어졌을 때, 회원등록시 정현이가 원하는 제품을 모두 할인 받을 수 있는 회원등록 날짜의 총 일수를 return 하는 solution 함수를 완성하시오. 가능한 날이 없으면 0을 return 합니다.
 
 제한사항
 1 ≤ want의 길이 = number의 길이 ≤ 10
 1 ≤ number의 원소 ≤ 10
 number[i]는 want[i]의 수량을 의미하며, number의 원소의 합은 10입니다.
 10 ≤ discount의 길이 ≤ 100,000
 want와 discount의 원소들은 알파벳 소문자로 이루어진 문자열입니다.
 1 ≤ want의 원소의 길이, discount의 원소의 길이 ≤ 12
 입출력 예
 want    number    discount    result
 ["banana", "apple", "rice", "pork", "pot"]
 [3, 2, 2, 2, 1]
 ["chicken", "apple", "apple", "banana", "rice", "apple", "pork", "banana", "pork", "rice", "pot", "banana", "apple", "banana"]
 3
 
 ["apple"]
 [10]
 ["banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana", "banana"]
 0
 
 입출력 예 설명
 입출력 예 #1
 
 문제 예시와 같습니다.
 입출력 예 #2
 
 사과가 할인하는 날이 없으므로 0을 return 합니다.
 
 import Foundation
 
 //MARK: - 슬라이스 윈도우
 
 func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
 var result = 0
 var dic: [String: Int] = [:]
 
 for i in want.indices {
 dic[want[i]] = number[i]
 }
 
 discount[0...9].forEach { str in
 if dic.keys.contains(where: { $0 == str }) {
 dic.updateValue((dic[str] ?? 0) - 1, forKey: str)
 }
 }
 
 if dic.contains(where: { $0.value != 0 }) == false {
 result += 1
 }
 
 for endDay in 10..<discount.count {
 
 if dic.keys.contains(where: { $0 == discount[endDay-10] }) {
 dic.updateValue((dic[discount[endDay-10]] ?? 0) + 1, forKey: discount[endDay-10])
 }
 
 if dic.keys.contains(where: { $0 == discount[endDay] }) {
 dic.updateValue((dic[discount[endDay]] ?? 0) - 1, forKey: discount[endDay])
 }
 
 if dic.contains(where: { $0.value != 0 }) == false {
 result += 1
 }
 }
 
 return result
 }
 
 
 
 func solution(_ want:[String], _ number:[Int], _ discount:[String]) -> Int {
 var answer = 0
 
 for i in 0..<(discount.count - 9) {
 var temp = Array(repeating: 0, count: want.count)
 for j in i..<(i + 10) {
 if let idx = want.firstIndex(of: discount[j]) {
 temp[idx] += 1
 }
 }
 if number == temp {
 answer += 1
 }
 }
 
 return answer
 }
 
 
 */

/*
 문제 설명
 정수 n, left, right가 주어집니다. 다음 과정을 거쳐서 1차원 배열을 만들고자 합니다.
 
 n행 n열 크기의 비어있는 2차원 배열을 만듭니다.
 i = 1, 2, 3, ..., n에 대해서, 다음 과정을 반복합니다.
 1행 1열부터 i행 i열까지의 영역 내의 모든 빈 칸을 숫자 i로 채웁니다.
 1행, 2행, ..., n행을 잘라내어 모두 이어붙인 새로운 1차원 배열을 만듭니다.
 새로운 1차원 배열을 arr이라 할 때, arr[left], arr[left+1], ..., arr[right]만 남기고 나머지는 지웁니다.
 정수 n, left, right가 매개변수로 주어집니다. 주어진 과정대로 만들어진 1차원 배열을 return 하도록 solution 함수를 완성해주세요.
 
 제한사항
 1 ≤ n ≤ 107
 0 ≤ left ≤ right < n2
 right - left < 105
 입출력 예
 n    left    right    result
 3    2    5    [3,2,2,3]
 4    7    14    [4,3,3,3,4,4,4,4]
 입출력 예 설명
 입출력 예 #1
 
 //MARK: - 중요포인트
 import Foundation
 
 func solution(_ n:Int, _ left:Int64, _ right:Int64) -> [Int] {
 return (Int(left)...Int(right)).map { max($0 / n, $0 % n) + 1 }
 }
 
 */
/*
 H-Index는 과학자의 생산성과 영향력을 나타내는 지표입니다. 어느 과학자의 H-Index를 나타내는 값인 h를 구하려고 합니다. 위키백과1에 따르면, H-Index는 다음과 같이 구합니다.
 
 어떤 과학자가 발표한 논문 n편 중, h번 이상 인용된 논문이 h편 이상이고 나머지 논문이 h번 이하 인용되었다면 h의 최댓값이 이 과학자의 H-Index입니다.
 
 어떤 과학자가 발표한 논문의 인용 횟수를 담은 배열 citations가 매개변수로 주어질 때, 이 과학자의 H-Index를 return 하도록 solution 함수를 작성해주세요.
 
 제한사항
 과학자가 발표한 논문의 수는 1편 이상 1,000편 이하입니다.
 논문별 인용 횟수는 0회 이상 10,000회 이하입니다.
 입출력 예
 citations    return
 [3, 0, 6, 1, 5]    3
 
 입출력 예 설명
 이 과학자가 발표한 논문의 수는 5편이고, 그중 3편의 논문은 3회 이상 인용되었습니다. 그리고 나머지 2편의 논문은 3회 이하 인용되었기 때문에 이 과학자의 H-Index는 3입니다.
 
 import Foundation
 
 func solution(_ citations:[Int]) -> Int {
 let citations = citations.sorted(by: >)
 var result = -1
 for i in citations.indices {
 let value = citations[i]
 let h = i+1
 
 if h > value {
 result = i
 break
 }
 }
 if result == -1 {
 return citations.count
 }
 
 return result
 
 }
 
 */


/*
 문제 설명
 2차원 행렬 arr1과 arr2를 입력받아, arr1에 arr2를 곱한 결과를 반환하는 함수, solution을 완성해주세요.
 
 제한 조건
 행렬 arr1, arr2의 행과 열의 길이는 2 이상 100 이하입니다.
 행렬 arr1, arr2의 원소는 -10 이상 20 이하인 자연수입니다.
 곱할 수 있는 배열만 주어집니다.
 입출력 예
 arr1    arr2    return
 [[1, 4], [3, 2], [4, 1]]    [[3, 3], [3, 3]]    [[15, 15], [15, 15], [15, 15]]
 [[2, 3, 2], [4, 2, 4], [3, 1, 4]]    [[5, 4, 3], [2, 4, 1], [3, 1, 1]]    [[22, 22, 11], [36, 28, 18], [29, 20, 14]]
 
 import Foundation
 
 func solution(_ arr1:[[Int]], _ arr2:[[Int]]) -> [[Int]] {
 let arrY = arr1.count
 let arrX = arr2.first?.count ?? 0
 let count = arr1.first?.count ?? 0
 
 var result = [[Int]](repeating: [Int](repeating: 0, count: arrX), count: arrY)
 
 for resultY in 0..<arrY {
 for resultX in 0..<arrX {
 for idx in 0..<count {
 result[resultY][resultX] += arr1[resultY][idx] * arr2[idx][resultX]
 }
 }
 }
 
 return result
 }
 */

/*
 문제 설명
 코니는 매일 다른 옷을 조합하여 입는것을 좋아합니다.
 
 예를 들어 코니가 가진 옷이 아래와 같고, 오늘 코니가 동그란 안경, 긴 코트, 파란색 티셔츠를 입었다면 다음날은 청바지를 추가로 입거나 동그란 안경 대신 검정 선글라스를 착용하거나 해야합니다.
 
 종류    이름
 얼굴    동그란 안경, 검정 선글라스
 상의    파란색 티셔츠
 하의    청바지
 겉옷    긴 코트
 코니는 각 종류별로 최대 1가지 의상만 착용할 수 있습니다. 예를 들어 위 예시의 경우 동그란 안경과 검정 선글라스를 동시에 착용할 수는 없습니다.
 착용한 의상의 일부가 겹치더라도, 다른 의상이 겹치지 않거나, 혹은 의상을 추가로 더 착용한 경우에는 서로 다른 방법으로 옷을 착용한 것으로 계산합니다.
 코니는 하루에 최소 한 개의 의상은 입습니다.
 코니가 가진 의상들이 담긴 2차원 배열 clothes가 주어질 때 서로 다른 옷의 조합의 수를 return 하도록 solution 함수를 작성해주세요.
 
 제한사항
 clothes의 각 행은 [의상의 이름, 의상의 종류]로 이루어져 있습니다.
 코니가 가진 의상의 수는 1개 이상 30개 이하입니다.
 같은 이름을 가진 의상은 존재하지 않습니다.
 clothes의 모든 원소는 문자열로 이루어져 있습니다.
 모든 문자열의 길이는 1 이상 20 이하인 자연수이고 알파벳 소문자 또는 '_' 로만 이루어져 있습니다.
 입출력 예
 clothes    return
 [["yellow_hat", "headgear"], ["blue_sunglasses", "eyewear"], ["green_turban", "headgear"]]    5
 [["crow_mask", "face"], ["blue_sunglasses", "face"], ["smoky_makeup", "face"]]    3
 입출력 예 설명
 예제 #1
 headgear에 해당하는 의상이 yellow_hat, green_turban이고 eyewear에 해당하는 의상이 blue_sunglasses이므로 아래와 같이 5개의 조합이 가능합니다.
 
 1. yellow_hat
 2. blue_sunglasses
 3. green_turban
 4. yellow_hat + blue_sunglasses
 5. green_turban + blue_sunglasses
 예제 #2
 face에 해당하는 의상이 crow_mask, blue_sunglasses, smoky_makeup이므로 아래와 같이 3개의 조합이 가능합니다.
 
 1. crow_mask
 2. blue_sunglasses
 3. smoky_makeup
 
 import Foundation
 
 func solution(_ clothes:[[String]]) -> Int {
 var clothesDic: [String: [String]] = [:]
 clothes.forEach {
 clothesDic[$0[1], default: []] += [$0[0]]
 }
 
 return clothesDic.reduce(1, { $0 * ($1.value.count + 1) }) - 1
 }
 */

/*
 문제 설명
 셀수있는 수량의 순서있는 열거 또는 어떤 순서를 따르는 요소들의 모음을 튜플(tuple)이라고 합니다. n개의 요소를 가진 튜플을 n-튜플(n-tuple)이라고 하며, 다음과 같이 표현할 수 있습니다.
 
 (a1, a2, a3, ..., an)
 튜플은 다음과 같은 성질을 가지고 있습니다.
 
 중복된 원소가 있을 수 있습니다. ex : (2, 3, 1, 2)
 원소에 정해진 순서가 있으며, 원소의 순서가 다르면 서로 다른 튜플입니다. ex : (1, 2, 3) ≠ (1, 3, 2)
 튜플의 원소 개수는 유한합니다.
 원소의 개수가 n개이고, 중복되는 원소가 없는 튜플 (a1, a2, a3, ..., an)이 주어질 때(단, a1, a2, ..., an은 자연수), 이는 다음과 같이 집합 기호 '{', '}'를 이용해 표현할 수 있습니다.
 
 {{a1}, {a1, a2}, {a1, a2, a3}, {a1, a2, a3, a4}, ... {a1, a2, a3, a4, ..., an}}
 예를 들어 튜플이 (2, 1, 3, 4)인 경우 이는
 
 {{2}, {2, 1}, {2, 1, 3}, {2, 1, 3, 4}}
 와 같이 표현할 수 있습니다. 이때, 집합은 원소의 순서가 바뀌어도 상관없으므로
 
 {{2}, {2, 1}, {2, 1, 3}, {2, 1, 3, 4}}
 {{2, 1, 3, 4}, {2}, {2, 1, 3}, {2, 1}}
 {{1, 2, 3}, {2, 1}, {1, 2, 4, 3}, {2}}
 는 모두 같은 튜플 (2, 1, 3, 4)를 나타냅니다.
 
 특정 튜플을 표현하는 집합이 담긴 문자열 s가 매개변수로 주어질 때, s가 표현하는 튜플을 배열에 담아 return 하도록 solution 함수를 완성해주세요.
 
 [제한사항]
 s의 길이는 5 이상 1,000,000 이하입니다.
 s는 숫자와 '{', '}', ',' 로만 이루어져 있습니다.
 숫자가 0으로 시작하는 경우는 없습니다.
 s는 항상 중복되는 원소가 없는 튜플을 올바르게 표현하고 있습니다.
 s가 표현하는 튜플의 원소는 1 이상 100,000 이하인 자연수입니다.
 return 하는 배열의 길이가 1 이상 500 이하인 경우만 입력으로 주어집니다.
 [입출력 예]
 s    result
 "{{2},{2,1},{2,1,3},{2,1,3,4}}"    [2, 1, 3, 4]
 "{{1,2,3},{2,1},{1,2,4,3},{2}}"    [2, 1, 3, 4]
 "{{20,111},{111}}"    [111, 20]
 "{{123}}"    [123]
 "{{4,2,3},{3},{2,3,4,1},{2,3}}"    [3, 2, 4, 1]
 입출력 예에 대한 설명
 입출력 예 #1
 문제 예시와 같습니다.
 
 입출력 예 #2
 문제 예시와 같습니다.
 
 입출력 예 #3
 (111, 20)을 집합 기호를 이용해 표현하면 {{111}, {111,20}}이 되며, 이는 {{20,111},{111}}과 같습니다.
 
 입출력 예 #4
 (123)을 집합 기호를 이용해 표현하면 {{123}} 입니다.
 
 입출력 예 #5
 (3, 2, 4, 1)을 집합 기호를 이용해 표현하면 {{3},{3,2},{3,2,4},{3,2,4,1}}이 되며, 이는 {{4,2,3},{3},{2,3,4,1},{2,3}}과 같습니다.
 
 import Foundation
 
 func solution(_ s:String) -> [Int] {
 var s = s
 .replacingOccurrences(of: "}}", with: "")
 .replacingOccurrences(of: "{{", with: "")
 .components(separatedBy: "},{").compactMap {String($0).split(separator: ",").compactMap{Int(String($0))}}
 
 s.sort(by: {$0.count < $1.count})
 
 var result = s.first ?? []
 
 
 s.forEach {
 // MARK: 중요 포인트
 //result += $0.compactMap{ result.contains($0) ? nil : $0 }
 // set에서 substract할 수 있음ㅊ
 result.append(Set($0).subtracting(result).first ?? 0)
 }
 
 return result
 }
 
 */

/*
 문제 설명
 프로그래머스 팀에서는 기능 개선 작업을 수행 중입니다. 각 기능은 진도가 100%일 때 서비스에 반영할 수 있습니다.
 
 또, 각 기능의 개발속도는 모두 다르기 때문에 뒤에 있는 기능이 앞에 있는 기능보다 먼저 개발될 수 있고, 이때 뒤에 있는 기능은 앞에 있는 기능이 배포될 때 함께 배포됩니다.
 
 먼저 배포되어야 하는 순서대로 작업의 진도가 적힌 정수 배열 progresses와 각 작업의 개발 속도가 적힌 정수 배열 speeds가 주어질 때 각 배포마다 몇 개의 기능이 배포되는지를 return 하도록 solution 함수를 완성하세요.
 
 제한 사항
 작업의 개수(progresses, speeds배열의 길이)는 100개 이하입니다.
 작업 진도는 100 미만의 자연수입니다.
 작업 속도는 100 이하의 자연수입니다.
 배포는 하루에 한 번만 할 수 있으며, 하루의 끝에 이루어진다고 가정합니다. 예를 들어 진도율이 95%인 작업의 개발 속도가 하루에 4%라면 배포는 2일 뒤에 이루어집니다.
 입출력 예
 progresses                  speeds                return
 [93, 30, 55]                [1, 30, 5]            [2, 1]
 [95, 90, 99, 99, 80, 99]    [1, 1, 1, 1, 1, 1]    [1, 3, 2]
 입출력 예 설명
 입출력 예 #1
 첫 번째 기능은 93% 완료되어 있고 하루에 1%씩 작업이 가능하므로 7일간 작업 후 배포가 가능합니다.
 두 번째 기능은 30%가 완료되어 있고 하루에 30%씩 작업이 가능하므로 3일간 작업 후 배포가 가능합니다. 하지만 이전 첫 번째 기능이 아직 완성된 상태가 아니기 때문에 첫 번째 기능이 배포되는 7일째 배포됩니다.
 세 번째 기능은 55%가 완료되어 있고 하루에 5%씩 작업이 가능하므로 9일간 작업 후 배포가 가능합니다.
 
 따라서 7일째에 2개의 기능, 9일째에 1개의 기능이 배포됩니다.
 
 입출력 예 #2
 모든 기능이 하루에 1%씩 작업이 가능하므로, 작업이 끝나기까지 남은 일수는 각각 5일, 10일, 1일, 1일, 20일, 1일입니다. 어떤 기능이 먼저 완성되었더라도 앞에 있는 모든 기능이 완성되지 않으면 배포가 불가능합니다.
 
 따라서 5일째에 1개의 기능, 10일째에 3개의 기능, 20일째에 2개의 기능이 배포됩니다.
 
 import Foundation
 
 func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
 
 //MARK: 중요 포인트
 var completedDay: [Int] = zip(progresses, speeds).map { progress, speed in
 let remainingProgress = 100 - progress
 let endDay = remainingProgress / speed
 
 return endDay + (remainingProgress % speed != 0 ? 1 : 0)
 }
 
 var maxDay = completedDay[0]
 var count = 0
 var result = [Int]()
 
 for idx in 0..<(completedDay.count - 1) {
 count += 1
 
 if maxDay < completedDay[idx+1] {
 maxDay = completedDay[idx+1]
 result.append(count)
 count = 0
 }
 }
 
 result.append(count+1)
 
 return result
 }
 */

/*
 뉴스 클러스터링
 여러 언론사에서 쏟아지는 뉴스, 특히 속보성 뉴스를 보면 비슷비슷한 제목의 기사가 많아 정작 필요한 기사를 찾기가 어렵다. Daum 뉴스의 개발 업무를 맡게 된 신입사원 튜브는 사용자들이 편리하게 다양한 뉴스를 찾아볼 수 있도록 문제점을 개선하는 업무를 맡게 되었다.
 
 개발의 방향을 잡기 위해 튜브는 우선 최근 화제가 되고 있는 "카카오 신입 개발자 공채" 관련 기사를 검색해보았다.
 
 카카오 첫 공채..'블라인드' 방식 채용
 카카오, 합병 후 첫 공채.. 블라인드 전형으로 개발자 채용
 카카오, 블라인드 전형으로 신입 개발자 공채
 카카오 공채, 신입 개발자 코딩 능력만 본다
 카카오, 신입 공채.. "코딩 실력만 본다"
 카카오 "코딩 능력만으로 2018 신입 개발자 뽑는다"
 기사의 제목을 기준으로 "블라인드 전형"에 주목하는 기사와 "코딩 테스트"에 주목하는 기사로 나뉘는 걸 발견했다. 튜브는 이들을 각각 묶어서 보여주면 카카오 공채 관련 기사를 찾아보는 사용자에게 유용할 듯싶었다.
 
 유사한 기사를 묶는 기준을 정하기 위해서 논문과 자료를 조사하던 튜브는 "자카드 유사도"라는 방법을 찾아냈다.
 
 자카드 유사도는 집합 간의 유사도를 검사하는 여러 방법 중의 하나로 알려져 있다. 두 집합 A, B 사이의 자카드 유사도 J(A, B)는 두 집합의 교집합 크기를 두 집합의 합집합 크기로 나눈 값으로 정의된다.
 
 예를 들어 집합 A = {1, 2, 3}, 집합 B = {2, 3, 4}라고 할 때, 교집합 A ∩ B = {2, 3}, 합집합 A ∪ B = {1, 2, 3, 4}이 되므로, 집합 A, B 사이의 자카드 유사도 J(A, B) = 2/4 = 0.5가 된다. 집합 A와 집합 B가 모두 공집합일 경우에는 나눗셈이 정의되지 않으니 따로 J(A, B) = 1로 정의한다.
 
 자카드 유사도는 원소의 중복을 허용하는 다중집합에 대해서 확장할 수 있다. 다중집합 A는 원소 "1"을 3개 가지고 있고, 다중집합 B는 원소 "1"을 5개 가지고 있다고 하자. 이 다중집합의 교집합 A ∩ B는 원소 "1"을 min(3, 5)인 3개, 합집합 A ∪ B는 원소 "1"을 max(3, 5)인 5개 가지게 된다. 다중집합 A = {1, 1, 2, 2, 3}, 다중집합 B = {1, 2, 2, 4, 5}라고 하면, 교집합 A ∩ B = {1, 2, 2}, 합집합 A ∪ B = {1, 1, 2, 2, 3, 4, 5}가 되므로, 자카드 유사도 J(A, B) = 3/7, 약 0.42가 된다.
 
 이를 이용하여 문자열 사이의 유사도를 계산하는데 이용할 수 있다. 문자열 "FRANCE"와 "FRENCH"가 주어졌을 때, 이를 두 글자씩 끊어서 다중집합을 만들 수 있다. 각각 {FR, RA, AN, NC, CE}, {FR, RE, EN, NC, CH}가 되며, 교집합은 {FR, NC}, 합집합은 {FR, RA, AN, NC, CE, RE, EN, CH}가 되므로, 두 문자열 사이의 자카드 유사도 J("FRANCE", "FRENCH") = 2/8 = 0.25가 된다.
 
 입력 형식
 입력으로는 str1과 str2의 두 문자열이 들어온다. 각 문자열의 길이는 2 이상, 1,000 이하이다.
 입력으로 들어온 문자열은 두 글자씩 끊어서 다중집합의 원소로 만든다. 이때 영문자로 된 글자 쌍만 유효하고, 기타 공백이나 숫자, 특수 문자가 들어있는 경우는 그 글자 쌍을 버린다. 예를 들어 "ab+"가 입력으로 들어오면, "ab"만 다중집합의 원소로 삼고, "b+"는 버린다.
 다중집합 원소 사이를 비교할 때, 대문자와 소문자의 차이는 무시한다. "AB"와 "Ab", "ab"는 같은 원소로 취급한다.
 출력 형식
 입력으로 들어온 두 문자열의 자카드 유사도를 출력한다. 유사도 값은 0에서 1 사이의 실수이므로, 이를 다루기 쉽도록 65536을 곱한 후에 소수점 아래를 버리고 정수부만 출력한다.
 
 예제 입출력
 str1    str2    answer
 FRANCE    french    16384
 handshake    shake hands    65536
 aa1+aa2    AAAA12    43690
 E=M*C^2    e=m*c^2    65536
 
 func solution(_ str1:String, _ str2:String) -> Int {
     var str1 = str1.lowercased()
     var str2 = str2.lowercased()
     if str1 == str2 { return 65536 }
     
     var arr1 = [String: Int]()
     var arr2 = [String: Int]()
     
     var uSetCount = 0.0
     var iSetCount = 0.0
     
     for index in 0..<str1.count - 1 {
         if str1[index]?.isLetter == true && str1[index+1]?.isLetter == true,
            let str = str1[index, index+1]{
             arr1[str, default: 0] += 1
             uSetCount += 1.0
         }
     }
     
     for index in 0..<str2.count - 1 {
         if str2[index]?.isLetter == true && str2[index+1]?.isLetter == true,
            let str = str2[index, index+1]{
             arr2[str, default: 0] += 1
             uSetCount += 1.0
         }
     }
     
     arr1.forEach {
         if let count2 = arr2[$0.key] {
             iSetCount += Double(min($0.value, count2))
         }
     }
     // MARK: 합집합 = A.count + B.count - 교집합
     // MARK: Set은 다중집합이 아님!!
     uSetCount -= iSetCount
     return Int((iSetCount / uSetCount) * 65536)
 }

 extension String {
     subscript(index: Int) -> Character? {
         guard index >= 0 && index < self.count else { return nil }
         return self[self.index(self.startIndex, offsetBy: index)]
     }
     
     subscript(start: Int, end: Int) -> String? {
         guard start >= 0 && end < self.count && start < end else { return nil }
         let startIndex = self.index(self.startIndex, offsetBy: start)
         let endIndex = self.index(self.startIndex, offsetBy: end)
         return String(self[startIndex...endIndex])
     }
 }
 
 */





/*
문제 설명
압축
신입사원 어피치는 카카오톡으로 전송되는 메시지를 압축하여 전송 효율을 높이는 업무를 맡게 되었다. 메시지를 압축하더라도 전달되는 정보가 바뀌어서는 안 되므로, 압축 전의 정보를 완벽하게 복원 가능한 무손실 압축 알고리즘을 구현하기로 했다.

어피치는 여러 압축 알고리즘 중에서 성능이 좋고 구현이 간단한 LZW(Lempel–Ziv–Welch) 압축을 구현하기로 했다. LZW 압축은 1983년 발표된 알고리즘으로, 이미지 파일 포맷인 GIF 등 다양한 응용에서 사용되었다.

LZW 압축은 다음 과정을 거친다.

길이가 1인 모든 단어를 포함하도록 사전을 초기화한다.
사전에서 현재 입력과 일치하는 가장 긴 문자열 w를 찾는다.
w에 해당하는 사전의 색인 번호를 출력하고, 입력에서 w를 제거한다.
입력에서 처리되지 않은 다음 글자가 남아있다면(c), w+c에 해당하는 단어를 사전에 등록한다.
단계 2로 돌아간다.
압축 알고리즘이 영문 대문자만 처리한다고 할 때, 사전은 다음과 같이 초기화된다. 사전의 색인 번호는 정수값으로 주어지며, 1부터 시작한다고 하자.

색인 번호    1    2    3    ...    24    25    26
단어        A    B    C    ...    X    Y    Z
예를 들어 입력으로 KAKAO가 들어온다고 하자.

현재 사전에는 KAKAO의 첫 글자 K는 등록되어 있으나, 두 번째 글자까지인 KA는 없으므로, 첫 글자 K에 해당하는 색인 번호 11을 출력하고, 다음 글자인 A를 포함한 KA를 사전에 27 번째로 등록한다.
두 번째 글자 A는 사전에 있으나, 세 번째 글자까지인 AK는 사전에 없으므로, A의 색인 번호 1을 출력하고, AK를 사전에 28 번째로 등록한다.
세 번째 글자에서 시작하는 KA가 사전에 있으므로, KA에 해당하는 색인 번호 27을 출력하고, 다음 글자 O를 포함한 KAO를 29 번째로 등록한다.
마지막으로 처리되지 않은 글자 O에 해당하는 색인 번호 15를 출력한다.
현재 입력(w)    다음 글자(c)    출력    사전 추가(w+c)
K    A    11    27: KA
A    K    1    28: AK
KA    O    27    29: KAO
O        15
이 과정을 거쳐 다섯 글자의 문장 KAKAO가 4개의 색인 번호 [11, 1, 27, 15]로 압축된다.

입력으로 TOBEORNOTTOBEORTOBEORNOT가 들어오면 다음과 같이 압축이 진행된다.

현재 입력(w)    다음 글자(c)    출력    사전 추가(w+c)
T    O    20    27: TO
O    B    15    28: OB
B    E    2    29: BE
E    O    5    30: EO
O    R    15    31: OR
R    N    18    32: RN
N    O    14    33: NO
O    T    15    34: OT
T    T    20    35: TT
TO    B    27    36: TOB
BE    O    29    37: BEO
OR    T    31    38: ORT
TOB    E    36    39: TOBE
EO    R    30    40: EOR
RN    O    32    41: RNO
OT        34
입력 형식
입력으로 영문 대문자로만 이뤄진 문자열 msg가 주어진다. msg의 길이는 1 글자 이상, 1000 글자 이하이다.

출력 형식
주어진 문자열을 압축한 후의 사전 색인 번호를 배열로 출력하라.

입출력 예제
msg    answer
KAKAO    [11, 1, 27, 15]
TOBEORNOTTOBEORTOBEORNOT    [20, 15, 2, 5, 15, 18, 14, 15, 20, 27, 29, 31, 36, 30, 32, 34]
ABABABABABABABAB    [1, 2, 27, 29, 28, 31, 30]
 
 func solution(_ msg:String) -> [Int] {
     var idx = 0
     var wordDic: [String: Int] = [:]
     //MARK: 중요 포인트
     "ABCDEFGHIJKLMNOPQRSTUVWXYZ".enumerated().forEach {
         wordDic[String($0.element), default: 0] = $0.offset + 1
     }
     for i in 0...25 {
         dictionary.append(String(Character(UnicodeScalar(65+i)!)))
     }
     

     
     var index = wordDic.count + 1
     var result = [Int]()
     while idx < msg.count {
         var add = 0
         for i in idx ..< msg.count {
             if let str = msg[idx, i] {
                 if let num = wordDic[str] {
                     add = num
                     if i == msg.count - 1 {
                         result.append(add)
                         return result
                     }
                 }
                 else {
                     result.append(add)
                     wordDic[str, default: 0] = index
                     index += 1
                     idx += str.count - 2
                     break
                 }
             }
         }
         idx += 1
     }
     return result
 }

 extension String {
     subscript(start: Int, end: Int) -> String? {
         guard 0 <= start && end < self.count && start <= end else { return nil }
         let start = self.index(self.startIndex, offsetBy: start)
         let end = self.index(self.startIndex, offsetBy: end)
         return String(self[start...end])
     }
 }
*/

/*
문제 설명
N진수 게임
튜브가 활동하는 코딩 동아리에서는 전통적으로 해오는 게임이 있다. 이 게임은 여러 사람이 둥글게 앉아서 숫자를 하나씩 차례대로 말하는 게임인데, 규칙은 다음과 같다.

숫자를 0부터 시작해서 차례대로 말한다. 첫 번째 사람은 0, 두 번째 사람은 1, … 열 번째 사람은 9를 말한다.
10 이상의 숫자부터는 한 자리씩 끊어서 말한다. 즉 열한 번째 사람은 10의 첫 자리인 1, 열두 번째 사람은 둘째 자리인 0을 말한다.
이렇게 게임을 진행할 경우,
0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 0, 1, 1, 1, 2, 1, 3, 1, 4, …
순으로 숫자를 말하면 된다.

한편 코딩 동아리 일원들은 컴퓨터를 다루는 사람답게 이진수로 이 게임을 진행하기도 하는데, 이 경우에는
0, 1, 1, 0, 1, 1, 1, 0, 0, 1, 0, 1, 1, 1, 0, 1, 1, 1, …
순으로 숫자를 말하면 된다.

이진수로 진행하는 게임에 익숙해져 질려가던 사람들은 좀 더 난이도를 높이기 위해 이진법에서 십육진법까지 모든 진법으로 게임을 진행해보기로 했다. 숫자 게임이 익숙하지 않은 튜브는 게임에 져서 벌칙을 받는 굴욕을 피하기 위해, 자신이 말해야 하는 숫자를 스마트폰에 미리 출력해주는 프로그램을 만들려고 한다. 튜브의 프로그램을 구현하라.

입력 형식
진법 n, 미리 구할 숫자의 갯수 t, 게임에 참가하는 인원 m, 튜브의 순서 p 가 주어진다.

2 ≦ n ≦ 16
0 ＜ t ≦ 1000
2 ≦ m ≦ 100
1 ≦ p ≦ m
출력 형식
튜브가 말해야 하는 숫자 t개를 공백 없이 차례대로 나타낸 문자열. 단, 10~15는 각각 대문자 A~F로 출력한다.

입출력 예제
n    t    m    p    result
2    4    2    1    "0111"
16    16    2    1    "02468ACE11111111"
16    16    2    2    "13579BDF01234567"
*/

/*
 뒤에 있는 큰 수 찾기
 문제 설명
 정수로 이루어진 배열 numbers가 있습니다. 배열 의 각 원소들에 대해 자신보다 뒤에 있는 숫자 중에서 자신보다 크면서 가장 가까이 있는 수를 뒷 큰수라고 합니다.
 정수 배열 numbers가 매개변수로 주어질 때, 모든 원소에 대한 뒷 큰수들을 차례로 담은 배열을 return 하도록 solution 함수를 완성해주세요. 단, 뒷 큰수가 존재하지 않는 원소는 -1을 담습니다.

 제한사항
 4 ≤ numbers의 길이 ≤ 1,000,000
 1 ≤ numbers[i] ≤ 1,000,000
 입출력 예
 numbers    result
 [2, 3, 3, 5]    [3, 5, 5, -1]
 [9, 1, 5, 3, 6, 2]    [-1, 5, 6, 6, -1, -1]
 입출력 예 설명
 입출력 예 #1
 2의 뒷 큰수는 3입니다. 첫 번째 3의 뒷 큰수는 5입니다. 두 번째 3 또한 마찬가지입니다. 5는 뒷 큰수가 없으므로 -1입니다. 위 수들을 차례대로 배열에 담으면 [3, 5, 5, -1]이 됩니다.

 입출력 예 #2
 9는 뒷 큰수가 없으므로 -1입니다. 1의 뒷 큰수는 5이며, 5와 3의 뒷 큰수는 6입니다. 6과 2는 뒷 큰수가 없으므로 -1입니다. 위 수들을 차례대로 배열에 담으면 [-1, 5, 6, 6, -1, -1]이 됩니다.
 

 func solution(_ numbers:[Int]) -> [Int] {
     var result = [Int]()
     var indexDic: [Int: Int] = [:]
     
     numbers.enumerated().forEach { offset, num in
         if let index = indexDic[num], offset < index {
             result.append(numbers[index])
         }
         else if let firstIndex = numbers[(offset+1)...].firstIndex(where: { $0 > num }) {
             indexDic[num, default: 0] = firstIndex
             result.append(numbers[firstIndex])
         }
         else {
             result.append(-1)
         }
     }
     
     return result
 }
 
 import Foundation

 func solution(_ numbers:[Int]) -> [Int] {
     var indexStack = [Int]()
     var result = [Int](repeating: -1, count: numbers.count)
     
     for index in numbers.indices {
         while indexStack.isEmpty == false,
               let lastIndex = indexStack.last,
               numbers[lastIndex] < numbers[index] {
             result[indexStack.popLast() ?? 0] = numbers[index]
         }
         
         indexStack.append(index)
     }
     
     return result
 }
 */
/*
 문제 설명
 문제 설명
 주차장의 요금표와 차량이 들어오고(입차) 나간(출차) 기록이 주어졌을 때, 차량별로 주차 요금을 계산하려고 합니다. 아래는 하나의 예시를 나타냅니다.

 요금표
 기본 시간(분)    기본 요금(원)    단위 시간(분)    단위 요금(원)
 180    5000    10    600
  

 입/출차 기록
 시각(시:분)    차량 번호    내역
 05:34    5961    입차
 06:00    0000    입차
 06:34    0000    출차
 07:59    5961    출차
 07:59    0148    입차
 18:59    0000    입차
 19:09    0148    출차
 22:59    5961    입차
 23:00    5961    출차
  

 자동차별 주차 요금
 차량 번호  누적 주차 시간(분)    주차 요금(원)
 0000    34 + 300 = 334      5000 + ⌈(334 - 180) / 10⌉ x 600 = 14600
 0148    670    5000 +⌈(670 - 180) / 10⌉x 600 = 34400
 5961    145 + 1 = 146    5000
 어떤 차량이 입차된 후에 출차된 내역이 없다면, 23:59에 출차된 것으로 간주합니다.
 0000번 차량은 18:59에 입차된 이후, 출차된 내역이 없습니다. 따라서, 23:59에 출차된 것으로 간주합니다.
 00:00부터 23:59까지의 입/출차 내역을 바탕으로 차량별 누적 주차 시간을 계산하여 요금을 일괄로 정산합니다.
 누적 주차 시간이 기본 시간이하라면, 기본 요금을 청구합니다.
 누적 주차 시간이 기본 시간을 초과하면, 기본 요금에 더해서, 초과한 시간에 대해서 단위 시간 마다 단위 요금을 청구합니다.
 초과한 시간이 단위 시간으로 나누어 떨어지지 않으면, 올림합니다.
 ⌈a⌉ : a보다 작지 않은 최소의 정수를 의미합니다. 즉, 올림을 의미합니다.
 주차 요금을 나타내는 정수 배열 fees, 자동차의 입/출차 내역을 나타내는 문자열 배열 records가 매개변수로 주어집니다. 차량 번호가 작은 자동차부터 청구할 주차 요금을 차례대로 정수 배열에 담아서 return 하도록 solution 함수를 완성해주세요.

 제한사항
 fees의 길이 = 4

 fees[0] = 기본 시간(분)
 1 ≤ fees[0] ≤ 1,439
 fees[1] = 기본 요금(원)
 0 ≤ fees[1] ≤ 100,000
 fees[2] = 단위 시간(분)
 1 ≤ fees[2] ≤ 1,439
 fees[3] = 단위 요금(원)
 1 ≤ fees[3] ≤ 10,000
 1 ≤ records의 길이 ≤ 1,000

 records의 각 원소는 "시각 차량번호 내역" 형식의 문자열입니다.
 시각, 차량번호, 내역은 하나의 공백으로 구분되어 있습니다.
 시각은 차량이 입차되거나 출차된 시각을 나타내며, HH:MM 형식의 길이 5인 문자열입니다.
 HH:MM은 00:00부터 23:59까지 주어집니다.
 잘못된 시각("25:22", "09:65" 등)은 입력으로 주어지지 않습니다.
 차량번호는 자동차를 구분하기 위한, `0'~'9'로 구성된 길이 4인 문자열입니다.
 내역은 길이 2 또는 3인 문자열로, IN 또는 OUT입니다. IN은 입차를, OUT은 출차를 의미합니다.
 records의 원소들은 시각을 기준으로 오름차순으로 정렬되어 주어집니다.
 records는 하루 동안의 입/출차된 기록만 담고 있으며, 입차된 차량이 다음날 출차되는 경우는 입력으로 주어지지 않습니다.
 같은 시각에, 같은 차량번호의 내역이 2번 이상 나타내지 않습니다.
 마지막 시각(23:59)에 입차되는 경우는 입력으로 주어지지 않습니다.
 아래의 예를 포함하여, 잘못된 입력은 주어지지 않습니다.
 주차장에 없는 차량이 출차되는 경우
 주차장에 이미 있는 차량(차량번호가 같은 차량)이 다시 입차되는 경우
 입출력 예
 fees    records    result
 [180, 5000, 10, 600]    ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"]    [14600, 34400, 5000]
 [120, 0, 60, 591]    ["16:00 3961 IN","16:00 0202 IN","18:00 3961 OUT","18:00 0202 OUT","23:58 3961 IN"]    [0, 591]
 [1, 461, 1, 10]    ["00:00 1234 IN"]    [14841]
 입출력 예 설명
 입출력 예 #1

 문제 예시와 같습니다.

 입출력 예 #2

 요금표
 기본 시간(분)    기본 요금(원)    단위 시간(분)    단위 요금(원)
 120    0    60    591
  

 입/출차 기록
 시각(시:분)    차량 번호    내역
 16:00    3961    입차
 16:00    0202    입차
 18:00    3961    출차
 18:00    0202    출차
 23:58    3961    입차
  

 자동차별 주차 요금
 차량 번호    누적 주차 시간(분)    주차 요금(원)
 0202    120    0
 3961    120 + 1 = 121    0 +⌈(121 - 120) / 60⌉x 591 = 591
 3961번 차량은 2번째 입차된 후에는 출차된 내역이 없으므로, 23:59에 출차되었다고 간주합니다.
  

 입출력 예 #3

 요금표
 기본 시간(분)    기본 요금(원)    단위 시간(분)    단위 요금(원)
 1              461    1    10
  

 입/출차 기록
 시각(시:분)    차량 번호    내역
 00:00    1234    입차
  

 자동차별 주차 요금
 차량 번호  누적 주차 시간(분)    주차 요금(원)
 1234    1439    461 +⌈(1439 - 1) / 1⌉x 10 = 14841
 1234번 차량은 출차 내역이 없으므로, 23:59에 출차되었다고 간주합니다.
 
 import Foundation


 func solution(_ fees:[Int], _ records:[String]) -> [Int] {
     var records = records.map { String($0).components(separatedBy: " ").map { String($0) } }
         .sorted(by: { ($0[1], $0[0]) < ($1[1], $1[0]) })
     var carRemainTimeDic: [String: Double] = [:]
     var result = [Int]()
     for i in records.indices {
         guard records[i][2] == "IN" else { continue }

         let carNum = records[i][1]
         let inTime = (records[i][0]).getMinutes()
         var outTime = ((i < records.count - 1 && records[i+1][2] == "OUT") ? records[i+1][0] : "23:59").getMinutes()
         
         let totalFee = outTime - inTime
         carRemainTimeDic[carNum, default: 0.0] += totalFee
     }
     return carRemainTimeDic.sorted(by: { $0.key < $1.key })
         .map {
             let subTime = ($0.value - Double(fees[0])) < 0 ? 0 : ($0.value - Double(fees[0]))
             return fees[1] + Int(ceil(subTime / Double(fees[2]))) * fees[3] }
 }

 extension String {
     func getMinutes() -> Double {
         let time = self.components(separatedBy: ":").compactMap{Int($0)}
         
         return Double((time[0])*60 + time[1])
     }
 }
 
 */




/*
문제 설명
게임 캐릭터를 4가지 명령어를 통해 움직이려 합니다. 명령어는 다음과 같습니다.

U: 위쪽으로 한 칸 가기

D: 아래쪽으로 한 칸 가기

R: 오른쪽으로 한 칸 가기

L: 왼쪽으로 한 칸 가기

캐릭터는 좌표평면의 (0, 0) 위치에서 시작합니다. 좌표평면의 경계는 왼쪽 위(-5, 5), 왼쪽 아래(-5, -5), 오른쪽 위(5, 5), 오른쪽 아래(5, -5)로 이루어져 있습니다.

방문길이1_qpp9l3.png

예를 들어, "ULURRDLLU"로 명령했다면

방문길이2_lezmdo.png

1번 명령어부터 7번 명령어까지 다음과 같이 움직입니다.
방문길이3_sootjd.png

8번 명령어부터 9번 명령어까지 다음과 같이 움직입니다.
방문길이4_hlpiej.png

이때, 우리는 게임 캐릭터가 지나간 길 중 캐릭터가 처음 걸어본 길의 길이를 구하려고 합니다. 예를 들어 위의 예시에서 게임 캐릭터가 움직인 길이는 9이지만, 캐릭터가 처음 걸어본 길의 길이는 7이 됩니다. (8, 9번 명령어에서 움직인 길은 2, 3번 명령어에서 이미 거쳐 간 길입니다)

단, 좌표평면의 경계를 넘어가는 명령어는 무시합니다.

예를 들어, "LULLLLLLU"로 명령했다면

방문길이5_nitjwj.png

1번 명령어부터 6번 명령어대로 움직인 후, 7, 8번 명령어는 무시합니다. 다시 9번 명령어대로 움직입니다.
방문길이6_nzhumd.png

이때 캐릭터가 처음 걸어본 길의 길이는 7이 됩니다.

명령어가 매개변수 dirs로 주어질 때, 게임 캐릭터가 처음 걸어본 길의 길이를 구하여 return 하는 solution 함수를 완성해 주세요.

제한사항
dirs는 string형으로 주어지며, 'U', 'D', 'R', 'L' 이외에 문자는 주어지지 않습니다.
dirs의 길이는 500 이하의 자연수입니다.
입출력 예
dirs    answer
"ULURRDLLU"    7
"LULLLLLLU"    7
 
 import Foundation

 func solution(_ dirs:String) -> Int {
     let movingDic:[Character: [Int]] = [
         "U" : [0,-1],
         "D" : [0, 1],
         "L" : [-1,0],
         "R" : [1, 0]
             
     ]
     var road: Set<String> = []
     var currentPosition = [0, 0]
     var movePosition = [0, 0]
     
     for (idx, move) in dirs.enumerated() {
         guard let moving = movingDic[move] else { continue }
         
         currentPosition = movePosition
         movePosition = [currentPosition[0] + moving[0], currentPosition[1] + moving[1]]
         
         if (-5 <= movePosition[0] && movePosition[0] <= 5) && (-5 <= movePosition[1] && movePosition[1] <= 5) {
             let curent = currentPosition.map{String($0)}.joined()
             let move = movePosition.map{String($0)}.joined()
             road.insert(curent < move ? curent+move : move+curent)
         }
         else {
             movePosition = currentPosition
         }
     }
     
     return road.count
 }
*/

/*
 집에서 시간을 보내던 오영식은 박성원의 부름을 받고 급히 달려왔다. 박성원이 캠프 때 쓸 N개의 랜선을 만들어야 하는데 너무 바빠서 영식이에게 도움을 청했다.

 이미 오영식은 자체적으로 K개의 랜선을 가지고 있다. 그러나 K개의 랜선은 길이가 제각각이다. 박성원은 랜선을 모두 N개의 같은 길이의 랜선으로 만들고 싶었기 때문에 K개의 랜선을 잘라서 만들어야 한다. 예를 들어 300cm 짜리 랜선에서 140cm 짜리 랜선을 두 개 잘라내면 20cm는 버려야 한다. (이미 자른 랜선은 붙일 수 없다.)

 편의를 위해 랜선을 자르거나 만들 때 손실되는 길이는 없다고 가정하며, 기존의 K개의 랜선으로 N개의 랜선을 만들 수 없는 경우는 없다고 가정하자. 그리고 자를 때는 항상 센티미터 단위로 정수길이만큼 자른다고 가정하자. N개보다 많이 만드는 것도 N개를 만드는 것에 포함된다. 이때 만들 수 있는 최대 랜선의 길이를 구하는 프로그램을 작성하시오.

 ## 입력

 첫째 줄에는 오영식이 이미 가지고 있는 랜선의 개수 K, 그리고 필요한 랜선의 개수 N이 입력된다. K는 1이상 10,000이하의 정수이고, N은 1이상 1,000,000이하의 정수이다. 그리고 항상 K ≦ N 이다. 그 후 K줄에 걸쳐 이미 가지고 있는 각 랜선의 길이가 센티미터 단위의 정수로 입력된다. 랜선의 길이는 231-1보다 작거나 같은 자연수이다.

 ## 출력

 첫째 줄에 N개를 만들 수 있는 랜선의 최대 길이를 센티미터 단위의 정수로 출력한다.
 
 4 11
 802
 743
 457
 539
 
 200
 
 func solution() -> Int {
     var lines = [802, 743, 457, 539].sorted(by: >)
     var k = 11
     
     var minNum = 1
     var maxNum = lines.first ?? 0
     
     
     while minNum <= maxNum {
         var result = 0
         var midNum = (maxNum + minNum) / 2
         for line in lines {
             result += line / midNum
             if k <= result {break}
         }
         print("past min: \(minNum), max: \(maxNum), mid: \(midNum), result = \(result)")
         
         if k <= result {
             minNum = midNum + 1
         }
         else {
             maxNum = midNum - 1
         }
         print("current min: \(minNum), max: \(maxNum)")
         
     }
     
     return maxNum
     
 }

 print(solution())
 */


/*
 
도현이의 집 N개가 수직선 위에 있다. 각각의 집의 좌표는 x1, ..., xN이고, 집 여러개가 같은 좌표를 가지는 일은 없다.

도현이는 언제 어디서나 와이파이를 즐기기 위해서 집에 공유기 C개를 설치하려고 한다. 최대한 많은 곳에서 와이파이를 사용하려고 하기 때문에, 한 집에는 공유기를 하나만 설치할 수 있고, 가장 인접한 두 공유기 사이의 거리를 가능한 크게 하여 설치하려고 한다.

C개의 공유기를 N개의 집에 적당히 설치해서, 가장 인접한 두 공유기 사이의 거리를 최대로 하는 프로그램을 작성하시오.
 
 
 첫째 줄에 집의 개수 N (2 ≤ N ≤ 200,000)과 공유기의 개수 C (2 ≤ C ≤ N)이 하나 이상의 빈 칸을 사이에 두고 주어진다. 둘째 줄부터 N개의 줄에는 집의 좌표를 나타내는 xi (0 ≤ xi ≤ 1,000,000,000)가 한 줄에 하나씩 주어진다.
 
 공유기를 1, 4, 8 또는 1, 4, 9에 설치하면 가장 인접한 두 공유기 사이의 거리는 3이고, 이 거리보다 크게 공유기를 3개 설치할 수 없다.
 
 5 3
 1
 2
 8
 4
 9

 1 2 0 4 0 0 0 0 8 9
 
 3
 
 1) 맨 오른쪽과 왼쪽에 공유기를 설치해야 함 (C == 2 라면 큰 수 - 작은 수가 정답)
 
*/

/*
 세준이는 크기가 N×N인 배열 A를 만들었다. 배열에 들어있는 수 A[i][j] = i×j 이다. 이 수를 일차원 배열 B에 넣으면 B의 크기는 N×N이 된다. B를 오름차순 정렬했을 때, B[k]를 구해보자.

 배열 A와 B의 인덱스는 1부터 시작한다.

 입력
 첫째 줄에 배열의 크기 N이 주어진다. N은 105보다 작거나 같은 자연수이다. 둘째 줄에 k가 주어진다. k는 min(109, N2)보다 작거나 같은 자연수이다.

 출력
 B[k]를 출력한다.
 
 3
 7
 
 6
 
 //MARK: - 중요포인트
  수학적인 공식을 이용해 문제를 분해해보자
 import Foundation

 func solution() -> Int {
     let N = 3//Int(readLine()!)!
     let k = 7//Int(readLine()!)!
     
     var minNum = 1
     var maxNum = N*N
     
     while minNum <= maxNum {
         var count = 0
         let midIdx = (minNum + maxNum) / 2
         for idx in 1...N {
             count += min(midIdx/idx, N)
             if count >= k { break }
         }
         if count >= k {
             maxNum = midIdx - 1
         }
         else {
             minNum = midIdx + 1
         }
     }
     return minNum
 }

 */

/*
문제 설명
땅따먹기 게임을 하려고 합니다. 땅따먹기 게임의 땅(land)은 총 N행 4열로 이루어져 있고, 모든 칸에는 점수가 쓰여 있습니다. 1행부터 땅을 밟으며 한 행씩 내려올 때, 각 행의 4칸 중 한 칸만 밟으면서 내려와야 합니다. 단, 땅따먹기 게임에는 한 행씩 내려올 때, 같은 열을 연속해서 밟을 수 없는 특수 규칙이 있습니다.

예를 들면,

| 1 | 2 | 3 | 5 |

| 5 | 6 | 7 | 8 |

| 4 | 3 | 2 | 1 |

로 땅이 주어졌다면, 1행에서 네번째 칸 (5)를 밟았으면, 2행의 네번째 칸 (8)은 밟을 수 없습니다.

마지막 행까지 모두 내려왔을 때, 얻을 수 있는 점수의 최대값을 return하는 solution 함수를 완성해 주세요. 위 예의 경우, 1행의 네번째 칸 (5), 2행의 세번째 칸 (7), 3행의 첫번째 칸 (4) 땅을 밟아 16점이 최고점이 되므로 16을 return 하면 됩니다.

제한사항
행의 개수 N : 100,000 이하의 자연수
열의 개수는 4개이고, 땅(land)은 2차원 배열로 주어집니다.
점수 : 100 이하의 자연수
입출력 예
land    answer
[[1,2,3,5],[5,6,7,8],[4,3,2,1]]    16

 
 import Foundation

 func solution(_ land:[[Int]]) -> Int{
     var land = land
     var answer = 0
     for rowIndex in 1..<land.count {
         var row = land[rowIndex-1]
         land[rowIndex][0] += max(row[1], max(row[2], row[3]))
         land[rowIndex][1] += max(row[0], max(row[2], row[3]))
         land[rowIndex][2] += max(row[0], max(row[1], row[3]))
         land[rowIndex][3] += max(row[0], max(row[1], row[2]))
     }
     return land.last?.max() ?? 0
 }
*/

/*
 롤케이크 자르기
 
 철수는 롤케이크를 두 조각으로 잘라서 동생과 한 조각씩 나눠 먹으려고 합니다. 이 롤케이크에는 여러가지 토핑들이 일렬로 올려져 있습니다. 철수와 동생은 롤케이크를 공평하게 나눠먹으려 하는데, 그들은 롤케이크의 크기보다 롤케이크 위에 올려진 토핑들의 종류에 더 관심이 많습니다. 그래서 잘린 조각들의 크기와 올려진 토핑의 개수에 상관없이 각 조각에 동일한 가짓수의 토핑이 올라가면 공평하게 롤케이크가 나누어진 것으로 생각합니다.

 예를 들어, 롤케이크에 4가지 종류의 토핑이 올려져 있다고 합시다. 토핑들을 1, 2, 3, 4와 같이 번호로 표시했을 때, 케이크 위에 토핑들이 [1, 2, 1, 3, 1, 4, 1, 2] 순서로 올려져 있습니다. 만약 세 번째 토핑(1)과 네 번째 토핑(3) 사이를 자르면 롤케이크의 토핑은 [1, 2, 1], [3, 1, 4, 1, 2]로 나뉘게 됩니다. 철수가 [1, 2, 1]이 놓인 조각을, 동생이 [3, 1, 4, 1, 2]가 놓인 조각을 먹게 되면 철수는 두 가지 토핑(1, 2)을 맛볼 수 있지만, 동생은 네 가지 토핑(1, 2, 3, 4)을 맛볼 수 있으므로, 이는 공평하게 나누어진 것이 아닙니다. 만약 롤케이크의 네 번째 토핑(3)과 다섯 번째 토핑(1) 사이를 자르면 [1, 2, 1, 3], [1, 4, 1, 2]로 나뉘게 됩니다. 이 경우 철수는 세 가지 토핑(1, 2, 3)을, 동생도 세 가지 토핑(1, 2, 4)을 맛볼 수 있으므로, 이는 공평하게 나누어진 것입니다. 공평하게 롤케이크를 자르는 방법은 여러가지 일 수 있습니다. 위의 롤케이크를 [1, 2, 1, 3, 1], [4, 1, 2]으로 잘라도 공평하게 나뉩니다. 어떤 경우에는 롤케이크를 공평하게 나누지 못할 수도 있습니다.

 롤케이크에 올려진 토핑들의 번호를 저장한 정수 배열 topping이 매개변수로 주어질 때, 롤케이크를 공평하게 자르는 방법의 수를 return 하도록 solution 함수를 완성해주세요.

 제한사항
 1 ≤ topping의 길이 ≤ 1,000,000
 1 ≤ topping의 원소 ≤ 10,000
 입출력 예
 topping                     result
 [1, 2, 1, 3, 1, 4, 1, 2]    2
 [1, 2, 3, 1, 4]             0
 
 
 입출력 예 #1
 롤케이크를 [1, 2, 1, 3], [1, 4, 1, 2] 또는 [1, 2, 1, 3, 1], [4, 1, 2]와 같이 자르면 철수와 동생은 각각 세 가지 토핑을 맛볼 수 있습니다. 이 경우 공평하게 롤케이크를 나누는 방법은 위의 두 가지만 존재합니다.
 
 입출력 예 #2
 롤케이크를 공평하게 나눌 수 없습니다.
 
 import Foundation

 func solution(_ topping:[Int]) -> Int {
     var leftDic = [Int: Int]()
     var rightDic = [Int: Int]()
     
     topping.forEach { rightDic[$0, default: 0] += 1 }
     
     var result = 0
     
     topping.forEach { topping in
         leftDic[topping, default: 0] += 1
         rightDic[topping, default: 1] -= 1
         
         //MARK: (rightDic[topping] = nil) == (rightDic.removeValue(forKey: topping))
         if rightDic[topping] == 0 { rightDic.removeValue(forKey: topping) }
         
         var leftItemCount = leftDic.keys.count
         var rightItemCount = rightDic.keys.count
         
         if leftItemCount == rightItemCount { result += 1 }
     }
     return result
 }
 */




/*
 문제 설명
 선행 스킬이란 어떤 스킬을 배우기 전에 먼저 배워야 하는 스킬을 뜻합니다.

 예를 들어 선행 스킬 순서가 스파크 → 라이트닝 볼트 → 썬더일때, 썬더를 배우려면 먼저 라이트닝 볼트를 배워야 하고, 라이트닝 볼트를 배우려면 먼저 스파크를 배워야 합니다.

 위 순서에 없는 다른 스킬(힐링 등)은 순서에 상관없이 배울 수 있습니다. 따라서 스파크 → 힐링 → 라이트닝 볼트 → 썬더와 같은 스킬트리는 가능하지만, 썬더 → 스파크나 라이트닝 볼트 → 스파크 → 힐링 → 썬더와 같은 스킬트리는 불가능합니다.

 선행 스킬 순서 skill과 유저들이 만든 스킬트리1를 담은 배열 skill_trees가 매개변수로 주어질 때, 가능한 스킬트리 개수를 return 하는 solution 함수를 작성해주세요.

 제한 조건
 스킬은 알파벳 대문자로 표기하며, 모든 문자열은 알파벳 대문자로만 이루어져 있습니다.
 스킬 순서와 스킬트리는 문자열로 표기합니다.
 예를 들어, C → B → D 라면 "CBD"로 표기합니다
 선행 스킬 순서 skill의 길이는 1 이상 26 이하이며, 스킬은 중복해 주어지지 않습니다.
 skill_trees는 길이 1 이상 20 이하인 배열입니다.
 skill_trees의 원소는 스킬을 나타내는 문자열입니다.
 skill_trees의 원소는 길이가 2 이상 26 이하인 문자열이며, 스킬이 중복해 주어지지 않습니다.
 입출력 예
 skill    skill_trees    return
 "CBD"    ["BACDE", "CBADF", "AECB", "BDA"]    2
 입출력 예 설명
 "BACDE": B 스킬을 배우기 전에 C 스킬을 먼저 배워야 합니다. 불가능한 스킬트립니다.
 "CBADF": 가능한 스킬트리입니다.
 "AECB": 가능한 스킬트리입니다.
 "BDA": B 스킬을 배우기 전에 C 스킬을 먼저 배워야 합니다. 불가능한 스킬트리입니다.
 
 import Foundation

 func solution(_ skill:String, _ skill_trees:[String]) -> Int {
     var result = 0
     for skill_tree in skill_trees {
         // MARK: - 나머지 다 빼고 prefix하기
         // skill_tree.filter { word in skill.contains(where: {$0 == word} )}.map{String($0)}.joined()
         // MARK: - 이거 꼭 보기
         // skill.starts(with: skill_tree.filter { word in skill.contains(word)})
         if skill.hasPrefix(skill_tree.filter { word in skill.contains(where: {$0 == word} )}.map{String($0)}.joined()) {
             result += 1
         }
         
     }
     return result
 }
 */
/*
 오픈채팅방
 카카오톡 오픈채팅방에서는 친구가 아닌 사람들과 대화를 할 수 있는데, 본래 닉네임이 아닌 가상의 닉네임을 사용하여 채팅방에 들어갈 수 있다.

 신입사원인 김크루는 카카오톡 오픈 채팅방을 개설한 사람을 위해, 다양한 사람들이 들어오고, 나가는 것을 지켜볼 수 있는 관리자창을 만들기로 했다. 채팅방에 누군가 들어오면 다음 메시지가 출력된다.

 "[닉네임]님이 들어왔습니다."

 채팅방에서 누군가 나가면 다음 메시지가 출력된다.

 "[닉네임]님이 나갔습니다."

 채팅방에서 닉네임을 변경하는 방법은 다음과 같이 두 가지이다.

 채팅방을 나간 후, 새로운 닉네임으로 다시 들어간다.
 채팅방에서 닉네임을 변경한다.
 닉네임을 변경할 때는 기존에 채팅방에 출력되어 있던 메시지의 닉네임도 전부 변경된다.

 예를 들어, 채팅방에 "Muzi"와 "Prodo"라는 닉네임을 사용하는 사람이 순서대로 들어오면 채팅방에는 다음과 같이 메시지가 출력된다.

 "Muzi님이 들어왔습니다."
 "Prodo님이 들어왔습니다."

 채팅방에 있던 사람이 나가면 채팅방에는 다음과 같이 메시지가 남는다.

 "Muzi님이 들어왔습니다."
 "Prodo님이 들어왔습니다."
 "Muzi님이 나갔습니다."

 Muzi가 나간후 다시 들어올 때, Prodo 라는 닉네임으로 들어올 경우 기존에 채팅방에 남아있던 Muzi도 Prodo로 다음과 같이 변경된다.

 "Prodo님이 들어왔습니다."
 "Prodo님이 들어왔습니다."
 "Prodo님이 나갔습니다."
 "Prodo님이 들어왔습니다."

 채팅방은 중복 닉네임을 허용하기 때문에, 현재 채팅방에는 Prodo라는 닉네임을 사용하는 사람이 두 명이 있다. 이제, 채팅방에 두 번째로 들어왔던 Prodo가 Ryan으로 닉네임을 변경하면 채팅방 메시지는 다음과 같이 변경된다.

 "Prodo님이 들어왔습니다."
 "Ryan님이 들어왔습니다."
 "Prodo님이 나갔습니다."
 "Prodo님이 들어왔습니다."

 채팅방에 들어오고 나가거나, 닉네임을 변경한 기록이 담긴 문자열 배열 record가 매개변수로 주어질 때, 모든 기록이 처리된 후, 최종적으로 방을 개설한 사람이 보게 되는 메시지를 문자열 배열 형태로 return 하도록 solution 함수를 완성하라.

 제한사항
 record는 다음과 같은 문자열이 담긴 배열이며, 길이는 1 이상 100,000 이하이다.
 다음은 record에 담긴 문자열에 대한 설명이다.
 모든 유저는 [유저 아이디]로 구분한다.
 [유저 아이디] 사용자가 [닉네임]으로 채팅방에 입장 - "Enter [유저 아이디] [닉네임]" (ex. "Enter uid1234 Muzi")
 [유저 아이디] 사용자가 채팅방에서 퇴장 - "Leave [유저 아이디]" (ex. "Leave uid1234")
 [유저 아이디] 사용자가 닉네임을 [닉네임]으로 변경 - "Change [유저 아이디] [닉네임]" (ex. "Change uid1234 Muzi")
 첫 단어는 Enter, Leave, Change 중 하나이다.
 각 단어는 공백으로 구분되어 있으며, 알파벳 대문자, 소문자, 숫자로만 이루어져있다.
 유저 아이디와 닉네임은 알파벳 대문자, 소문자를 구별한다.
 유저 아이디와 닉네임의 길이는 1 이상 10 이하이다.
 채팅방에서 나간 유저가 닉네임을 변경하는 등 잘못 된 입력은 주어지지 않는다.
 입출력 예
 record    result
 ["Enter uid1234 Muzi", "Enter uid4567 Prodo","Leave uid1234","Enter uid1234 Prodo","Change uid4567 Ryan"]    ["Prodo님이 들어왔습니다.", "Ryan님이 들어왔습니다.", "Prodo님이 나갔습니다.", "Prodo님이 들어왔습니다."]
 입출력 예 설명
 입출력 예 #1
 문제의 설명과 같다.
 
 import Foundation

 func solution(_ record:[String]) -> [String] {
     var userDic = [String: String]()
     var record = record.map {String($0).components(separatedBy: " ").map{String($0)}}
     
     record.filter({$0.count == 3}).forEach{ userDic[$0[1], default: ""] = $0[2]}
     
     return record
         .filter({$0[0] != "Change"})
         .map { "\(userDic[$0[1], default: ""])님이 \($0[0] == "Enter" ? "들어왔습니다." : "나갔습니다.")" }
 }
 */

/*
 파일명 정렬
 세 차례의 코딩 테스트와 두 차례의 면접이라는 기나긴 블라인드 공채를 무사히 통과해 카카오에 입사한 무지는 파일 저장소 서버 관리를 맡게 되었다.

 저장소 서버에는 프로그램의 과거 버전을 모두 담고 있어, 이름 순으로 정렬된 파일 목록은 보기가 불편했다. 파일을 이름 순으로 정렬하면 나중에 만들어진 ver-10.zip이 ver-9.zip보다 먼저 표시되기 때문이다.

 버전 번호 외에도 숫자가 포함된 파일 목록은 여러 면에서 관리하기 불편했다. 예컨대 파일 목록이 ["img12.png", "img10.png", "img2.png", "img1.png"]일 경우, 일반적인 정렬은 ["img1.png", "img10.png", "img12.png", "img2.png"] 순이 되지만, 숫자 순으로 정렬된 ["img1.png", "img2.png", "img10.png", img12.png"] 순이 훨씬 자연스럽다.

 무지는 단순한 문자 코드 순이 아닌, 파일명에 포함된 숫자를 반영한 정렬 기능을 저장소 관리 프로그램에 구현하기로 했다.

 소스 파일 저장소에 저장된 파일명은 100 글자 이내로, 영문 대소문자, 숫자, 공백(" "), 마침표("."), 빼기 부호("-")만으로 이루어져 있다. 파일명은 영문자로 시작하며, 숫자를 하나 이상 포함하고 있다.

 파일명은 크게 HEAD, NUMBER, TAIL의 세 부분으로 구성된다.

 HEAD는 숫자가 아닌 문자로 이루어져 있으며, 최소한 한 글자 이상이다.
 NUMBER는 한 글자에서 최대 다섯 글자 사이의 연속된 숫자로 이루어져 있으며, 앞쪽에 0이 올 수 있다. 0부터 99999 사이의 숫자로, 00000이나 0101 등도 가능하다.
 TAIL은 그 나머지 부분으로, 여기에는 숫자가 다시 나타날 수도 있으며, 아무 글자도 없을 수 있다.
 
 파일명                HEAD    NUMBER    TAIL
 foo9.txt            foo     9.        .txt
 foo010bar020.zip    foo     010       bar020.zip
 F-15                F-      15        (빈 문자열)
 
 파일명을 세 부분으로 나눈 후, 다음 기준에 따라 파일명을 정렬한다.

 파일명은 우선 HEAD 부분을 기준으로 사전 순으로 정렬한다. 이때, 문자열 비교 시 대소문자 구분을 하지 않는다. MUZI와 muzi, MuZi는 정렬 시에 같은 순서로 취급된다.
 파일명의 HEAD 부분이 대소문자 차이 외에는 같을 경우, NUMBER의 숫자 순으로 정렬한다. 9 < 10 < 0011 < 012 < 13 < 014 순으로 정렬된다. 숫자 앞의 0은 무시되며, 012와 12는 정렬 시에 같은 같은 값으로 처리된다.
 두 파일의 HEAD 부분과, NUMBER의 숫자도 같을 경우, 원래 입력에 주어진 순서를 유지한다. MUZI01.zip과 muzi1.png가 입력으로 들어오면, 정렬 후에도 입력 시 주어진 두 파일의 순서가 바뀌어서는 안 된다.
 무지를 도와 파일명 정렬 프로그램을 구현하라.

 입력 형식
 입력으로 배열 files가 주어진다.

 files는 1000 개 이하의 파일명을 포함하는 문자열 배열이다.
 각 파일명은 100 글자 이하 길이로, 영문 대소문자, 숫자, 공백(" "), 마침표("."), 빼기 부호("-")만으로 이루어져 있다. 파일명은 영문자로 시작하며, 숫자를 하나 이상 포함하고 있다.
 중복된 파일명은 없으나, 대소문자나 숫자 앞부분의 0 차이가 있는 경우는 함께 주어질 수 있다. (muzi1.txt, MUZI1.txt, muzi001.txt, muzi1.TXT는 함께 입력으로 주어질 수 있다.)
 출력 형식
 위 기준에 따라 정렬된 배열을 출력한다.

 입출력 예제
 입력: ["img12.png", "img10.png", "img02.png", "img1.png", "IMG01.GIF", "img2.JPG"]
 출력: ["img1.png", "IMG01.GIF", "img02.png", "img2.JPG", "img10.png", "img12.png"]

 입력: ["F-5 Freedom Fighter", "B-50 Superfortress", "A-10 Thunderbolt II", "F-14 Tomcat"]
 출력: ["A-10 Thunderbolt II", "B-50 Superfortress", "F-5 Freedom Fighter", "F-14 Tomcat"]
 
 func solution(_ files:[String]) -> [String] {
     var splitFiles = [[String]]()
     
     for fileName in files {
         var head = "", number = "", tail = ""
         var headIdx = -1
         for (idx, item) in fileName.enumerated() {
             if item.isNumber {
                 headIdx = idx
                 break
             }
         }
         
         var split = fileName[headIdx]
         head = split[0]
         headIdx = -1
         var count = 0
         for (idx, item) in split[1].enumerated() {
             print(idx, item, count, split[1])
             //MARK: .은 isLetter로 구분 못함
             if item.isNumber == false || count == 5 {
                 headIdx = idx
                 break
             }
             count += 1
         }
         
         split = split[1][headIdx]
         number = split[0]
         tail = split.count == 1 ? "" : split[1]
         
         splitFiles.append([head, number, tail])
     }

     splitFiles.sort(by: {($0[0].lowercased(), Int($0[1]) ?? 0) < ($1[0].lowercased(), Int($1[1]) ?? 1)})
     
     return splitFiles.map { $0.joined() }
 }

 extension String {
     subscript(idx: Int) -> [String] {
         guard 0 <= idx, idx < self.count else { return [self] }
         return [
             String(self[...self.index(self.startIndex, offsetBy: idx-1)]),
             String(self[self.index(self.startIndex, offsetBy: idx)...])]
     }
     
     //MARK: - 이거 기억하자!
     var numeric: ClosedRange<Character> { return "0"..."9" }
     var head: String{
     //MARK: - prefix에 조건 걸어보기
         return self.prefix { numeric.contains($0) == false }.uppercased()
     }
     var number: Int {
         //MARK: - drop으로 앞 문장 버리기
         return Int( self.drop   { numeric.contains($0) == false}
                         .prefix { numeric.contains($0) == true })!
     }
 }

 */

/*
 택배상자
 
 문제 설명
 영재는 택배상자를 트럭에 싣는 일을 합니다. 영재가 실어야 하는 택배상자는 크기가 모두 같으며 1번 상자부터 n번 상자까지 번호가 증가하는 순서대로 컨테이너 벨트에 일렬로 놓여 영재에게 전달됩니다. 컨테이너 벨트는 한 방향으로만 진행이 가능해서 벨트에 놓인 순서대로(1번 상자부터) 상자를 내릴 수 있습니다. 하지만 컨테이너 벨트에 놓인 순서대로 택배상자를 내려 바로 트럭에 싣게 되면 택배 기사님이 배달하는 순서와 택배상자가 실려 있는 순서가 맞지 않아 배달에 차질이 생깁니다. 따라서 택배 기사님이 미리 알려준 순서에 맞게 영재가 택배상자를 실어야 합니다.

 만약 컨테이너 벨트의 맨 앞에 놓인 상자가 현재 트럭에 실어야 하는 순서가 아니라면 그 상자를 트럭에 실을 순서가 될 때까지 잠시 다른 곳에 보관해야 합니다. 하지만 고객의 물건을 함부로 땅에 둘 수 없어 보조 컨테이너 벨트를 추가로 설치하였습니다. 보조 컨테이너 벨트는 앞 뒤로 이동이 가능하지만 입구 외에 다른 면이 막혀 있어서 맨 앞의 상자만 뺄 수 있습니다(즉, 가장 마지막에 보조 컨테이너 벨트에 보관한 상자부터 꺼내게 됩니다). 보조 컨테이너 벨트를 이용해도 기사님이 원하는 순서대로 상자를 싣지 못 한다면, 더 이상 상자를 싣지 않습니다.

 예를 들어, 영재가 5개의 상자를 실어야 하며, 택배 기사님이 알려준 순서가 기존의 컨테이너 벨트에 네 번째, 세 번째, 첫 번째, 두 번째, 다섯 번째 놓인 택배상자 순서인 경우, 영재는 우선 첫 번째, 두 번째, 세 번째 상자를 보조 컨테이너 벨트에 보관합니다. 그 후 네 번째 상자를 트럭에 싣고 보조 컨테이너 벨트에서 세 번째 상자 빼서 트럭에싣습니다. 다음으로 첫 번째 상자를 실어야 하지만 보조 컨테이너 벨트에서는 두 번째 상자를, 기존의 컨테이너 벨트에는 다섯 번째 상자를 꺼낼 수 있기 때문에 더이상의 상자는 실을 수 없습니다. 따라서 트럭에는 2개의 상자만 실리게 됩니다.

 택배 기사님이 원하는 상자 순서를 나타내는 정수 배열 order가 주어졌을 때, 영재가 몇 개의 상자를 실을 수 있는지 return 하는 solution 함수를 완성하세요.

 제한사항
 1 ≤ order의 길이 ≤ 1,000,000
 order는 1이상 order의 길이 이하의 모든 정수가 한번씩 등장합니다.
 order[i]는 기존의 컨테이너 벨트에 order[i]번째 상자를 i+1번째로 트럭에 실어야 함을 의미합니다.
 입출력 예
 order    result
 [4, 3, 1, 2, 5]    2
 [5, 4, 3, 2, 1]    5
 입출력 예 설명
 입출력 예 #1

 문제 예시와 같습니다.
 입출력 예 #2

 모든 상자를 보조 컨테이너 벨트에 모두 넣고, 역순으로 하나씩 빼서 트럭에 싣습니다.
 
 import Foundation

 func solution(_ order:[Int]) -> Int {
     var stack = [Int]()
     var idx = 1
     var count = 0
     for item in order {
         if idx < item {
             while idx != item {
                 stack.append(idx)
                 idx += 1
             }
         }
         else if idx > item {
             guard let popItem = stack.popLast(),
                   popItem == item else { break }
             count += 1
             continue
             
         }

         idx += 1
         count += 1
     }
     return count
 }
 */
/*
 프렌즈4블록
 블라인드 공채를 통과한 신입 사원 라이언은 신규 게임 개발 업무를 맡게 되었다. 이번에 출시할 게임 제목은 "프렌즈4블록".
 같은 모양의 카카오프렌즈 블록이 2×2 형태로 4개가 붙어있을 경우 사라지면서 점수를 얻는 게임이다.

 board map
 만약 판이 위와 같이 주어질 경우, 라이언이 2×2로 배치된 7개 블록과 콘이 2×2로 배치된 4개 블록이 지워진다. 같은 블록은 여러 2×2에 포함될 수 있으며, 지워지는 조건에 만족하는 2×2 모양이 여러 개 있다면 한꺼번에 지워진다.

 board map

 블록이 지워진 후에 위에 있는 블록이 아래로 떨어져 빈 공간을 채우게 된다.

 board map

 만약 빈 공간을 채운 후에 다시 2×2 형태로 같은 모양의 블록이 모이면 다시 지워지고 떨어지고를 반복하게 된다.
 board map

 위 초기 배치를 문자로 표시하면 아래와 같다.

 TTTANT
 RRFACC
 RRRFCC
 TRRRAA
 TTMMMF
 TMMTTJ
 각 문자는 라이언(R), 무지(M), 어피치(A), 프로도(F), 네오(N), 튜브(T), 제이지(J), 콘(C)을 의미한다

 입력으로 블록의 첫 배치가 주어졌을 때, 지워지는 블록은 모두 몇 개인지 판단하는 프로그램을 제작하라.

 입력 형식
 입력으로 판의 높이 m, 폭 n과 판의 배치 정보 board가 들어온다.
 2 ≦ n, m ≦ 30
 board는 길이 n인 문자열 m개의 배열로 주어진다. 블록을 나타내는 문자는 대문자 A에서 Z가 사용된다.
 출력 형식
 입력으로 주어진 판 정보를 가지고 몇 개의 블록이 지워질지 출력하라.

 입출력 예제
 m    n    board    answer
 4    5    ["CCBDE", "AAADE", "AAABF", "CCBBF"]    14
 6    6    ["TTTANT", "RRFACC", "RRRFCC", "TRRRAA", "TTMMMF", "TMMTTJ"]    15
 예제에 대한 설명
 입출력 예제 1의 경우, 첫 번째에는 A 블록 6개가 지워지고, 두 번째에는 B 블록 4개와 C 블록 4개가 지워져, 모두 14개의 블록이 지워진다.
 입출력 예제 2는 본문 설명에 있는 그림을 옮긴 것이다. 11개와 4개의 블록이 차례로 지워지며, 모두 15개의 블록이 지워진다.
 
 func solution(_ m:Int, _ n:Int, _ board:[String]) -> Int {
     
     var board: [[String?]] = board.map { $0.map{String($0)} }
     
     var nextLevel = true
     
     while nextLevel {
         var visited = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
         nextLevel = false
         
         for y in 0..<m-1 {
             for x in 0..<n-1 {
                 if [board[y+1][x], board[y][x+1], board[y+1][x+1]].filter({board[y][x] == $0 && $0 != nil}).count == 3 {
                     
                     for boxY in 0...1 {
                         for boxX in 0...1 {
                             visited[y+boxY][x+boxX] = true
                             nextLevel = true
                         }
                     }
                 }
             }
         }
         
         for x in 0..<n {
             var indexs = Queue()
             for y in (0..<m).reversed() {
                 if visited[y][x] == true {
                     indexs.enqueue(item: y)
                     board[y][x] = nil
                 }
                 else {
                     if let idx = indexs.dequeue() {
                         board[idx][x] = board[y][x]
                         board[y][x] = nil
                         //MARK: 이거 빼먹어서 시간 오래 걸림!
                         indexs.enqueue(item: y)
                     }
                 }
             }
         }
     }
     return board.reduce(0, {$0 + $1.filter{$0 == nil}.count})
 }


 struct Queue {
     var queue = [Int?]()
     var index = 0
     
     mutating func enqueue(item: Int){
         queue.append(item)
     }
     
     mutating func dequeue() -> Int? {
         guard index < queue.count,
               let item = queue[index] else {return nil}
         
         queue[index] = nil
         index += 1
         
         return item
     }
 }

 */

/*
 숫자 변환하기
 자연수 x를 y로 변환하려고 합니다. 사용할 수 있는 연산은 다음과 같습니다.

 x에 n을 더합니다
 x에 2를 곱합니다.
 x에 3을 곱합니다.
 자연수 x, y, n이 매개변수로 주어질 때, x를 y로 변환하기 위해 필요한 최소 연산 횟수를 return하도록 solution 함수를 완성해주세요. 이때 x를 y로 만들 수 없다면 -1을 return 해주세요.

 제한사항
 1 ≤ x ≤ y ≤ 1,000,000
 1 ≤ n < y
 입출력 예
 x    y    n    result
 10   40   5    2
 10   40   30   1
 2    5    4    -1
 입출력 예 설명
 입출력 예 #1
 x에 2를 2번 곱하면 40이 되고 이때가 최소 횟수입니다.

 입출력 예 #2
 x에 n인 30을 1번 더하면 40이 되고 이때가 최소 횟수입니다.

 입출력 예 #3
 x를 y로 변환할 수 없기 때문에 -1을 return합니다.
 
 import Foundation

 func solution(_ x:Int, _ y:Int, _ n:Int) -> Int {
     var x = x, y = y
     //MARK: - 한번 더 생각하기
     if x == y {return 0}
     var DP = [Int](repeating: -1, count: y+1)
     DP[x] = 0
     for idx in x+1...y {
         var compare = [Int]()
         if let count = DP[safe: idx-n], count != -1 {
             compare.append(DP[idx-n] + 1)
         }
         if let count = DP[safe: idx/2], count != -1, idx.isMultiple(of: 2) {
             compare.append(DP[idx/2] + 1)
         }
         if let count = DP[safe: idx/3], count != -1, idx.isMultiple(of: 3) {
             compare.append(DP[idx/3] + 1)
         }
         DP[idx] = compare.min() ?? -1
     }
     return DP[y]
 }
 //MARK: - 안전한 배열 만들기
 extension Array where Element == Int {
     subscript(safe index: Int) -> Int? {
         guard 0 <= index && index < self.count else { return nil }
         return self[self.index(self.startIndex, offsetBy: index)]
     }
 }
 */

/*
2개 이하로 다른 비트
제출 내역
문제 설명
양의 정수 x에 대한 함수 f(x)를 다음과 같이 정의합니다.

x보다 크고 x와 비트가 1~2개 다른 수들 중에서 제일 작은 수
예를 들어,

f(2) = 3 입니다. 다음 표와 같이 2보다 큰 수들 중에서 비트가 다른 지점이 2개 이하이면서 제일 작은 수가 3이기 때문입니다.
수        비트           다른 비트의 개수
2       000...0010
3       000...0011     1
f(7) = 11 입니다. 다음 표와 같이 7보다 큰 수들 중에서 비트가 다른 지점이 2개 이하이면서 제일 작은 수가 11이기 때문입니다.
수        비트           다른 비트의 개수
7        000...0111
8        000...1000    4
9        000...1001    3
10       000...1010    3
11       000...1011    2
정수들이 담긴 배열 numbers가 매개변수로 주어집니다. numbers의 모든 수들에 대하여 각 수의 f 값을 배열에 차례대로 담아 return 하도록 solution 함수를 완성해주세요.

제한사항
1 ≤ numbers의 길이 ≤ 100,000
0 ≤ numbers의 모든 수 ≤ 1015
입출력 예
numbers    result
[2,7]    [3,11]
입출력 예 설명
입출력 예 #1

문제 예시와 같습니다.
 \
 import Foundation

 func solution(_ numbers:[Int64]) -> [Int64] {
     var dic = [Int64: String]()
     var result = [Int64]()
     for number in numbers {
         let str = UInt64(number)
         var idx = number + 1
         
         while true {
             
             let count = String(str ^ UInt64(idx), radix: 2).filter({$0 == "1"}).count
             if count >= 1 && count <= 2 {
                 result.append(idx)
                 break
             }
             idx += 1
         }
     }
     
     return result
 }
*/

/*
다리를 지나는 트럭
제출 내역
문제 설명
트럭 여러 대가 강을 가로지르는 일차선 다리를 정해진 순으로 건너려 합니다. 모든 트럭이 다리를 건너려면 최소 몇 초가 걸리는지 알아내야 합니다. 다리에는 트럭이 최대 bridge_length대 올라갈 수 있으며, 다리는 weight 이하까지의 무게를 견딜 수 있습니다. 단, 다리에 완전히 오르지 않은 트럭의 무게는 무시합니다.

예를 들어, 트럭 2대가 올라갈 수 있고 무게를 10kg까지 견디는 다리가 있습니다. 무게가 [7, 4, 5, 6]kg인 트럭이 순서대로 최단 시간 안에 다리를 건너려면 다음과 같이 건너야 합니다.

경과 시간    다리를 지난 트럭    다리를 건너는 트럭    대기 트럭
0         []              []               [7,4,5,6]
1~2       []              [7]              [4,5,6]
3         [7]             [4]              [5,6]
4         [7]             [4,5]            [6]
5         [7,4]           [5]              [6]
6~7       [7,4,5]         [6]              []
8         [7,4,5,6]       []               []
따라서, 모든 트럭이 다리를 지나려면 최소 8초가 걸립니다.

solution 함수의 매개변수로 다리에 올라갈 수 있는 트럭 수 bridge_length, 다리가 견딜 수 있는 무게 weight, 트럭 별 무게 truck_weights가 주어집니다. 이때 모든 트럭이 다리를 건너려면 최소 몇 초가 걸리는지 return 하도록 solution 함수를 완성하세요.

제한 조건
bridge_length는 1 이상 10,000 이하입니다.
weight는 1 이상 10,000 이하입니다.
truck_weights의 길이는 1 이상 10,000 이하입니다.
모든 트럭의 무게는 1 이상 weight 이하입니다.
입출력 예
bridge_length    weight    truck_weights                      return
2                10        [7,4,5,6]                          8
100              100       [10]                               101
100              100       [10,10,10,10,10,10,10,10,10,10]    110

 import Foundation

 func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
     var bridgeLength = bridge_length  // 다리 길이
     var currentWeight = weight        // 견딜 수 있는 무게
     var truckWeights = truck_weights  // 트럭
     var time = bridgeLength
     var trucksOnBridge = Queue()
     for truckWeight in truckWeights {
         if truckWeight > currentWeight {
             while let truck = trucksOnBridge.dequeue() {
                 currentWeight += truck.weight
                 if truckWeight <= currentWeight {
                     time = time - bridgeLength >= truck.time ? time + 1 : truck.time + bridgeLength
                     
                     currentWeight -= truckWeight
                     trucksOnBridge.enqueue(
                         element: Truck(
                             weight: truckWeight,
                             time: time
                         )
                     )
                     break
                 }
             }
         }
         else if truckWeight <= currentWeight {
             currentWeight -= truckWeight
             time += 1
             trucksOnBridge.enqueue(
                 element: Truck(
                     weight: truckWeight,
                     time: time
                 )
             )
         }
     }
     print(trucksOnBridge.elements)
     return trucksOnBridge.getLastElement()?.time ?? 0
 }

 struct Truck {
     var weight: Int
     var time: Int
 }

 struct Queue {
     
     var elements = [Truck?]()
     var index = 0
     
     mutating func enqueue(element: Truck) {
         elements.append(element)
     }
     
     mutating func dequeue() -> Truck? {
         guard index < elements.count, let element = elements[index] else { return nil }
         elements[index] = nil
         index += 1
         
         if index > 2 {
             elements.removeFirst(3)
             index = 0
         }
         
         return element
     }
     
     mutating func getLastElement() -> Truck? {
         guard let element = elements.last else { return nil }
         return element
     }
 }
 
*/

/**
 
 KOI 부설 과학연구소에서는 많은 종류의 산성 용액과 알칼리성 용액을 보유하고 있다. 각 용액에는 그 용액의 특성을 나타내는 하나의 정수가 주어져있다. 산성 용액의 특성값은 1부터 1,000,000,000까지의 양의 정수로 나타내고, 알칼리성 용액의 특성값은 -1부터 -1,000,000,000까지의 음의 정수로 나타낸다.

 같은 양의 두 용액을 혼합한 용액의 특성값은 혼합에 사용된 각 용액의 특성값의 합으로 정의한다. 이 연구소에서는 같은 양의 두 용액을 혼합하여 특성값이 0에 가장 가까운 용액을 만들려고 한다.

 예를 들어, 주어진 용액들의 특성값이 [-2, 4, -99, -1, 98]인 경우에는 특성값이 -99인 용액과 특성값이 98인 용액을 혼합하면 특성값이 -1인 용액을 만들 수 있고, 이 용액이 특성값이 0에 가장 가까운 용액이다. 참고로, 두 종류의 알칼리성 용액만으로나 혹은 두 종류의 산성 용액만으로 특성값이 0에 가장 가까운 혼합 용액을 만드는 경우도 존재할 수 있다.

 산성 용액과 알칼리성 용액의 특성값이 주어졌을 때, 이 중 두 개의 서로 다른 용액을 혼합하여 특성값이 0에 가장 가까운 용액을 만들어내는 두 용액을 찾는 프로그램을 작성하시오.

 ## 입력

 첫째 줄에는 전체 용액의 수 N이 입력된다. N은 2 이상 100,000 이하이다. 둘째 줄에는 용액의 특성값을 나타내는 N개의 정수가 빈칸을 사이에 두고 주어진다. 이 수들은 모두 -1,000,000,000 이상 1,000,000,000 이하이다. N개의 용액들의 특성값은 모두 다르고, 산성 용액만으로나 알칼리성 용액만으로 입력이 주어지는 경우도 있을 수 있다.

 ## 출력

 첫째 줄에 특성값이 0에 가장 가까운 용액을 만들어내는 두 용액의 특성값을 출력한다. 출력해야 하는 두 용액은 특성값의 오름차순으로 출력한다. 특성값이 0에 가장 가까운 용액을 만들어내는 경우가 두 개 이상일 경우에는 그 중 아무것이나 하나를 출력한다.

 ## 예제 입력 1

 ```
 5
 -2 4 -99 -1 98

 ```

 ## 예제 출력 1

 ```
 -99 98
 ```
 
 func solution(){
     let items = 5 // Int(readLine()!)!
     var liquid = [-2, 4, -99, -1, 98].sorted() // readLine()!.split(separator: " ").compactMap { Int(String($0))! }.sorted()
     var mius = liquid.filter {$0 < 0}
     var miusPoint = (0, mius.endIndex-1)
     var plus = Array(liquid[mius.count...])
     var plusPoint = (0, plus.endIndex-1)
     
     while (miusPoint.0 <= miusPoint.1) || (plusPoint.0 <= plusPoint.1) {
         var CanMovePlus = (plusPoint.0 <= plusPoint.1)
         var CanMoveMinu = (miusPoint.0 <= miusPoint.1)
         
         var midPlusPoint = CanMovePlus ? (plusPoint.0 + plusPoint.1) / 2 : plusPoint.1 + 1
         var midMiusPoint = CanMoveMinu ? (miusPoint.0 + miusPoint.1) / 2 : miusPoint.1 + 1
         print("point: \(midMiusPoint) \(mius.count), \(midPlusPoint) \(plus.count)")
         
         var sum = plus[midPlusPoint] + mius[midMiusPoint]
         
         if sum == 0 {
             miusPoint.1 = midMiusPoint
             plusPoint.1 = midPlusPoint
             break
         }
         else if sum > 0 {
             if CanMovePlus {
                 plusPoint.1 = midPlusPoint - 1
             }
             if CanMoveMinu {
                 miusPoint.0 = midMiusPoint + 1
             }
         }
         else {
             
             if CanMovePlus {
                 plusPoint.0 = midPlusPoint + 1
             }
             if CanMoveMinu {
                 miusPoint.1 = midMiusPoint - 1
             }
         }
     }
     
     print("result: \(mius[miusPoint.1]), \(plus[plusPoint.1])")
     

 }

 solution()
 
 */




/*
 
 ## 문제

 회전 초밥 음식점에는 회전하는 벨트 위에 여러 가지 종류의 초밥이 접시에 담겨 놓여 있고, 손님은 이 중에서 자기가 좋아하는 초밥을 골라서 먹는다. 초밥의 종류를 번호로 표현할 때, 다음 그림은 회전 초밥 음식점의 벨트 상태의 예를 보여주고 있다. 벨트 위에는 같은 종류의 초밥이 둘 이상 있을 수 있다.

 새로 문을 연 회전 초밥 음식점이 불경기로 영업이 어려워서, 다음과 같이 두 가지 행사를 통해서 매상을 올리고자 한다.

 1. 원래 회전 초밥은 손님이 마음대로 초밥을 고르고, 먹은 초밥만큼 식대를 계산하지만, 벨트의 임의의 한 위치부터 k개의 접시를 연속해서 먹을 경우 할인된 정액 가격으로 제공한다.
 2. 각 고객에게 초밥의 종류 하나가 쓰인 쿠폰을 발행하고, 1번 행사에 참가할 경우 이 쿠폰에 적혀진 종류의 초밥 하나를 추가로 무료로 제공한다. 만약 이 번호에 적혀진 초밥이 현재 벨트 위에 없을 경우, 요리사가 새로 만들어 손님에게 제공한다.

 위 할인 행사에 참여하여 가능한 한 다양한 종류의 초밥을 먹으려고 한다. 위 그림의 예를 가지고 생각해보자. k=4이고, 30번 초밥을 쿠폰으로 받았다고 가정하자. 쿠폰을 고려하지 않으면 4가지 다른 초밥을 먹을 수 있는 경우는 (9, 7, 30, 2), (30, 2, 7, 9), (2, 7, 9, 25) 세 가지 경우가 있는데, 30번 초밥을 추가로 쿠폰으로 먹을 수 있으므로 (2, 7, 9, 25)를 고르면 5가지 종류의 초밥을 먹을 수 있다.

 회전 초밥 음식점의 벨트 상태, 메뉴에 있는 초밥의 가짓수, 연속해서 먹는 접시의 개수, 쿠폰 번호가 주어졌을 때, 손님이 먹을 수 있는 초밥 가짓수의 최댓값을 구하는 프로그램을 작성하시오.

 ## 입력

 첫 번째 줄에는 회전 초밥 벨트에 놓인 접시의 수 N, 초밥의 가짓수 d, 연속해서 먹는 접시의 수 k, 쿠폰 번호 c가 각각 하나의 빈 칸을 사이에 두고 주어진다. 단, 2 ≤ N ≤ 3,000,000, 2 ≤ d ≤ 3,000, 2 ≤ k ≤ 3,000 (k ≤ N), 1 ≤ c ≤ d이다. 두 번째 줄부터 N개의 줄에는 벨트의 한 위치부터 시작하여 회전 방향을 따라갈 때 초밥의 종류를 나타내는 1 이상 d 이하의 정수가 각 줄마다 하나씩 주어진다.

 ## 출력

 주어진 회전 초밥 벨트에서 먹을 수 있는 초밥의 가짓수의 최댓값을 하나의 정수로 출력한다.

 ## 예제 입력 1

 ```
 8 30 4 30
 7
 9
 7
 30
 2
 7
 9
 25

 ```

 ## 예제 출력 1

 ```
 5

 ```

 ## 예제 입력 2

 ```
 8 50 4 7
 2
 7
 9
 25
 7
 9
 7
 30

 ```

 ## 예제 출력 2
 */

/*
 0과 1로 이루어진 2n x 2n 크기의 2차원 정수 배열 arr이 있습니다. 당신은 이 arr을 쿼드 트리와 같은 방식으로 압축하고자 합니다. 구체적인 방식은 다음과 같습니다.

 당신이 압축하고자 하는 특정 영역을 S라고 정의합니다.
 만약 S 내부에 있는 모든 수가 같은 값이라면, S를 해당 수 하나로 압축시킵니다.
 그렇지 않다면, S를 정확히 4개의 균일한 정사각형 영역(입출력 예를 참고해주시기 바랍니다.)으로 쪼갠 뒤, 각 정사각형 영역에 대해 같은 방식의 압축을 시도합니다.
 arr이 매개변수로 주어집니다. 위와 같은 방식으로 arr을 압축했을 때, 배열에 최종적으로 남는 0의 개수와 1의 개수를 배열에 담아서 return 하도록 solution 함수를 완성해주세요.

 제한사항
 arr의 행의 개수는 1 이상 1024 이하이며, 2의 거듭 제곱수 형태를 하고 있습니다. 즉, arr의 행의 개수는 1, 2, 4, 8, ..., 1024 중 하나입니다.
 arr의 각 행의 길이는 arr의 행의 개수와 같습니다. 즉, arr은 정사각형 배열입니다.
 arr의 각 행에 있는 모든 값은 0 또는 1 입니다.
 입출력 예
 arr    result
 [[1,1,0,0],[1,0,0,0],[1,0,0,1],[1,1,1,1]]    [4,9]
 [[1,1,1,1,1,1,1,1],[0,1,1,1,1,1,1,1],[0,0,0,0,1,1,1,1],[0,1,0,0,1,1,1,1],[0,0,0,0,0,0,1,1],[0,0,0,0,0,0,0,1],[0,0,0,0,1,0,0,1],[0,0,0,0,1,1,1,1]]
 
 import Foundation

 func solution(_ arr:[[Int]]) -> [Int] {
     return quad(arr)
 }

 func quad(_ arr: [[Int]]) -> [Int] {
     if arr.count == 1 {
         return arr[0][0] == 0 ? [1, 0] : [0, 1]
     }
     
     if arr.contains(where: {
         $0.contains(where: { arr[0][0] !=  $0 })
     }) {
         let mid = arr.count / 2
         var trees = [[[Int]]](repeating: [[Int]](), count: 4)
         
         for i in 0..<mid {
             trees[0].append(Array(arr[i][0..<mid]))
             trees[1].append(Array(arr[i][mid...]))
         }
         
         for i in mid..<arr.count {
             trees[2].append(Array(arr[i][0..<mid]))
             trees[3].append(Array(arr[i][mid...]))
         }
         
         return trees.reduce([0,0], { result, tree in
             var arr = quad(tree)
             return [(result[0] + arr[0]), (result[1] + arr[1])]
         })
     }
     else {
         return arr[0][0] == 0 ? [1, 0] : [0, 1]
     }
 }
 */

/*
 길이가 같은 두 개의 큐가 주어집니다. 하나의 큐를 골라 원소를 추출(pop)하고, 추출된 원소를 다른 큐에 집어넣는(insert) 작업을 통해 각 큐의 원소 합이 같도록 만들려고 합니다. 이때 필요한 작업의 최소 횟수를 구하고자 합니다. 한 번의 pop과 한 번의 insert를 합쳐서 작업을 1회 수행한 것으로 간주합니다.

 큐는 먼저 집어넣은 원소가 먼저 나오는 구조입니다. 이 문제에서는 큐를 배열로 표현하며, 원소가 배열 앞쪽에 있을수록 먼저 집어넣은 원소임을 의미합니다. 즉, pop을 하면 배열의 첫 번째 원소가 추출되며, insert를 하면 배열의 끝에 원소가 추가됩니다. 예를 들어 큐 [1, 2, 3, 4]가 주어졌을 때, pop을 하면 맨 앞에 있는 원소 1이 추출되어 [2, 3, 4]가 되며, 이어서 5를 insert하면 [2, 3, 4, 5]가 됩니다.

 다음은 두 큐를 나타내는 예시입니다.

 queue1 = [3, 2, 7, 2]
 queue2 = [4, 6, 5, 1]
 두 큐에 담긴 모든 원소의 합은 30입니다. 따라서, 각 큐의 합을 15로 만들어야 합니다. 예를 들어, 다음과 같이 2가지 방법이 있습니다.

 queue2의 4, 6, 5를 순서대로 추출하여 queue1에 추가한 뒤, queue1의 3, 2, 7, 2를 순서대로 추출하여 queue2에 추가합니다. 그 결과 queue1은 [4, 6, 5], queue2는 [1, 3, 2, 7, 2]가 되며, 각 큐의 원소 합은 15로 같습니다. 이 방법은 작업을 7번 수행합니다.
 queue1에서 3을 추출하여 queue2에 추가합니다. 그리고 queue2에서 4를 추출하여 queue1에 추가합니다. 그 결과 queue1은 [2, 7, 2, 4], queue2는 [6, 5, 1, 3]가 되며, 각 큐의 원소 합은 15로 같습니다. 이 방법은 작업을 2번만 수행하며, 이보다 적은 횟수로 목표를 달성할 수 없습니다.
 따라서 각 큐의 원소 합을 같게 만들기 위해 필요한 작업의 최소 횟수는 2입니다.

 길이가 같은 두 개의 큐를 나타내는 정수 배열 queue1, queue2가 매개변수로 주어집니다. 각 큐의 원소 합을 같게 만들기 위해 필요한 작업의 최소 횟수를 return 하도록 solution 함수를 완성해주세요. 단, 어떤 방법으로도 각 큐의 원소 합을 같게 만들 수 없는 경우, -1을 return 해주세요.

 제한사항
 1 ≤ queue1의 길이 = queue2의 길이 ≤ 300,000
 1 ≤ queue1의 원소, queue2의 원소 ≤ 109
 주의: 언어에 따라 합 계산 과정 중 산술 오버플로우 발생 가능성이 있으므로 long type 고려가 필요합니다.
 입출력 예
 queue1    queue2    result
 [3, 2, 7, 2]    [4, 6, 5, 1]    2
 [1, 2, 1, 2]    [1, 10, 1, 2]    7
 [1, 1]    [1, 5]    -1
 입출력 예 설명
 입출력 예 #1

 문제 예시와 같습니다.

 입출력 예 #2

 //MARK: 포인터 문제였다는 것임! 일반적인 브루스포스 방식으로 했다 안되면 포인터 문제 생각해볼것!
 두 큐에 담긴 모든 원소의 합은 20입니다. 따라서, 각 큐의 합을 10으로 만들어야 합니다. queue2에서 1, 10을 순서대로 추출하여 queue1에 추가하고, queue1에서 1, 2, 1, 2와 1(queue2으로부터 받은 원소)을 순서대로 추출하여 queue2에 추가합니다. 그 결과 queue1은 [10], queue2는 [1, 2, 1, 2, 1, 2, 1]가 되며, 각 큐의 원소 합은 10으로 같습니다. 이때 작업 횟수는 7회이며, 이보다 적은 횟수로 목표를 달성하는 방법은 없습니다. 따라서 7를 return 합니다.

 입출력 예 #3

 어떤 방법을 쓰더라도 각 큐의 원소 합을 같게 만들 수 없습니다. 따라서 -1을 return 합니다.
 import Foundation

 func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
     var queue1 = queue1, queue2 = queue2
     var queue1Sum: UInt64 = UInt64(queue1.reduce(0, +))
     var queue2Sum: UInt64 = UInt64(queue2.reduce(0, +))
     var count = 0
     
     if (queue1Sum + queue2Sum).isMultiple(of: 2) == false { return -1 }
     
     while queue1Sum != queue2Sum {
         print(queue1, queue2)
         if queue1Sum > queue2Sum {
             let item = queue1.removeFirst()
             queue2.append(item)
             queue1Sum -= UInt64(item)
             queue2Sum += UInt64(item)
         }
         else {
             let item = queue2.removeFirst()
             queue1.append(item)
             queue1Sum += UInt64(item)
             queue2Sum -= UInt64(item)
         }
         count += 1
         
         if count == queue1.count * 4 {
             return -1
         }
     }
     
     return count
 }
 
 
 import Foundation

 func solution(_ queue1:[Int], _ queue2:[Int]) -> Int {
     var queue = queue1 + queue2
     var queueSum: UInt64 = UInt64(queue.reduce(0, +))
     if queueSum.isMultiple(of: 2) == false {return -1}
     queueSum /= 2
     var left = 0, right = queue1.count
     var sum = queue1.reduce(0, +)
     var result = 0
     
     if queueSum < (queue.max() ?? 0) {
         return -1
     }
     while (left <= right) && (right < queue.count) {
         if sum < queueSum {
             sum += queue[right]
             right += 1
         }
         else if sum > queueSum {
             sum -= queue[left]
             left += 1
         }
         else {
           return result
         }
         result += 1
     }

     return -1
 }
 */

/*
정수 n이 매개변수로 주어집니다. 다음 그림과 같이 밑변의 길이와 높이가 n인 삼각형에서 맨 위 꼭짓점부터 반시계 방향으로 달팽이 채우기를 진행한 후,
첫 행부터 마지막 행까지 모두 순서대로 합친 새로운 배열을 return 하도록 solution 함수를 완성해주세요.
 n은 1 이상 1,000 이하입니다.
 4    [1,2,9,3,10,8,4,5,6,7]
 5    [1,2,12,3,13,11,4,14,15,10,5,6,7,8,9]
 6    [1,2,15,3,16,14,4,17,21,13,5,18,19,20,12,6,7,8,9,10,11]



 // 출력하는 함수
 func printArray(arr: [[Int]]) {
     var grid: [String] = []
     for i in 0..<arr.count {
         var row = ""
         for j in 0..<arr.first!.count {
             let value = arr[i][j]
             if value != 1000000 {
                 row += "\(value) \t"
             } else {
                 row += "INF\t"
             }
         }
         grid.append(row)
     }
     
     let edgesDescription = grid.joined(separator: "\n\n")
     print(edgesDescription)
 }
 */

/*

문제 설명
어떤 숫자에서 k개의 수를 제거했을 때 얻을 수 있는 가장 큰 숫자를 구하려 합니다.

예를 들어, 숫자 1924에서 수 두 개를 제거하면 [19, 12, 14, 92, 94, 24] 를 만들 수 있습니다. 이 중 가장 큰 숫자는 94 입니다.

문자열 형식으로 숫자 number와 제거할 수의 개수 k가 solution 함수의 매개변수로 주어집니다. number에서 k 개의 수를 제거했을 때 만들 수 있는 수 중 가장 큰 숫자를 문자열 형태로 return 하도록 solution 함수를 완성하세요.

제한 조건
number는 2자리 이상, 1,000,000자리 이하인 숫자입니다.
k는 1 이상 number의 자릿수 미만인 자연수입니다.
입출력 예
number    k    return
"1924"    2    "94"
"1231234"    3    "3234"
"4177252841"    4    "775841"

 import Foundation

 func solution(_ number:String, _ k:Int) -> String {
     var number = number.compactMap{ String($0) }
     var k = k
     var checkNum = Array(number[1...k])
     var removeIndex = [Int]()
     for idx in 0..<number.count-1 where k != 0 {
         let num = number[idx]
         if num == "9" && idx+k+1 < number.count {
             checkNum.append(number[idx+k+1])
         }
         else if checkNum.max()! > num {
             // 삭제
             k -= 1
             number[idx] = ""
         }
         else if idx+k+1 < number.count {
             checkNum.append(number[idx+k+1])
         }
         checkNum.removeFirst()
     }

     return String(number.joined().dropLast(k))
 }

 solution("98123471", 6)
 
 //MARK: - 시간 초과 나면 stack을 이용하거나 슬라이드 원도우 이용 !!
 //IMPORTANT: !!
 import Foundation



 solution("1924", 2)

 
 func solution(_ number:String, _ k:Int) -> String {
     let number = number.map { $0 }
     var stack = [Character]()
     var k = k, numberCount = number.count
     
     for num in number {
         while stack.isEmpty == false && k > 0 && stack.last! < num {
             stack.popLast()
             k -= 1
         }
         //MARK: - 고정되는 것은 꼭 상수화 시키기
         if stack.count < numberCount - k {
             stack.append(num)
         }
     }
     return String(stack)
 }

 
*/



/*
 n가지 종류의 동전이 있다. 이 동전들을 적당히 사용해서, 그 가치의 합이 k원이 되도록 하고 싶다. 그러면서 동전의 개수가 최소가 되도록 하려고 한다. 각각의 동전은 몇 개라도 사용할 수 있다.

 ## 입력

 첫째 줄에 n, k가 주어진다. (1 ≤ n ≤ 100, 1 ≤ k ≤ 10,000) 다음 n개의 줄에는 각각의 동전의 가치가 주어진다. 동전의 가치는 100,000보다 작거나 같은 자연수이다. 가치가 같은 동전이 여러 번 주어질 수도 있다.
 
 3 15
 1
 5
 12

 
 3
 
 func solution(_ nk: [Int], _ value: [Int]) -> Int {
     var dp = [Int](repeating: -1, count: nk[1]+1)
     dp[0] = 0
     for i in 1...nk[1] {
         value.forEach {
             if i - $0 >= 0 && dp[i-$0] != -1 {
                 dp[i] = min(dp[i-$0] + 1, dp[i] == -1 ? dp[i-$0] + 1 : dp[i])
             }
         }
     }
     return dp[nk[1]]
 }

 let nk = readLine()!.split(separator: " ").compactMap { Int($0) }
 var value = [Int]()
 for _ in 0..<nk[0] {
     value.append(Int(readLine()!)!)
 }
 */

/*
 이 문제는 아주 평범한 배낭에 관한 문제이다.

 한 달 후면 국가의 부름을 받게 되는 준서는 여행을 가려고 한다. 세상과의 단절을 슬퍼하며 최대한 즐기기 위한 여행이기 때문에, 가지고 다닐 배낭 또한 최대한 가치 있게 싸려고 한다.

 준서가 여행에 필요하다고 생각하는 N개의 물건이 있다. 각 물건은 무게 W와 가치 V를 가지는데, 해당 물건을 배낭에 넣어서 가면 준서가 V만큼 즐길 수 있다. 아직 행군을 해본 적이 없는 준서는 최대 K만큼의 무게만을 넣을 수 있는 배낭만 들고 다닐 수 있다. 준서가 최대한 즐거운 여행을 하기 위해 배낭에 넣을 수 있는 물건들의 가치의 최댓값을 알려주자.

 ## 입력

 첫 줄에 물품의 수 N(1 ≤ N ≤ 100)과 준서가 버틸 수 있는 무게 K(1 ≤ K ≤ 100,000)가 주어진다. 두 번째 줄부터 N개의 줄에 거쳐 각 물건의 무게 W(1 ≤ W ≤ 100,000)와 해당 물건의 가치 V(0 ≤ V ≤ 1,000)가 주어진다.

 입력으로 주어지는 모든 수는 정수이다.

 ## 출력

 한 줄에 배낭에 넣을 수 있는 물건들의 가치합의 최댓값을 출력한다.
 
 입력
 4 7
 6 13
 4 8
 3 6
 5 12

 출력
 14
 
 func solution(_ NK: [Int], _ WV: [[Int]]) -> Int {
     var WV = WV.sorted(by: {$0[0] < $1[0]})
     var DP = [Int](repeating: 0, count: NK[1]+1)
     var result = 0
     
     for (idx, bag) in WV.enumerated() {
         for weight in (1...NK[1]).reversed() {
             if weight >= bag[0] {
                 DP[weight] = max(DP[weight - bag[0]] + bag[1], DP[weight])
             }
             else {
                 DP[weight] = max(DP[weight], DP[weight-1])
             }
         }
         print(DP)
     }
     return DP.last!
 }
 
 
 let NK = readLine()!.split(separator: " ").compactMap{ Int($0) }
 var WV = [[Int]]()

 for _ in 0..<NK[0] {
     WV.append(readLine()!.split(separator: " ").compactMap { Int($0) })
 }
 */

/*
 
 문제 설명
 호텔을 운영 중인 코니는 최소한의 객실만을 사용하여 예약 손님들을 받으려고 합니다. 한 번 사용한 객실은 퇴실 시간을 기준으로 10분간 청소를 하고 다음 손님들이 사용할 수 있습니다.
 예약 시각이 문자열 형태로 담긴 2차원 배열 book_time이 매개변수로 주어질 때, 코니에게 필요한 최소 객실의 수를 return 하는 solution 함수를 완성해주세요.

 제한사항
 1 ≤ book_time의 길이 ≤ 1,000
 book_time[i]는 ["HH:MM", "HH:MM"]의 형태로 이루어진 배열입니다
 [대실 시작 시각, 대실 종료 시각] 형태입니다.
 시각은 HH:MM 형태로 24시간 표기법을 따르며, "00:00" 부터 "23:59" 까지로 주어집니다.
 예약 시각이 자정을 넘어가는 경우는 없습니다.
 시작 시각은 항상 종료 시각보다 빠릅니다.
 입출력 예
 book_time    result
 [["15:00", "17:00"], ["16:40", "18:20"], ["14:20", "15:20"], ["14:10", "19:20"], ["18:20", "21:20"]]    3
 [["09:10", "10:10"], ["10:20", "12:20"]]    1
 [["10:20", "12:30"], ["10:20", "12:30"], ["10:20", "12:30"]]    3
 입출력 예 설명
 입출력 예 #1

 example1
 위 사진과 같습니다.

 입출력 예 #2

 첫 번째 손님이 10시 10분에 퇴실 후 10분간 청소한 뒤 두 번째 손님이 10시 20분에 입실하여 사용할 수 있으므로 방은 1개만 필요합니다.

 입출력 예 #3

 세 손님 모두 동일한 시간대를 예약했기 때문에 3개의 방이 필요합니다.
 
 import Foundation

 func solution(_ book_time:[[String]]) -> Int {
     var result = 0, stack = [(String, String)](), roomCount = 0
     var bookTimes = book_time
         .flatMap{ [($0[0],"s"), ($0[1].addTenMinute(), "e")] }
         .sorted { ($0.0, $0.1) < ($1.0, $1.1) }

     print(bookTimes)
     for bookTime in bookTimes {
         if bookTime.1 == "s" { // start
             stack.append(bookTime)
             roomCount += 1
             result = max(result, roomCount)
         }
         else { // end
             stack.popLast()
             roomCount -= 1
         }
     }
     return result
 }

 extension String {
     func addTenMinute() -> String {
         var time = self.components(separatedBy: ":").compactMap{Int(String($0))}
         let minute = time[1] + 10
         //MARK: - hour도 00 형식에 맞춰서 하길 바람
         return "\(String(format: "%02d", minute >= 60 ? time[0]+1 : time[0])):\(String(format: "%02d", minute % 60))"
     }
 }

 */


/*
 메뉴 리뉴얼
 
 레스토랑을 운영하던 스카피는 코로나19로 인한 불경기를 극복하고자 메뉴를 새로 구성하려고 고민하고 있습니다.
 기존에는 단품으로만 제공하던 메뉴를 조합해서 코스요리 형태로 재구성해서 새로운 메뉴를 제공하기로 결정했습니다. 어떤 단품메뉴들을 조합해서 코스요리 메뉴로 구성하면 좋을 지 고민하던 "스카피"는 이전에 각 손님들이 주문할 때 가장 많이 함께 주문한 단품메뉴들을 코스요리 메뉴로 구성하기로 했습니다.
 단, 코스요리 메뉴는 최소 2가지 이상의 단품메뉴로 구성하려고 합니다. 또한, 최소 2명 이상의 손님으로부터 주문된 단품메뉴 조합에 대해서만 코스요리 메뉴 후보에 포함하기로 했습니다.

 예를 들어, 손님 6명이 주문한 단품메뉴들의 조합이 다음과 같다면,
 (각 손님은 단품메뉴를 2개 이상 주문해야 하며, 각 단품메뉴는 A ~ Z의 알파벳 대문자로 표기합니다.)

 손님 번호    주문한 단품메뉴 조합
 1번 손님    A, B, C, F, G
 2번 손님    A, C
 3번 손님    C, D, E
 4번 손님    A, C, D, E
 5번 손님    B, C, F, G
 6번 손님    A, C, D, E, H
 가장 많이 함께 주문된 단품메뉴 조합에 따라 "스카피"가 만들게 될 코스요리 메뉴 구성 후보는 다음과 같습니다.

 코스 종류    메뉴 구성    설명
 요리 2개 코스    A, C    1번, 2번, 4번, 6번 손님으로부터 총 4번 주문됐습니다.
 요리 3개 코스    C, D, E    3번, 4번, 6번 손님으로부터 총 3번 주문됐습니다.
 요리 4개 코스    B, C, F, G    1번, 5번 손님으로부터 총 2번 주문됐습니다.
 요리 4개 코스    A, C, D, E    4번, 6번 손님으로부터 총 2번 주문됐습니다.
 [문제]
 각 손님들이 주문한 단품메뉴들이 문자열 형식으로 담긴 배열 orders, "스카피"가 추가하고 싶어하는 코스요리를 구성하는 단품메뉴들의 갯수가 담긴 배열 course가 매개변수로 주어질 때, "스카피"가 새로 추가하게 될 코스요리의 메뉴 구성을 문자열 형태로 배열에 담아 return 하도록 solution 함수를 완성해 주세요.

 [제한사항]
 orders 배열의 크기는 2 이상 20 이하입니다.
 orders 배열의 각 원소는 크기가 2 이상 10 이하인 문자열입니다.
 각 문자열은 알파벳 대문자로만 이루어져 있습니다.
 각 문자열에는 같은 알파벳이 중복해서 들어있지 않습니다.
 course 배열의 크기는 1 이상 10 이하입니다.
 course 배열의 각 원소는 2 이상 10 이하인 자연수가 오름차순으로 정렬되어 있습니다.
 course 배열에는 같은 값이 중복해서 들어있지 않습니다.
 정답은 각 코스요리 메뉴의 구성을 문자열 형식으로 배열에 담아 사전 순으로 오름차순 정렬해서 return 해주세요.
 배열의 각 원소에 저장된 문자열 또한 알파벳 오름차순으로 정렬되어야 합니다.
 만약 가장 많이 함께 주문된 메뉴 구성이 여러 개라면, 모두 배열에 담아 return 하면 됩니다.
 orders와 course 매개변수는 return 하는 배열의 길이가 1 이상이 되도록 주어집니다.
 [입출력 예]
 orders    course    result
 ["ABCFG", "AC", "CDE", "ACDE", "BCFG", "ACDEH"]    [2,3,4]    ["AC", "ACDE", "BCFG", "CDE"]
 ["ABCDE", "AB", "CD", "ADE", "XYZ", "XYZ", "ACD"]    [2,3,5]    ["ACD", "AD", "ADE", "CD", "XYZ"]
 ["XYZ", "XWY", "WXA"]    [2,3,4]    ["WX", "XY"]
 입출력 예에 대한 설명
 입출력 예 #1
 문제의 예시와 같습니다.

 입출력 예 #2
 AD가 세 번, CD가 세 번, ACD가 두 번, ADE가 두 번, XYZ 가 두 번 주문됐습니다.
 요리 5개를 주문한 손님이 1명 있지만, 최소 2명 이상의 손님에게서 주문된 구성만 코스요리 후보에 들어가므로, 요리 5개로 구성된 코스요리는 새로 추가하지 않습니다.

 입출력 예 #3
 WX가 두 번, XY가 두 번 주문됐습니다.
 3명의 손님 모두 단품메뉴를 3개씩 주문했지만, 최소 2명 이상의 손님에게서 주문된 구성만 코스요리 후보에 들어가므로, 요리 3개로 구성된 코스요리는 새로 추가하지 않습니다.
 또, 단품메뉴를 4개 이상 주문한 손님은 없으므로, 요리 4개로 구성된 코스요리 또한 새로 추가하지 않습니다.
 
 import Foundation

 func solution(_ orders:[String], _ course:[Int]) -> [String] {
     var result = [String]()
     
     for c in course {
         var dic = [String: Int]()
         for order in orders {
             if c > order.count {continue}
             if c == order.count {
                 var str = order.sorted()
                 dic[str.map{String($0)}.joined(), default: 0] += 1
             }
             else {
                 for (i, _) in order.enumerated() {

                     combination(order, i, c).forEach {
                         if var getStr = $0 {
                             var str = getStr.sorted()
                             dic[str.map{String($0)}.joined(), default: 0] += 1
                         }
                     }
                 }
             }
         }
         
         if dic.isEmpty {continue}
         var arr = dic.sorted(by: {$0.value > $1.value})
         let maxCount = arr[0].value
         for item in arr where item.value == maxCount && item.value > 1 {
             print("item: \(item)")
             result.append(item.key)
         }
     }
     return result.sorted()
 }


 // 조합
 func combination(_ str: String, _ index: Int, _ count: Int) -> [String?] {
     if count != 1 && index == str.count - 1 { return [nil] }
     if count == 1 { return [str[index]] }
     var currentStr = str[index]
     var result = [String?]()
     for i in (index+1)..<str.count {
         result += combination(str, i, count - 1).compactMap { $0 }.map { currentStr + $0 }
     }
     
     return result
 }

 extension String {
     subscript(_ index: Int) -> String {
         guard index >= 0 && index < self.count else { return "" }
         return String(self[self.index(self.startIndex, offsetBy: index)])
     }
 }

 
 */

/*
 문제 설명
 메리는 여름을 맞아 무인도로 여행을 가기 위해 지도를 보고 있습니다. 지도에는 바다와 무인도들에 대한 정보가 표시돼 있습니다. 지도는 1 x 1크기의 사각형들로 이루어진 직사각형 격자 형태이며, 격자의 각 칸에는 'X' 또는 1에서 9 사이의 자연수가 적혀있습니다. 지도의 'X'는 바다를 나타내며, 숫자는 무인도를 나타냅니다. 이때, 상, 하, 좌, 우로 연결되는 땅들은 하나의 무인도를 이룹니다. 지도의 각 칸에 적힌 숫자는 식량을 나타내는데, 상, 하, 좌, 우로 연결되는 칸에 적힌 숫자를 모두 합한 값은 해당 무인도에서 최대 며칠동안 머물 수 있는지를 나타냅니다. 어떤 섬으로 놀러 갈지 못 정한 메리는 우선 각 섬에서 최대 며칠씩 머물 수 있는지 알아본 후 놀러갈 섬을 결정하려 합니다.

 지도를 나타내는 문자열 배열 maps가 매개변수로 주어질 때, 각 섬에서 최대 며칠씩 머무를 수 있는지 배열에 오름차순으로 담아 return 하는 solution 함수를 완성해주세요. 만약 지낼 수 있는 무인도가 없다면 -1을 배열에 담아 return 해주세요.

 제한사항
 3 ≤ maps의 길이 ≤ 100
 3 ≤ maps[i]의 길이 ≤ 100
 maps[i]는 'X' 또는 1 과 9 사이의 자연수로 이루어진 문자열입니다.
 지도는 직사각형 형태입니다.
 입출력 예
 maps    result
 ["X591X","X1X5X","X231X", "1XXX1"]    [1, 1, 27]
 ["XXX","XXX","XXX"]    [-1]
 입출력 예 설명
 입출력 예 #1

 위 문자열은 다음과 같은 지도를 나타냅니다.

 image1

 연결된 땅들의 값을 합치면 다음과 같으며

 image2

 이를 오름차순으로 정렬하면 [1, 1, 27]이 됩니다.

 입출력 예 #2

 위 문자열은 다음과 같은 지도를 나타냅니다.

 image3

 섬이 존재하지 않기 때문에 -1을 배열에 담아 반환합니다.
 

 import Foundation

 func solution(_ maps:[String]) -> [Int] {
     let maps = maps.map { $0.map{ String($0) } }
     let yCount = maps.count, xCount = maps.first!.count
     var visitedNodes = [[Bool]](repeating: [Bool](repeating: false, count: xCount), count: yCount)
     var result = [Int]()
     for y in maps.indices {
         for x in maps.first!.indices {
             if maps[y][x] != "X" && visitedNodes[y][x] == false,
                let day = dfs(firstNode: Node(x: x, y: y), maps, &visitedNodes) {
                 result.append(day)
             }
         }
     }
     return result.isEmpty ? [-1] : result.sorted()
 }

 // MARK: - 전형적인 BFS / DFS
 func dfs(firstNode: Node,_ maps: [[String]] ,_ visitedNodes: inout [[Bool]]) -> Int? {
     visitedNodes[firstNode.y][firstNode.x] = true
     var stack = [firstNode]
     var count = Int(maps[firstNode.y][firstNode.x])!
     let moves = [(1, 0), (-1, 0), (0, 1), (0, -1)]
     
     while let node = stack.popLast() {
         for move in moves {
             let y = node.y + move.0, x = node.x + move.1
             if x >= 0 && x < maps.first!.count && y >= 0 && y < maps.count,
                visitedNodes[y][x] == false,
                let day = Int(maps[y][x]) {
                 visitedNodes[y][x] = true
                 stack.append(Node(x: x, y: y))
                 count += day
             }
         }
     }
     return count == 0 ? nil : count
 }

 func bfs(firstNode: Node,_ maps: [[String]] ,_ visitedNodes: inout [[Bool]]) -> Int? {
     visitedNodes[firstNode.y][firstNode.x] = true
     var queue = Queue(firstItem: firstNode)
     var count = Int(maps[firstNode.y][firstNode.x])!
     let moves = [(1, 0), (-1, 0), (0, 1), (0, -1)]
     
     while let node = queue.dequeue() {
         for move in moves {
             let y = node.y + move.0, x = node.x + move.1
             if x >= 0 && x < maps.first!.count && y >= 0 && y < maps.count,
                visitedNodes[y][x] == false,
                let day = Int(maps[y][x]) {
                 visitedNodes[y][x] = true
                 queue.enqueue(item: Node(x: x, y: y))
                 count += day
             }
         }
     }
     return count == 0 ? nil : count
 }

 struct Node {
     let x: Int
     let y: Int
 }


 struct Queue {
     var queue = [Node?]()
     var index = 0
     
     init(firstItem: Node) {
         queue.append(firstItem)
     }
     
     mutating func enqueue(item: Node) {
         queue.append(item)
     }
     
     mutating func dequeue() -> Node? {
         guard index < queue.count,
               let item = queue[index] else {return nil}
         index += 1
         if index > 2 {
             queue.removeFirst(3)
             index = 0
         }
         
         return item
     }
 }
 
 */

/*
 철수와 영희는 선생님으로부터 숫자가 하나씩 적힌 카드들을 절반씩 나눠서 가진 후, 다음 두 조건 중 하나를 만족하는 가장 큰 양의 정수 a의 값을 구하려고 합니다.

 철수가 가진 카드들에 적힌 모든 숫자를 나눌 수 있고 영희가 가진 카드들에 적힌 모든 숫자들 중 하나도 나눌 수 없는 양의 정수 a
 영희가 가진 카드들에 적힌 모든 숫자를 나눌 수 있고, 철수가 가진 카드들에 적힌 모든 숫자들 중 하나도 나눌 수 없는 양의 정수 a
 예를 들어, 카드들에 10, 5, 20, 17이 적혀 있는 경우에 대해 생각해 봅시다. 만약, 철수가 [10, 17]이 적힌 카드를 갖고, 영희가 [5, 20]이 적힌 카드를 갖는다면 두 조건 중 하나를 만족하는 양의 정수 a는 존재하지 않습니다. 하지만, 철수가 [10, 20]이 적힌 카드를 갖고, 영희가 [5, 17]이 적힌 카드를 갖는다면, 철수가 가진 카드들의 숫자는 모두 10으로 나눌 수 있고, 영희가 가진 카드들의 숫자는 모두 10으로 나눌 수 없습니다. 따라서 철수와 영희는 각각 [10, 20]이 적힌 카드, [5, 17]이 적힌 카드로 나눠 가졌다면 조건에 해당하는 양의 정수 a는 10이 됩니다.

 철수가 가진 카드에 적힌 숫자들을 나타내는 정수 배열 arrayA와 영희가 가진 카드에 적힌 숫자들을 나타내는 정수 배열 arrayB가 주어졌을 때, 주어진 조건을 만족하는 가장 큰 양의 정수 a를 return하도록 solution 함수를 완성해 주세요. 만약, 조건을 만족하는 a가 없다면, 0을 return 해 주세요.

 제한사항
 제한사항

 1 ≤ arrayA의 길이 = arrayB의 길이 ≤ 500,000
 1 ≤ arrayA의 원소, arrayB의 원소 ≤ 100,000,000
 arrayA와 arrayB에는 중복된 원소가 있을 수 있습니다.
 입출력 예
 arrayA    arrayB    result
 [10, 17]    [5, 20]    0
 [10, 20]    [5, 17]    10
 [14, 35, 119]    [18, 30, 102]    7
 입출력 예 설명
 입출력 예 #1

 문제 예시와 같습니다.
 입출력 예 #2

 문제 예시와 같습니다.
 입출력 예 #3

 철수가 가진 카드에 적힌 숫자들은 모두 3으로 나눌 수 없고, 영희가 가진 카드에 적힌 숫자는 모두 3으로 나눌 수 있습니다. 따라서 3은 조건에 해당하는 양의 정수입니다. 하지만, 철수가 가진 카드들에 적힌 숫자들은 모두 7로 나눌 수 있고, 영희가 가진 카드들에 적힌 숫자는 모두 7로 나눌 수 없습니다. 따라서 최대값인 7을 return 합니다.
 
 //MARK: - 제곱근을 이용한 약수 구하기(GCD를 이용한 약수) / GCD를 이용한 최대공약수 구하기(모든 수를 나눌 수 있는 최대 값)
 func gcd(_ a: Int, _ b: Int) -> Int{
     if (b == 0) { return a }
     return gcd(b, a % b)
 }

 func solution19(_ arrayA:[Int], _ arrayB:[Int]) -> Int {
     let sortedA = arrayA.sorted(by: <)
     let sortedB = arrayB.sorted(by: <)
     var gcdA = sortedA[0]
     if sortedA.count > 1 {
         for i in 1...sortedA.count-1 {
             gcdA = gcd(sortedA[i], gcdA)
             if gcdA == 1 {
                 break
             }
         }
     }
     var gcdB = sortedB[0]
     if sortedB.count > 1 {
         for i in 1...sortedB.count-1 {
             gcdB = gcd(sortedB[i], gcdB)
             if gcdB == 1 {
                 break
             }
         }
     }
     if gcdA == 1 && gcdB == 1 {
         return 0
     }
     if gcdA != 1 {
         for i in 0...sortedB.count-1 {
             if sortedB[i]%gcdA == 0 {
                 gcdA = 0
                 break
             }
         }
     } else {
         gcdA = 0
     }
     if gcdB != 1 {
         for i in 0...sortedA.count-1 {
             if sortedA[i]%gcdB == 0 {
                 gcdB = 0
                 break
             }
         }
     } else {
         gcdB = 0
     }
     return max(gcdA, gcdB)
 }
 */





/*
 1 x 1 크기의 칸들로 이루어진 직사각형 격자 형태의 미로에서 탈출하려고 합니다. 각 칸은 통로 또는 벽으로 구성되어 있으며, 벽으로 된 칸은 지나갈 수 없고 통로로 된 칸으로만 이동할 수 있습니다. 통로들 중 한 칸에는 미로를 빠져나가는 문이 있는데, 이 문은 레버를 당겨서만 열 수 있습니다. 레버 또한 통로들 중 한 칸에 있습니다. 따라서, 출발 지점에서 먼저 레버가 있는 칸으로 이동하여 레버를 당긴 후 미로를 빠져나가는 문이 있는 칸으로 이동하면 됩니다. 이때 아직 레버를 당기지 않았더라도 출구가 있는 칸을 지나갈 수 있습니다. 미로에서 한 칸을 이동하는데 1초가 걸린다고 할 때, 최대한 빠르게 미로를 빠져나가는데 걸리는 시간을 구하려 합니다.

 미로를 나타낸 문자열 배열 maps가 매개변수로 주어질 때, 미로를 탈출하는데 필요한 최소 시간을 return 하는 solution 함수를 완성해주세요. 만약, 탈출할 수 없다면 -1을 return 해주세요.

 제한사항
 5 ≤ maps의 길이 ≤ 100
 5 ≤ maps[i]의 길이 ≤ 100
 maps[i]는 다음 5개의 문자들로만 이루어져 있습니다.
 S : 시작 지점
 E : 출구
 L : 레버
 O : 통로
 X : 벽
 시작 지점과 출구, 레버는 항상 다른 곳에 존재하며 한 개씩만 존재합니다.
 출구는 레버가 당겨지지 않아도 지나갈 수 있으며, 모든 통로, 출구, 레버, 시작점은 여러 번 지나갈 수 있습니다.
 입출력 예
 maps    result
 ["SOOOL","XXXXO","OOOOO","OXXXX","OOOOE"]    16
 ["LOOXS","OOOOX","OOOOO","OOOOO","EOOOO"]    -1
 입출력 예 설명
 입출력 예 #1

 주어진 문자열은 다음과 같은 미로이며

 image1

 다음과 같이 이동하면 가장 빠른 시간에 탈출할 수 있습니다.

 image2

 4번 이동하여 레버를 당기고 출구까지 이동하면 총 16초의 시간이 걸립니다. 따라서 16을 반환합니다.

 입출력 예 #2

 주어진 문자열은 다음과 같은 미로입니다.

 image3

 시작 지점에서 이동할 수 있는 공간이 없어서 탈출할 수 없습니다. 따라서 -1을 반환합니다.
 */

import Foundation

func solution(_ maps:[String]) -> Int {
    var maps = maps.map{ $0.map{ String($0) }}
    var visited = [[Bool]](repeating: [Bool](repeating: false, count: maps.first!.count), count: maps.count)
    var result: Int? = nil
    for y in maps.indices where result == nil {
        for x in maps.first!.indices where result == nil {
            if maps[y][x] == "S"{
                result = getShortest(isPullLabel: false, (x: x, y: y), maps, visited)
            }
        }
    }

    return result != nil ? result! : -1
}

struct Node {
    var x: Int
    var y: Int
}

struct Queue {
    var queue = [Node?]()
    var index = 0
    
    init(firstNode: Node) {
        queue.append(firstNode)
    }
    
    mutating func enqueue(item: Node) {
        queue.append(item)
    }
    
    mutating func dequeue() -> Node? {
        guard index < queue.count,
              let item = queue[index] else { return nil }
        
        queue[index] = nil
        index += 1
        
        if index > 2 {
            queue.removeFirst(3)
            index = 0
        }
        
        return item
    }
}

func getShortest(isPullLabel: Bool,
                 _ position: (x: Int, y: Int),
                 _ maps: [[String]],
                 _ visited: [[Bool]]) -> Int? {
    if isPullLabel == true && maps[position.y][position.x] == "E" { return 0 }
    
    var isPullLabel = isPullLabel, visited = visited
    var moves = [(1, 0),(-1, 0),(0, 1),(0, -1)]
    var result = Int.max
    
    if isPullLabel == false && maps[position.y][position.x] == "L" {
        isPullLabel = true
        visited = [[Bool]](repeating: [Bool](repeating: false, count: maps.first!.count), count: maps.count)
    }
    
    visited[position.y][position.x] = true
    
    for move in moves {
        let y = move.0 + position.y, x = move.1 + position.x

        if (0<=y && y<maps.count) && (0<=x && x<maps.first!.count),
           maps[y][x] != "X",
           visited[y][x] == false,
           let count = getShortest(isPullLabel: isPullLabel,
                                (x: x, y: y),
                                maps,
                                visited)
        {
            result = min(
                result,
                count + 1
            )
        }
    }
    
    return result != Int.max ? result : nil
}

print(solution(["LOOXS","OOOOX","OOOOO","OOOOO","EOOOO"]))



/*
 [카카오 인턴] 수식 최대화
 제출 내역
 문제 설명
 IT 벤처 회사를 운영하고 있는 라이언은 매년 사내 해커톤 대회를 개최하여 우승자에게 상금을 지급하고 있습니다.
 이번 대회에서는 우승자에게 지급되는 상금을 이전 대회와는 다르게 다음과 같은 방식으로 결정하려고 합니다.
 해커톤 대회에 참가하는 모든 참가자들에게는 숫자들과 3가지의 연산문자(+, -, *) 만으로 이루어진 연산 수식이 전달되며, 참가자의 미션은 전달받은 수식에 포함된 연산자의 우선순위를 자유롭게 재정의하여 만들 수 있는 가장 큰 숫자를 제출하는 것입니다.
 단, 연산자의 우선순위를 새로 정의할 때, 같은 순위의 연산자는 없어야 합니다. 즉, + > - > * 또는 - > * > + 등과 같이 연산자 우선순위를 정의할 수 있으나 +,* > - 또는 * > +,-처럼 2개 이상의 연산자가 동일한 순위를 가지도록 연산자 우선순위를 정의할 수는 없습니다. 수식에 포함된 연산자가 2개라면 정의할 수 있는 연산자 우선순위 조합은 2! = 2가지이며, 연산자가 3개라면 3! = 6가지 조합이 가능합니다.
 만약 계산된 결과가 음수라면 해당 숫자의 절댓값으로 변환하여 제출하며 제출한 숫자가 가장 큰 참가자를 우승자로 선정하며, 우승자가 제출한 숫자를 우승상금으로 지급하게 됩니다.

 예를 들어, 참가자 중 네오가 아래와 같은 수식을 전달받았다고 가정합니다.

 "100-200*300-500+20"

 일반적으로 수학 및 전산학에서 약속된 연산자 우선순위에 따르면 더하기와 빼기는 서로 동등하며 곱하기는 더하기, 빼기에 비해 우선순위가 높아 * > +,- 로 우선순위가 정의되어 있습니다.
 대회 규칙에 따라 + > - > * 또는 - > * > + 등과 같이 연산자 우선순위를 정의할 수 있으나 +,* > - 또는 * > +,- 처럼 2개 이상의 연산자가 동일한 순위를 가지도록 연산자 우선순위를 정의할 수는 없습니다.
 수식에 연산자가 3개 주어졌으므로 가능한 연산자 우선순위 조합은 3! = 6가지이며, 그 중 + > - > * 로 연산자 우선순위를 정한다면 결괏값은 22,000원이 됩니다.
 반면에 * > + > - 로 연산자 우선순위를 정한다면 수식의 결괏값은 -60,420 이지만, 규칙에 따라 우승 시 상금은 절댓값인 60,420원이 됩니다.

 참가자에게 주어진 연산 수식이 담긴 문자열 expression이 매개변수로 주어질 때, 우승 시 받을 수 있는 가장 큰 상금 금액을 return 하도록 solution 함수를 완성해주세요.

 [제한사항]
 expression은 길이가 3 이상 100 이하인 문자열입니다.
 expression은 공백문자, 괄호문자 없이 오로지 숫자와 3가지의 연산자(+, -, *) 만으로 이루어진 올바른 중위표기법(연산의 두 대상 사이에 연산기호를 사용하는 방식)으로 표현된 연산식입니다. 잘못된 연산식은 입력으로 주어지지 않습니다.
 즉, "402+-561*"처럼 잘못된 수식은 올바른 중위표기법이 아니므로 주어지지 않습니다.
 expression의 피연산자(operand)는 0 이상 999 이하의 숫자입니다.
 즉, "100-2145*458+12"처럼 999를 초과하는 피연산자가 포함된 수식은 입력으로 주어지지 않습니다.
 "-56+100"처럼 피연산자가 음수인 수식도 입력으로 주어지지 않습니다.
 expression은 적어도 1개 이상의 연산자를 포함하고 있습니다.
 연산자 우선순위를 어떻게 적용하더라도, expression의 중간 계산값과 최종 결괏값은 절댓값이 263 - 1 이하가 되도록 입력이 주어집니다.
 같은 연산자끼리는 앞에 있는 것의 우선순위가 더 높습니다.
 입출력 예
 expression    result
 "100-200*300-500+20"    60420
 "50*6-3*2"    300
 입출력 예에 대한 설명
 입출력 예 #1
 * > + > - 로 연산자 우선순위를 정했을 때, 가장 큰 절댓값을 얻을 수 있습니다.
 연산 순서는 아래와 같습니다.
 100-200*300-500+20
 = 100-(200*300)-500+20
 = 100-60000-(500+20)
 = (100-60000)-520
 = (-59900-520)
 = -60420
 따라서, 우승 시 받을 수 있는 상금은 |-60420| = 60420 입니다.

 입출력 예 #2
 - > * 로 연산자 우선순위를 정했을 때, 가장 큰 절댓값을 얻을 수 있습니다.
 연산 순서는 아래와 같습니다.(expression에서 + 연산자는 나타나지 않았으므로, 고려할 필요가 없습니다.)
 50*6-3*2
 = 50*(6-3)*2
 = (50*3)*2
 = 150*2
 = 300
 따라서, 우승 시 받을 수 있는 상금은 300 입니다.
 
 import Foundation

 func solution(_ expression:String) -> Int64 {
     var stack = [Int]()
     var result = [Int64]()
     
     
     
     return result.max()!
 }

 func dfs(idx: Int) -> [[Int]]{
     
     
     
     return []
 }
 */
