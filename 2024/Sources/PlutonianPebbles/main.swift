import Foundation

//let input = "125 17"
let input = mainInput
let numberOfBlinks = 75

func nextStep(_ value: Int) -> [Int] {
    let numberOfDigits = String(value).count
    if value == 0 {
        return [1]
    } else if numberOfDigits % 2 == 0 {
        let split = (pow(10, numberOfDigits / 2) as NSDecimalNumber).intValue
        let lhs = value / split
        let rhs = value % split
        return [lhs, rhs]
    } else {
        return [value * 2024]
    }
}

struct Item: Hashable {
    let value: Int
    let count: Int
}

var db: [Item: Int] = [:]

func solve(_ item: Item) -> Int {
    if let result = db[item] {
        return result
    }

    if item.count == 0 {
        db[item] = 1
        return 1
    }

    let next = nextStep(item.value)
    let numberOfSteps = next
        .map {
            solve(Item(value: $0, count: item.count - 1))
        }
        .reduce(0, +)
    db[item] = numberOfSteps
    return numberOfSteps
}

let result = input.components(separatedBy: " ").compactMap(Int.init).map {
    solve(Item(value: $0, count: numberOfBlinks))
}
.reduce(0, +)
print(result)
