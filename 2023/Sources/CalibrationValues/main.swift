import Foundation

let input = """
dkmmzhbvq3three6threeqgcfgkv
"""
let numbers = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
func isDigit(_ input: String) -> Bool {
    ["1", "2", "3", "4", "5", "6", "7", "8", "9"].contains(input)
}
func array(_ input: String) -> [String] {
    Array(input).map(String.init)
}
func replaceFirstCharacter(of input: String, with replacement: String) -> String {
    replacement + input.suffix(max(input.count - 1, 0))
}
let result: Int = mainInput
    .components(separatedBy: "\n")
    .compactMap { item in
        var first: Int! = array(item).first(where: isDigit).flatMap(Int.init)
        var firstIndex = array(item).firstIndex(where: isDigit) ?? .max
        for (offset, number) in numbers.enumerated() {
            let adjusted = item.replacingOccurrences(of: number, with: replaceFirstCharacter(of: number, with: String(offset + 1)))
            if
                let index = array(adjusted).firstIndex(where: isDigit),
                index < firstIndex
            {
                firstIndex = index
                first = offset + 1
            }
        }

        var second: Int! = array(item).last(where: isDigit).flatMap(Int.init)
        var secondIndex = array(item).lastIndex(where: isDigit) ?? .min
        for (offset, number) in numbers.enumerated() {
            let adjusted = item.replacingOccurrences(of: number, with: replaceFirstCharacter(of: number, with: String(offset + 1)))
            if
                let index = array(adjusted).lastIndex(where: isDigit),
                index > secondIndex
            {
                secondIndex = index
                second = offset + 1
            }
        }

        return Int(first * 10 + second)
    }
    .reduce(0, +)
