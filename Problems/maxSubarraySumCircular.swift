import Foundation


func maxSubarraySumCircular(_ A: [Int]) -> Int {
    var sum = 0
    var tmx = 0
    var mx = A[0]
    var tmn = 0
    var mn = A[0]
    for v in A {
        sum += v
        tmx = v + max(0, tmx)
        tmn = v + min(0, tmn)
        mx = max(mx, tmx)
        mn = min(mn, tmn)
    }
    return mx > 0 ? max(mx, sum - mn) : mx
}
