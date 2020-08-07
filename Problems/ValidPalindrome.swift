
// 125. Valid Palindrome

func isPalindrome(_ s: String) -> Bool {
    var i = 0
    var j = Array(s).count - 1
    let strArray = Array(s.lowercased())

    while (i < j) {
        while (i < j && !strArray[i].isAlphaNum)
        {
            i += 1
        }
        while (i < j && !strArray[j].isAlphaNum)
        {
            j -= 1
        }

        guard strArray[i] == strArray[j] else {
            return false
        }

        i += 1
        j -= 1
    }

    return true
}

private extension Character {
    var isAlphaNum: Bool {
        return isLetter || isNumber
    }
}

//isPalindrome("A man, a plan, a canal: Panama")
//isPalindrome("race a car")
