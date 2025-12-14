import Foundation
import Core

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
let ranges = loaded[0].split(separator: "\n").map { ClosedRange<Int>(string: String($0), separator: "-") }
let ids = loaded[1].split(separator: "\n").map { Int($0)! }
//print(ranges)
//print(ids)

// Part1
//let result = ids.count { id in ranges.contains { range in range.contains(id) } }

var result = [ClosedRange<Int>]()
for range in ranges {
    let indexes = (0..<result.count).filter { range.overlaps(result[$0]) }
    let mergedRange = indexes.map { result[$0] }.reduce(range) { acc, next in acc.merge(with: next) }
    indexes.sorted(by: >).forEach {
        result.remove(at: $0)
    }
    result.append(mergedRange)
}

//print("---")
//print(result)
let finalResult = result.map { $0.upperBound - $0.lowerBound + 1 }.reduce(0, +)
print(finalResult)
assert(finalResult == 359526404143208)
