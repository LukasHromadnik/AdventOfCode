import Foundation

let input = """
0 3 6 9 12 15
1 3 6 10 15 21
10 13 16 21 30 45
"""

let input2 = """
1 3 6 10 15 21
"""

let result = mainInput.components(separatedBy: "\n")
    .map { line in
        let numbers = line.components(separatedBy: " ").compactMap(Int.init)
        var result: [Int] = [
            numbers.last!
//            numbers.first!
        ]
        var diffs = numbers
        while true {
            diffs = (1..<diffs.count).map { diffs[$0] - diffs[$0 - 1] }
            result.append(
                diffs.last!
//                diffs.first!
            )
            if diffs.allSatisfy({ $0 == 0 }) {
                break
            }
        }
        let value = result.reversed().dropFirst().reduce(into: result.reversed().first!) { acc, next in
            acc = next + acc
        }
        return value
    }
    .reduce(0, +)

print(result)
