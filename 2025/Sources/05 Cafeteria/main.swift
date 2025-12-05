import Foundation

let input = """
3-5
10-14
16-20
12-18

1
5
8
11
17
32
"""


let loaded = mainInput.split(separator: "\n\n")
let ranges = loaded[0].split(separator: "\n").map { $0.split(separator: "-") }.map {
    ClosedRange(uncheckedBounds: (
        lower: Int($0[0])!,
        upper: Int($0[1])!
    ))
}
let ids = loaded[1].split(separator: "\n").map { Int($0)! }
//print(ranges)
//print(ids)

// Part1
//let result = ids.count { id in ranges.contains { range in range.contains(id) } }

var result = [ClosedRange<Int>]()
for range in ranges {
    let indexes = (0..<result.count).filter { range.overlaps(result[$0]) }
    var bigRange = range
    indexes.forEach { i in
        bigRange = ClosedRange(uncheckedBounds: (
            lower: min(bigRange.lowerBound, result[i].lowerBound),
            upper: max(bigRange.upperBound, result[i].upperBound)
        )
        )
    }
    indexes.sorted(by: >).forEach {
        result.remove(at: $0)
    }
    result.append(bigRange)
}

//print("---")
//print(result)
print(result.map { $0.upperBound - $0.lowerBound + 1 }.reduce(0, +))
