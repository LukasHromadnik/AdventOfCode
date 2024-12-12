import Foundation

let input = """
Time:      7  15   30
Distance:  9  40  200
"""

let input2 = """
Time:      71530
Distance:  940200
"""

let lines = mainInput2.components(separatedBy: "\n")
let times = lines[0].ranges(of: /\d+/).map { String(lines[0][$0]) }.compactMap(Int.init)
let distances = lines[1].ranges(of: /\d+/).map { String(lines[1][$0]) }.compactMap(Int.init)
let values = Array(zip(times, distances))

func fn(value: (Int, Int), n: Int) -> Bool {
    Double(value.1) / Double(value.0 - n) < Double(n)
}

let sum = values
    .map { value in
        let indexes = (1..<value.0)
        let first = indexes.first(where: { fn(value: value, n: $0) })!
        let last = indexes.reversed().first(where: { fn(value: value, n: $0) })!
        return last - first + 1
    }
    .reduce(1, *)
print(sum)
