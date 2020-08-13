
// 1286. Iterator for Combination

final class CombinationIterator {
    
    private var index = 0
    private let combinations: [String]
    
    init(_ characters: String, _ combinationLength: Int) {
        self.combinations = CombinationIterator.findCombinations(characters.map { "\($0)" }, combinationLength)
    }
    
    func next() -> String {
        defer {
            index = index + 1
        }
        return combinations[index]
    }
    
    func hasNext() -> Bool {
        return index < combinations.count
    }
    
    class func findCombinations(_ chs: [String], _ len: Int) -> [String] {
        let upIndex = pow(2, chs.count) - 1
        let bitCount = countBits(upIndex)
        var result = [String]()
        for i in 1..<bitCount.count {
            if (bitCount[i] == len) {
                result.append(combination(chs, i))
            }
        }
        return result.sorted()
    }
    
    class func combination(_ chs: [String], _ mask: Int) -> String {
        var m = mask
        var i = 0
        var result = ""
        while ((m > 0) && (i < chs.count)) {
            if ((m & 1) == 1) {
                result.append(chs[i])
            }
            i += 1
            m >>= 1
        }
        return result
    }
    
    class func pow(_ base: Int, _ power: Int) -> Int {
        var result = 1
        var power = power
        var base = base

        while (power != 0){
            if (power % 2 == 1){
                result *= base
            }
            power /= 2
            base *= base
        }
        return result
    }
    
    class func countBits(_ num: Int) -> [Int] {
        var v = Array(repeating: 0, count: num + 1)
        for i in 0...num {
            v[i] = v[i / 2] + i % 2
        }
        return v
    }
}


//let obj = CombinationIterator("bvwz", 2)
//while (obj.hasNext()) {
//    print(obj.next())
//}


//[null,true,true,"bv","bw",true,true,"bz",true,true,true]
