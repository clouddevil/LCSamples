import Foundation


func frequencySort(_ s: String) -> String {
    var hmap = [Character: Int]()
    for char in s {
        hmap[char, default: 0] += 1
    }
    let res = hmap.sorted { $0.value > $1.value }
    return res.compactMap { String(repeating: $0.key, count: $0.value) }.joined()
}

func frequencySort1(_ s: String) -> String {
    var hmap = [Character: Int]()

    s.forEach { ch in
        let v = hmap[ch, default: 0] + 1
        hmap[ch] = v
    }

    return String(s.sorted { (a, b) -> Bool in
        let av = hmap[a, default: 0]
        let bv = hmap[b, default: 0]
        if av == bv {
            return a < b
        }
        return av > bv
    })
}

//frequencySort("Aabb")
//frequencySort("tree")
