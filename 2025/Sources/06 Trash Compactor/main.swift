import Foundation

let input = """
123 328  51 64 
 45 64  387 23 
  6 98  215 314
*   +   *   +  
"""

let grid = mainInput.split(separator: "\n").map(String.init)
var spaces: [Int] = [-1]
for i in 0..<grid[0].count {
    let allSpaces = (0..<grid.count).map { Array(grid[$0])[i] }.allSatisfy { $0 == " " }
    if allSpaces {
        spaces.append(i)
    }
}
spaces.append(grid[0].count)

let split = grid.map { line in
    (1..<spaces.count).map {
        let lower = spaces[$0 - 1] + 1
        let upper = spaces[$0]
        return String(Array(line)[lower..<upper])
    }
}

var result = 0
for j in 0..<split[0].count {
    let items = (0..<split.count).map { split[$0][j] }
    let problem = items.last!.trimmingCharacters(in: .whitespaces)
    let values = part2(items.dropLast())
    switch problem {
    case "+":
        result += values.reduce(0, +)
    case "*":
        result += values.reduce(1, *)
    default:
        break
    }
}

func part1(_ items: [String]) -> [Int] {
    items.map { $0.trimmingCharacters(in: .whitespaces) }.compactMap(Int.init)
}

func part2(_ items: [String]) -> [Int] {
    let length = items.map(\.count).max()!
    var values: [Int] = []
    for i in 0..<length {
        var number = ""
        for j in 0..<items.count {
            if Array(items[j])[i] == " " { continue }

            let ss = Array(items[j]).map(String.init)
            number += ss[i]
        }
        values.append(Int(number)!)
    }
    print(values)
    return values
}

print(result)
