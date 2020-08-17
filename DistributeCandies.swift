// 1103. Distribute Candies to People

class Solution {
    func distributeCandies(_ candies: Int, _ num_people: Int) -> [Int] {
        var s = Array(repeating: 0, count: num_people)
        var give = 0
        var candies = candies
        while (candies > 0) {            
            s[give % num_people] += min(candies, give + 1)
            give += 1
            candies -= give
        }
        return s
    }
}
