
// 392. Is Subsequence

class IsSubsequence {
    func isSubsequence(_ s: String, _ t: String) -> Bool {
        if s.count > t.count {
            return false
        }

        var si = 0
        var ti = 0
        let sa = Array(s.utf8)
        let ta = Array(t.utf8)
        let scount = s.count // slow operation !!!
        let tcount = t.count
        while si < scount && ti < tcount {
            if sa[si] == ta[ti] {
                si += 1
            }
            if si == scount {
                return true
            }
            ti += 1
        }
        return si == ti
    }
}
