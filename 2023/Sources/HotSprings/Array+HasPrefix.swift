import Foundation

extension Array where Element: Equatable {
    func hasPrefix(_ array: Self) -> Bool {
        for i in 0..<array.count {
            if self[i] != array[i] {
                return false
            }
        }

        return true
    }
}
