import Foundation

public func pow(_ x: Int, _ y: Int) -> Int {
    (Foundation.pow(Decimal(x), y) as NSDecimalNumber).intValue
}
