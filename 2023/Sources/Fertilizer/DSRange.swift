import Foundation

struct DSRange {
    let destination: Int
    let source: Int
    let count: Int

    var sourceRange: Range<Int> {
        source ..< (source + count)
    }
}
