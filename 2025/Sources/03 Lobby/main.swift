import Foundation

let input = """
987654321111111
811111111111119
234234234234278
818181911112111
"""

let _banks = mainInput.split(separator: "\n").map(Array.init)
let banks = _banks.map { $0.map(String.init).compactMap(Int.init) }
var result = 0
var cache: [String: [Int: Int]] = [:]

func biggest(
    in bank: [Int],
    count: Int
) -> Int {
    let key = bank.map(String.init).joined()

    if count > bank.count {
        return -1
    }

    if let value = cache[key]?[count] {
        return value
    }

    if count == 1 {
        let maxValue = bank.max()!
        save(key: key, count: count, value: maxValue)
        return maxValue
    }

    let prefix = bank[0]
    let childMaxValue = biggest(
        in: Array(bank.dropFirst()),
        count: count - 1
    )
    let a = (pow(10, count - 1) as NSDecimalNumber).intValue
    let maxValue1 = childMaxValue + a * prefix

    let maxValue2 = biggest(
        in: Array(bank.dropFirst()),
        count: count
    )

    let maxValue = max(maxValue1, maxValue2)
    save(key: key, count: count, value: maxValue)

    return maxValue
}

func save(
    key: String,
    count: Int,
    value: Int
) {
    if cache[key] == nil {
        cache[key] = [:]
    }

    cache[key]![count] = value
}

let count = 12
for bank in banks {
    var maxValue: Int = -1
    for i in 0..<bank.count - count {
        let big = biggest(in: Array(bank.dropFirst(i)), count: count)
        maxValue = max(big, maxValue)
    }
    result += maxValue
}
print(result)
