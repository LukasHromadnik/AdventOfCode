import Foundation

let input = """
467..114..
...*......
..35..633.
......#...
617*......
.....+.58.
..592.....
......755.
...$.*....
.664.598..
"""

let lines = mainInput.split(separator: "\n")
let result = lines
    .enumerated()
    .flatMap { (offset, line) in
        line.ranges(of: "*").map { symbol in
            let range = (symbol.lowerBound.utf16Offset(in: line) - 1) ... symbol.upperBound.utf16Offset(in: line)
            let linesRange = (offset - 1) ... (offset + 1)
            let numbers = linesRange.flatMap { index in
                lines[index].ranges(of: /\d+/).compactMap {
                    let r = $0.lowerBound.utf16Offset(in: lines[index]) ..< $0.upperBound.utf16Offset(in: lines[index])
                    if r.overlaps(range) {
                        return Int(String(lines[index][$0]))
                    } else {
                        return nil
                    }
                }
            }

            if numbers.count == 2 {
                return numbers[0] * numbers[1]
            } else {
                return 0
            }
        }
    }
    .reduce(0, +)
print(result)
