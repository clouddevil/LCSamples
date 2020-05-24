import Foundation

public class GroupAnagrams {
    public init() {}
    
    public func groupAnagrams(_ strs: [String]) -> [[String]] {
        var hash = [String: [String]]()
        strs.forEach { (s) in
            let key = String(s.sorted())
            
            if var value = hash[key] {
                value.append(s)
            } else {
                hash[key] = [s]
            }
        }
        return hash.map { $1 } 
    }
}
