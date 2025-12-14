import Foundation

extension ClosedRange {
    public func merge(with other: Self) -> Self {
        ClosedRange(
            uncheckedBounds: (
                lower: Swift.min(lowerBound, other.lowerBound),
                upper: Swift.max(upperBound, other.upperBound)
            )
        )
    }
}

extension ClosedRange where Bound == Int {
    public init(string: String, separator: String) {
        let bounds = string.split(separator: separator).map(String.init).compactMap(Int.init)
        self.init(
            uncheckedBounds: (
                lower: bounds[0],
                upper: bounds[1]
            )
        )
    }
}
