/// GCD: 최대공약수
/// LCM: 최소공배수

func gcd(_ lhs: Int,_ rhs: Int) -> Int {
    return rhs == 0 ? lhs : gcd(rhs, lhs % rhs)
}

func lms(_ lhs: Int, _ rhs: Int) -> Int {
    return (lhs * rhs) / gcd(lhs, rhs)
}


print(gcd(10, 5))
print(lms(10, 5))
