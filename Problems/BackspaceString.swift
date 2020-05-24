import Foundation

public class BackspaceStringCompare {
    public init() {}
    
    
    func nextChar(_ s: String, _ i: Int) -> (Character?, Int) {
        var back = 1
        var index = i
        var ch: Character?
        while (back > 0) {
            index -= 1
            back -= 1
            if (index >= 0) {
                ch = s[s.index(s.startIndex, offsetBy: index)]
                if (ch == Character("#")) {
                    back += 2
                }
            } else {
                ch = nil
                break;
            }
        }
        
        return (ch, index)
    }

    public func backspaceCompare(_ s: String, _ t: String) -> Bool {
        var sIndex = s.count
        var tIndex = t.count
        
        var sCh: Character?
        var tCh: Character?
        
        while ((sIndex >= 0) || (tIndex >= 0)) {
            (sCh, sIndex) = nextChar(s, sIndex)
            (tCh, tIndex) = nextChar(t, tIndex)
            //print("\(sCh)  \(sIndex)    \(tCh)  \(tIndex)")
            if (sCh != tCh) {
                return false
            }
        }
        return true
    }
}

/*
func backspaceCompare(_ S: String, _ T: String) -> Bool {
    return filter(S) == filter(T)
}

private func filter(_ s: String) -> String {
    var res = [Character]()
    for c in s {
        if c == "#" {
            if !res.isEmpty {
                res.removeLast()
            }
        }
        else {
            res.append(c)
        }
    }
    
    return String(result)
}
*/
