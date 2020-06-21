import Foundation


public func duration(_ operation: ()->()) -> Double
{
    let startTime = CFAbsoluteTimeGetCurrent()
    operation()
    let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
    print("\(timeElapsed) s.")
    return timeElapsed
}
