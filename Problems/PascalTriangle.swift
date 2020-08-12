// 119. Pascal's Triangle II

class PascalTriangle {
    func getRow(_ rowIndex: Int) -> [Int] {
        guard rowIndex >= 0 else {
            return []
        }
        var result = Array(repeating: 0, count: rowIndex + 1)
        result[0] = 1

        var i = 1
        while (i <= rowIndex) {
            var j = i
            while (j >= 1) {
                result[j] += result[j - 1]
                j -= 1
            }
            i += 1
        }
        return result
    }

}


//PascalTriangle().getRow(20)
