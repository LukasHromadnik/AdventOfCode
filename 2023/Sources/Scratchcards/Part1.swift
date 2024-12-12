import Foundation

enum Part1 {
    static func invoke(_ input: String) -> Decimal {
        input.components(separatedBy: "\n")
            .compactMap { line in
                let numbers = line.components(separatedBy: ":")[1]
                let parts = numbers.components(separatedBy: " | ")
                let winningNumber = parts[0]
                let myNumbers = parts[1]

                let winning = winningNumber.ranges(of: /\d+/).compactMap {
                    Int(winningNumber[$0])
                }
                let my = myNumbers.ranges(of: /\d+/).compactMap {
                    Int(myNumbers[$0])
                }
                let exp = Set(winning).intersection(Set(my)).count
                if exp - 1 >= 0 {
                    return pow(2, exp - 1)
                } else {
                    return nil
                }
            }
            .reduce(0, +)
    }
}
