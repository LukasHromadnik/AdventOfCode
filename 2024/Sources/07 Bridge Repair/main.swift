import Foundation

Day6Hard().solve()
exit(0)

let input = """
190: 10 19
3267: 81 40 27
83: 17 5
156: 15 6
7290: 6 8 6 15
161011: 16 10 13
192: 17 8 14
21037: 9 7 18 13
292: 11 6 16 20
"""

struct Input {
    let result: Int
    let components: [Int]
}

extension RangeReplaceableCollection where Self: StringProtocol {
    func paddingToLeft(upTo length: Int, using element: Element = " ") -> SubSequence {
        return repeatElement(element, count: Swift.max(0, length-count)) + suffix(Swift.max(count, count-length))
    }
}

let lines = mainInput.components(separatedBy: "\n").map { line in
    let c1 = line.components(separatedBy: ": ")
    let result = Int(c1[0])!
    let c2 = c1[1].components(separatedBy: " ").compactMap(Int.init)
    return Input(result: result, components: c2)
}

let validLines = lines.filter { line in
    let numberOfOperations = line.components.count - 1
    let numberOfCombinations = Int(pow(3, Double(numberOfOperations)))
    let combinations = (0..<numberOfCombinations).map {
        Array(String($0, radix: 3).paddingToLeft(upTo: numberOfOperations, using: "0"))
    }
    return combinations.contains { combination in
        var result = line.components[0]
        for j in 1..<line.components.count {
            let op = combination[j - 1]
            if op == "0" {
                result += line.components[j]
            } else if op == "1" {
                result *= line.components[j]
            } else if op == "2" {
                result = Int(String(result) + String(line.components[j]))!
            }
        }
        return result == line.result
    }
}

let result = validLines.map(\.result).reduce(0, +)
//assert(result == 3749)
print(result)
