// 957. Prison Cells After N Days

 
class PrisonCellsAfterNDays
{
    func prisonAfterNDays(_ cells: [Int], _ N: Int) -> [Int] {
        var bak = cells
        bak[0] = 0
        bak[7] = 0
        
        var bak2 = cells
        var loop = (N - 1) % 14
        while (loop >= 0) {
            for i in 1..<(bak2.count - 1) {
                bak[i] = (bak2[i - 1] == bak2[i + 1]) ? 1 : 0
            }
            bak2 = bak
            loop -= 1
        }
        return bak2
    }
}

//var v = PrisonCellsAfterNDays()
//
//v.prisonAfterNDays([0,1,0,1,1,0,0,1], 0)
//v.prisonAfterNDays([0,1,0,1,1,0,0,1], 1)
//v.prisonAfterNDays([0,1,0,1,1,0,0,1], 2)
//v.prisonAfterNDays([0,1,0,1,1,0,0,1], 3)
//v.prisonAfterNDays([0,1,0,1,1,0,0,1], 4)
//v.prisonAfterNDays([0,1,0,1,1,0,0,1], 5)
//v.prisonAfterNDays([0,1,0,1,1,0,0,1], 6)
//v.prisonAfterNDays([0,1,0,1,1,0,0,1], 7)  // [0,0,1,1,0,0,0,0]
//v.prisonAfterNDays([0,1,0,1,1,0,0,1], 8)
//v.prisonAfterNDays([0,1,0,1,1,0,0,1], 9)
//
//v.prisonAfterNDays([1,0,0,1,0,0,1,0], 1000000000) // [0,0,1,1,1,1,1,0]
