import Foundation

let basicInput = """
3   4
4   3
2   5
1   3
3   9
3   3
"""
let basic = (basicInput, 11)
let main = (mainInput, 2285373)
let selected = main

// -PART 1
let parsed: [[Int]] = selected.0.split(separator: "\n")
    .map { $0.split(separator: " ") }
    .map { $0.map(String.init).compactMap(Int.init) }

let first = parsed.map { $0[0] }//.sorted()
let second = parsed.map { $0[1] }//.sorted()
let firstSum = first.reduce(0, +)
let secondSum = second.reduce(0, +)
print(firstSum, secondSum, abs(firstSum - secondSum))

//print(first, second)
//print(zip(first, second).map { $1 - $0 }.reduce(0, +))

let maxIndex = min(first.count, second.count)
let reduce = (0..<maxIndex).map { abs(second[$0] - first[$0]) }.reduce(0, +)
//print(reduce)
//assert(reduce == 2285373)
assert(reduce == selected.1)
// answer: 2285373
// -PART1

//let parsed: [[Int]] = mainInput.split(separator: "\n")
//    .map { $0.split(separator: " ") }
//    .map { $0.map(String.init).compactMap(Int.init) }
//
//let first = parsed.map { $0[0] }
//let second = parsed.map { $0[1] }
//let reduce = first
//    .map { num in
//        num * second.filter { $0 == num }.count
//    }
//    .reduce(0, +)
//
//print(reduce)
