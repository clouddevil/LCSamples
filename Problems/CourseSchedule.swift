

// https://leetcode.com/problems/course-schedule/

class CourseSchedule {
    
    func isCyrcle(_ graph: [[Int]], _ visited: inout [Int], _ index: Int) -> Bool {
        if visited[index] == 1 {
            return true
        }
        if visited[index] == 0 {
            visited[index] = 1
            for e in graph[index] {
                if isCyrcle(graph, &visited, e) {
                    return true
                }
            }
        }
        
        visited[index] = 2
        return false
    }
    
    func canFinish(_ numCourses: Int, _ prerequisites: [[Int]]) -> Bool {
        
        var graph = Array(repeating: [Int](), count: numCourses)
        
        for course in prerequisites {
            graph[course[1]].append(course[0])
        }
        
        var visited = Array(repeating: 0, count: numCourses)
        for v in 0..<numCourses {
            if isCyrcle(graph, &visited, v) {
                return false
            }
        }
        
        return true
    }
    
}
