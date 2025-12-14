import Foundation
import Core

let input = """
11-22,95-115,998-1012,1188511880-1188511890,222220-222224,1698522-1698528,446443-446449,38593856-38593862,565653-565659,824824821-824824827,2121212118-2121212124
"""

let ranges = mainInput
    .split(separator: ",")
    .map { ClosedRange<Int>(string: String($0), separator: "-") }

var result = 0
ranges.forEach {
    outerLoop: for i in $0 {
        let string = Array(String(i))

        let chunkSizes = part2(string)

        for chunkSize in chunkSizes {
            let chunks = string.chunk(size: chunkSize)

            let allSame = chunks.allSatisfy { chunks[0] == $0 }
            if allSame {
                result += Int(String(string))!
                continue outerLoop
            }
        }
    }
}

func part1(
    _ string: [String.Element]
) -> [Int] {
    guard string.count % 2 == 0 else { return [] }

    return [string.count / 2]
}

func part2(
    _ string: [String.Element]
) -> [Int] {
    guard string.count > 1 else { return [] }

    return (1...string.count / 2)
        .filter { string.count % $0 == 0 }
}

print(result)
assert(result == 31898925685)
