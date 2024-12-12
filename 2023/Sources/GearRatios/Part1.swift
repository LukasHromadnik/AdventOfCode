import Foundation

enum Part1 {
    static func invoke(input: String) -> Int {
        let lines = input.split(separator: "\n")
        var result: [Int: [Range<Int>]] = .init((0..<lines.count).map { ($0, []) }, uniquingKeysWith: { $1 })
        lines
            .enumerated()
            .forEach { (offset, line) in
                line.ranges(of: /[^\\.0-9]/).forEach { symbol in
                    let range = (symbol.lowerBound.utf16Offset(in: line) - 1) ... symbol.upperBound.utf16Offset(in: line)
                    let linesRange = (offset - 1) ... (offset + 1)
                    linesRange.forEach { index in
                        lines[index].ranges(of: /\d+/).forEach {
                            let r = $0.lowerBound.utf16Offset(in: lines[index]) ..< $0.upperBound.utf16Offset(in: lines[index])
                            if r.overlaps(range) && !(result[index]!.contains(r)) {
                                result[index]!.append(r)
                            }
                        }
                    }
                }
            }

        let final = result
            .flatMap { key, ranges in
                let line = lines[key]
                return ranges.map { range in
                    let start = line.index(line.startIndex, offsetBy: range.lowerBound)
                    let end = line.index(line.startIndex, offsetBy: range.upperBound)
                    let r = start..<end
                    return String(line[r])
                }
            }
            .compactMap(Int.init)
            .reduce(0, +)

        return final
    }
}
