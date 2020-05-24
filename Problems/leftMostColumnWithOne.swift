import Foundation



/*
func leftMostColumnWithOne(_ binaryMatrix: BinaryMatrix) -> Int {
    let mSize = binaryMatrix.dimensions()
    // if (mSize[0] <= 0) || (mSize[1] <= 0) {
    //     return -1
    // }
    var rowIndex = 0
    var cIndex = mSize[1] - 1
    var result = -1
    while (cIndex >= 0) {
        let s = binaryMatrix.get(rowIndex, cIndex)
        //print(s)
        if (s == 1) {
            result = cIndex
            cIndex -= 1
        } else {
            rowIndex += 1
            if (rowIndex >= mSize[0]) {
                break
            }
        }
    }
    return result
    
}

 */
