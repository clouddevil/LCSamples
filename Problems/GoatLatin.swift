
// 824. Goat Latin

final class ToGoatLatin {

    // 20ms
    final func toGoatLatin(_ S: String) -> String {
        let vowels: Set<Character> = ["A", "E", "I", "O", "U", "a", "e", "i", "o", "u"]
        let words = S.split(separator: " ")
        var i = 1
        var out = ""
        for word in words {
            var w = Array(word)
            if (!vowels.contains(w[0])) {
                w.append(w[0])
                w.remove(at: 0)
            }
            w.append("m")
            if (out.count > 0) {
                out.append(" ")
            }
            out.append(String(w) + String(repeating: "a", count: i + 1))
            i = i + 1
        }
        return out
    }

    // 28ms
    func toGoatLatin0(_ S: String) -> String {
        let vowels: Set<Character> = ["a", "e", "i", "o", "u", "A", "E", "I", "O", "U"]
        var result = ""
        var suff = ""

        let words = S.components(separatedBy: " ")
        for word in words {
            suff += "a"

            var translated = word
            if !vowels.contains(word.first!) {
                let first = translated.removeFirst()
                translated += String(first)
            }

            translated += "ma"
            result += "\(translated)\(suff) "
        }

        result.removeLast()
        return result
    }
}

//var s = ToGoatLatin()
//s.toGoatLatin("I speak Goat Latin")
//s.toGoatLatin("I speak Goat Latin") == "Imaa peaksmaaa oatGmaaaa atinLmaaaaa"
//s.toGoatLatin("The quick brown fox jumped over the lazy dog") == "heTmaa uickqmaaa rownbmaaaa oxfmaaaaa umpedjmaaaaaa overmaaaaaaa hetmaaaaaaaa azylmaaaaaaaaa ogdmaaaaaaaaaa"
