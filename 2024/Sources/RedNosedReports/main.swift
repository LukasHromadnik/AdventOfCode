import Foundation

let input = """
7 6 4 2 1
1 2 7 8 9
9 7 6 2 1
1 3 2 4 5
8 6 4 4 1
1 3 6 7 9
"""

// Part 1
let basic = (input, 2)
let main = (mainInput, 332)

func loadInput(_ input: String) -> [[Int]] {
    input.components(separatedBy: "\n")
        .map { $0.components(separatedBy: " ").compactMap(Int.init) }
}

func computeDifferences(_ input: [Int]) -> [Int] {
    (1..<input.count).map {
        input[$0 - 1] - input[$0]
    }
}

func checkValidity(_ input: [Int]) -> Bool {
    let isPositiveValid = input.allSatisfy { $0 > 0 }
    let isNegativeValid = input.allSatisfy { $0 < 0 }
    let isWithinRangeValid = input.allSatisfy { abs($0) <= 3 }

    return (isPositiveValid || isNegativeValid) && isWithinRangeValid
}

[main].forEach { selected in
    let input = loadInput(selected.0)
    let result = input
        .filter { item in
            let validSubItems = (0..<item.count).map { index -> Bool in
                var subItem = item
                subItem.remove(at: index)

                return checkValidity(computeDifferences(subItem))
            }
            print(validSubItems)
            return validSubItems.contains(true)
        }
        .count

    print(result)
}

