import Foundation


func rangeBitwiseAnd(_ m: Int, _ n: Int) -> Int {
    var b = n
    while (m < b) {
        b -= (b & -b)
    }
    return b
}

//
//print(rangeBitwiseAnd(5, 7))
//print(rangeBitwiseAnd(0, 1))
//
//print(rangeBitwiseAnd(5, 17))
//print(rangeBitwiseAnd(0, 1))
//
