import Foundation

let input = """
seeds: 79 14 55 13

seed-to-soil map:
50 98 2
52 50 48

soil-to-fertilizer map:
0 15 37
37 52 2
39 0 15

fertilizer-to-water map:
49 53 8
0 11 42
42 0 7
57 7 4

water-to-light map:
88 18 7
18 25 70

light-to-temperature map:
45 77 23
81 45 19
68 64 13

temperature-to-humidity map:
0 69 1
1 0 69

humidity-to-location map:
60 56 37
56 93 4
"""

let categories = mainInput.components(separatedBy: "\n\n")

let seedRanges = categories[0].ranges(of: /\d+ \d+/)
    .map {
        let parts = categories[0][$0].components(separatedBy: " ").compactMap(Int.init)
        return parts[0] ..< parts[0] + parts[1]
    }
let mappings = categories.dropFirst().map { category in
    category
        .components(separatedBy: "\n")
        .dropFirst()
        .map { $0.components(separatedBy: " ").compactMap(Int.init) }
        .map { DSRange(destination: $0[0], source: $0[1], count: $0[2]) }
}
var ranges = seedRanges
for mapping in mappings {
    ranges = mapRanges(from: ranges, categoryRanges: mapping)
}

func mapRanges(from: [Range<Int>], categoryRanges: [DSRange]) -> [Range<Int>] {
    var rangesToSolve = from
    var ranges: [Range<Int>] = []
    while !rangesToSolve.isEmpty {
        guard let range = rangesToSolve.popLast() else { break }
        var isFound = false

        for soil in categoryRanges {
            if soil.sourceRange.overlaps(range) {
                if range.lowerBound < soil.sourceRange.lowerBound && range.upperBound > soil.sourceRange.upperBound {
                    let left = range.lowerBound ..< soil.sourceRange.lowerBound
                    let right = soil.sourceRange.upperBound ..< range.upperBound
                    rangesToSolve.append(contentsOf: [left, right])
                    ranges.append(soil.sourceRange)
                } else if range.lowerBound < soil.sourceRange.lowerBound && range.upperBound <= soil.sourceRange.upperBound {
                    let left = range.lowerBound ..< soil.sourceRange.lowerBound
                    let right = soil.sourceRange.lowerBound ..< range.upperBound
                    rangesToSolve.append(left)
                    ranges.append(right)
                } else if range.lowerBound >= soil.sourceRange.lowerBound && range.upperBound > soil.sourceRange.upperBound {
                    let left = range.lowerBound ..< soil.sourceRange.upperBound
                    let right = soil.sourceRange.upperBound ..< range.upperBound
                    rangesToSolve.append(right)
                    ranges.append(left)
                } else {
                    ranges.append(range)
                }

                isFound = true
                break
            }
        }

        if !isFound {
            ranges.append(range)
        }
    }
    return ranges.map { inputRange in
        if let range = categoryRanges.first(where: { $0.sourceRange.overlaps(inputRange) }) {
            assert(inputRange.lowerBound >= range.sourceRange.lowerBound && inputRange.upperBound <= range.sourceRange.upperBound)
            let start = inputRange.lowerBound - range.sourceRange.lowerBound + range.destination
            let end = start + inputRange.count
            return start ..< end
        } else {
            return inputRange
        }
    }
}

print(ranges.map(\.lowerBound).min()!)

/*
 let result = seedRanges.flatMap { range in
 range.map {
 var index = $0
 for ranges in mappings {
 for range in ranges {
 if range.sourceRange.contains(index) {
 index = index - range.sourceRange.lowerBound + range.destination
 break
 }
 }
 }
 return index
 }
 }
 .min()!
 print(result)
 */
