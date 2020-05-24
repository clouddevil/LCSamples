import Foundation

func findComplement(_ num: Int) -> Int {
    var s = 1
    while (s <= num) {
        s <<= 1
    }
    return s - 1 - num
}

//findComplement(0)
//findComplement(5)
//findComplement(7)
//findComplement(1)
//findComplement(10)
//1 << 1
//2 << 1
//
