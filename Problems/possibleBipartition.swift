
class Solution12 {
    var graph: [[Int]]!
    var color = [Int: Int]()
    
    func possibleBipartition(_ N: Int, _ dislikes: [[Int]]) -> Bool {
        
        graph = Array(repeating: [Int](), count: N + 1)
        
        for likes in dislikes {
            graph[likes[0]].append(likes[1])
            graph[likes[1]].append(likes[0])
        }
        
        for i in 1...N {
            if (color[i] == nil) && !dfs(i, 0) {
                return false
            }
        }
        
        return true
    }
    
    func dfs(_ n: Int, _ c: Int) -> Bool {
        if let v = color[n] {
            return v == c
        }
        color[n] = c
        for v in graph[n] {
            if !dfs(v, c ^ 1) {
                return false
            }
        }
        return true
    }
}


