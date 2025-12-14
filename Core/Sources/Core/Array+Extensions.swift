import Foundation

extension Array {
    public func chunk(
        size: Int
    ) -> [[Element]] {
        precondition(size > 0, "Size has to be greater than 0")

        return stride(from: 0, to: count, by: size)
            .map { Array(self[$0..<Swift.min($0 + size, count)]) }
    }
}
