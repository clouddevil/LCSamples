
// 264. Ugly Number II

class UglyNumber {
    func nthUglyNumber(_ n: Int) -> Int {
      if (n <= 0) {
          return 0
      }
      var result = Array(repeating: 1, count: n)
      var i = 0
      var j = 0
      var k = 0
      var index = 1
      while index < n {
          let v = min(result[i] * 2, result[j] * 3, result[k] * 5)
          result[index] = v
          if (v == result[i] * 2) {
              i += 1
          }
          if (v == result[j] * 3) {
              j += 1
          }
          if (v == result[k] * 5) {
              k += 1
          }
          index += 1
      }
      return result[n - 1]
    }
}

/*
var n = Solution()
let s = n.nthUglyNumber(5)
print(s)
*/
