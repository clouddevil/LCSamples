
// 380. Insert Delete GetRandom O(1)

class RandomizedSet {
    var arr = [Int]()
    var map = [Int: Int]()

    /** Initialize your data structure here. */
    init() {
    }

    /** Inserts a value to the set. Returns true if the set did not already contain the specified element. */
    func insert(_ val: Int) -> Bool {
        if map[val] != nil {
            return false
        }
        arr.append(val)
        map[val] = arr.count - 1
        return true
    }

    /** Removes a value from the set. Returns true if the set contained the specified element. */
    func remove(_ val: Int) -> Bool {
        if map[val] == nil {
            return false
        }
        let last = arr.last!
        let index = map[val]!
        arr[index] = last
        map[last] = index
        arr.removeLast()
        map[val] = nil
        return true
    }

    /** Get a random element from the set. */
    func getRandom() -> Int {
        return arr.randomElement()!
    }
}

/**
 * Your RandomizedSet object will be instantiated and called as such:
 * let obj = RandomizedSet()
 * let ret_1: Bool = obj.insert(val)
 * let ret_2: Bool = obj.remove(val)
 * let ret_3: Int = obj.getRandom()
 */
