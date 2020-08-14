
// 409. Longest Palindrome

class LongestPalindrome {
    func longestPalindrome(_ s: String) -> Int {
        var charSet = Set<Character>()
        var length = 0
        s.forEach { (ch) in
            if charSet.contains(ch) {
                charSet.remove(ch)
                length += 2
            } else {
                charSet.insert(ch)
            }
        }
        return (length == s.count) ? length : length + 1
    }

    func longestPalindrome0(_ s: String) -> Int {
        var count = [Int: Int]()
        var length = 0
        s.forEach { (ch) in
            let v = Int(ch.asciiValue!)
            count[v] = (count[v] ?? 0) + 1
            if (count[v] == 2) {
                length += 2
                count[v] = 0
            }
        }
        return (length == s.count) ? length : length + 1
    }
}

//let s = LongestPalindrome()
//s.longestPalindrome("abccccdd")
//
//s.longestPalindrome("aAa")

/*
 
 public int longestPalindrome(String s) {
     int[] count = new int[128];
     int length = 0;
     for(char c: s.toCharArray()){
         if(++count[c] == 2){
             length += 2;
             count[c] = 0;
         }
     }
     return (length == s.length())? length: length+1;
 }
 
 */
