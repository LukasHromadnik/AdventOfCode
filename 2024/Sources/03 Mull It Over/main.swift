import Foundation

let basic1 = ("xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))", 161)
let basic2 = ("xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))", 48)
let main1 = (mainInput, 166357705)
let main2 = (mainInput, 88811886)
let selected = main1
let input = selected.0

let muls = input.matches(of: /mul\((\d{1,3}),(\d{1,3})\)/)
let dos = input.matches(of: /do\(\)/)
let donts = input.matches(of: /don\'t\(\)/)

var isEnabled = true
var sum = 0

var indexes: [String.Index] = []
indexes.append(contentsOf: donts.map(\.range.lowerBound))
indexes.append(contentsOf: dos.map(\.range.lowerBound))
indexes.append(contentsOf: muls.map(\.range.lowerBound))
indexes.sort()

for index in indexes {
    if donts.contains(where: { $0.range.lowerBound == index }) {
        isEnabled = false
    } else if dos.contains(where: { $0.range.lowerBound == index }) {
        isEnabled = true
    }

    guard isEnabled else { continue }

    if let mul = muls.first(where: { $0.range.lowerBound == index }) {
        let result = input[mul.range]
            .dropFirst(4)
            .dropLast()
            .split(separator: ",")
            .map(String.init)
            .compactMap(Int.init)
            .reduce(1, *)
        sum += result
    }
}

print(sum)
