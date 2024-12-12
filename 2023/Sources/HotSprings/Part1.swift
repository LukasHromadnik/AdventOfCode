enum Part1 {
    static func invoke(_ input: String) -> Int {
        input.components(separatedBy: "\n").map { computeCombinations(line: $0) }.reduce(0, +)
    }

    static func computeCounts(text: String, offset: Int, counts: [Int], totalNumberOfHashes: Int) -> Int {
        for i in offset..<text.count {
            let index = text.index(text.startIndex, offsetBy: i)
            if text[index] == "?" {
                var newText = Array(text)

                let numberOfHashes = text.filter { $0 == "#" }.count
                let first: Int
                if numberOfHashes < totalNumberOfHashes {
                    newText[i] = "#"
                    first = computeCounts(text: String(newText), offset: i + 1, counts: counts, totalNumberOfHashes: totalNumberOfHashes)
                } else {
                    first = 0
                }

                newText[i] = "."
                let second = computeCounts(text: String(newText), offset: i + 1, counts: counts, totalNumberOfHashes: totalNumberOfHashes)
                return first + second
            }
        }

        let isValid = text.ranges(of: /#+/)
            .map { $0.upperBound.utf16Offset(in: text) - $0.lowerBound.utf16Offset(in: text) }
        == counts
        return isValid ? 1 : 0
    }

    static func computeCombinations(line: String, multiplier: Int = 1) -> Int {
        let parts = line.components(separatedBy: " ")
        let text = (0..<multiplier).map { _ in parts[0] }.joined(separator: "?")
        let counts = (0..<multiplier).flatMap { _ in parts[1].components(separatedBy: ",").compactMap(Int.init) }

        return computeCounts(text: text, offset: 0, counts: counts, totalNumberOfHashes: counts.reduce(0, +))
    }
}
