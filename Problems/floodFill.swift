import Foundation



class Solution1dsd {
    
    var newImage: [[Int]]!
    var newClr: Int = 0
    var repClr: Int = 0
    
    func dfs( _ sr: Int, _ sc: Int ) {
        if (newImage[sr][sc] == repClr) {
            newImage[sr][sc] = newClr
            if (sr > 0) {
                dfs(sr - 1, sc)
            }
            if (sc > 0) {
                dfs(sr, sc - 1)
            }
            if (sr + 1 < newImage.count) {
                dfs(sr + 1, sc)
            }
            if (sc + 1 < newImage[0].count) {
                dfs(sr, sc + 1)
            }
        }
    }
    
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ newColor: Int) -> [[Int]] {
        newImage = image
        newClr = newColor
        repClr = newImage[sr][sc]
        if (repClr != newClr) {
            dfs(sr, sc)
        }
        return newImage
    }

}
