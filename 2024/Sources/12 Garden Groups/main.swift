import Foundation
struct Point: Hashable, CustomStringConvertible {
    let i: Int
    let j: Int

    var description: String {
        "(\(i), \(j))"
    }
}

extension String {
    init(unicodeValue: UInt32) {
        self.init(Character(UnicodeScalar(unicodeValue)!))
    }
}

//let input = """
//AAAA
//BBCD
//BBCC
//EEEC
//"""
//let input = """
//OOOOO
//OXOXO
//OOOOO
//OXOXO
//OOOOO
//"""
let input = """
RRRRIICCFF
RRRRIICCCF
VVRRRCCFFF
VVRCCCJFFF
VVVVCJJCFE
VVIVCCJJEE
VVIIICJJEE
MIIIIIJJEE
MIIISIJEEE
MMMISSJEEE
"""
//let input = """
//ABABA
//ABABA
//AAAAA
//"""
//let input = """
//AAA
//ABB
//AAA
//ABB
//AAA
//"""
//let input = """
//AAAAAA
//AAABBA
//AAABBA
//ABBAAA
//ABBAAA
//AAAAAA
//"""
var loaded = inputMacik.components(separatedBy: "\n").map { Array($0).map(String.init) }

//let value = "a".unicodeScalars.first!.value // 97
//let aValue = "A".unicodeScalars.first!.value // 65
//let char = String(unicodeValue: 97)
//print(char)

var groupCounter: UInt32 = 0

for i in 0..<loaded.count {
    for j in 0..<loaded[i].count {
        let letter = loaded[i][j]
        let unicodeValue = letter.unicodeScalars.first!.value
        if unicodeValue < 97 {
            makeGroup(groupCounter, from: Point(i: i, j: j))
            groupCounter += 1
        }
    }
}

func makeGroup(_ value: UInt32, from point: Point) {
    let letter = loaded[point.i][point.j]

    guard letter.unicodeScalars.first!.value < 97 else { return }
    loaded[point.i][point.j] = String(unicodeValue: 97 + value)

    let nextPoints = [
        Point(i: point.i - 1, j: point.j),
        Point(i: point.i, j: point.j - 1),
        Point(i: point.i, j: point.j + 1),
        Point(i: point.i + 1, j: point.j)
    ]
        .filter { $0.i >= 0 && $0.i < loaded.count && $0.j >= 0 && $0.j < loaded[0].count }
        .filter { loaded[$0.i][$0.j] == letter }

    nextPoints.forEach {
        makeGroup(value, from: $0)
    }
}

var groups: [String: [Point]] = [:]
for i in 0..<loaded.count {
    for j in 0..<loaded[0].count {
        let letter = loaded[i][j]
        let points = groups[letter] ?? []
        groups[letter] = points + [Point(i: i, j: j)]
    }
}

for i in 0..<loaded.count {
    for j in 0..<loaded[i].count {
        print(loaded[i][j], terminator: "")
    }
    print()
}

var result = 0
groups.forEach { key, points in
//    let key = "a"
//    let points = groups[key] ?? []
    var rows: [Int: [Int]] = [:]
    for point in points {
        let row = rows[point.i] ?? []
        rows[point.i] = row + [point.j]
    }
    let minRowKey = rows.map { $0.key }.min()!
    var _rows: [[Int]] = Array(repeating: [], count: rows.count)
    rows.forEach { key, values in
        _rows[key - minRowKey] = values
    }
    _rows = [[]] + _rows + [[]]
//    print(_rows)
    var rowSides = 0
    for i in 0..<_rows.count - 1 {
        var lhs = Set(_rows[i])
        var rhs = Set(_rows[i + 1])
        lhs.intersection(rhs).forEach { lhs.remove($0); rhs.remove($0) }

        let lhsSorted = Array(lhs).sorted()
        let rhsSorted = Array(rhs).sorted()

        var sides = 0
        for j in 0..<lhsSorted.count {
            let previous = j == 0 ? Int.min : lhsSorted[j - 1]
            if previous + 1 < lhsSorted[j] {
                sides += 1
            }
        }

        for j in 0..<rhsSorted.count {
            let previous = j == 0 ? Int.min : rhsSorted[j - 1]
            if previous + 1 < rhsSorted[j] {
                sides += 1
            }
        }

//        print("sides", sides)

        rowSides += sides
    }


    var cols: [Int: [Int]] = [:]
    for point in points {
        let col = cols[point.j] ?? []
        cols[point.j] = col + [point.i]
    }
    let minColKey = cols.map { $0.key }.min()!
    var _cols: [[Int]] = Array(repeating: [], count: cols.count)
    cols.forEach { key, values in
        _cols[key - minColKey] = values
    }
    _cols = [[]] + _cols + [[]]
//    print(_cols)
    var colSides = 0
    for i in 0..<_cols.count - 1 {
        var lhs = Set(_cols[i])
        var rhs = Set(_cols[i + 1])
        lhs.intersection(rhs).forEach { lhs.remove($0); rhs.remove($0) }

        let lhsSorted = Array(lhs).sorted()
        let rhsSorted = Array(rhs).sorted()

        var sides = 0
        for j in 0..<lhsSorted.count {
            let previous = j == 0 ? Int.min : lhsSorted[j - 1]
            if previous + 1 < lhsSorted[j] {
                sides += 1
            }
        }

        for j in 0..<rhsSorted.count {
            let previous = j == 0 ? Int.min : rhsSorted[j - 1]
            if previous + 1 < rhsSorted[j] {
                sides += 1
            }
        }

//        print("sides", sides)

        colSides += sides
    }

    result += points.count * (rowSides + colSides)

//    print(key, rowSides + colSides, rowSides, colSides)
}
print(result)


//let result = groups
//    .map { key, points in
//        var sum = 0
//        for point in points {
//            let nextPoints = [
//                Point(i: point.i + 1, j: point.j),
//                Point(i: point.i - 1, j: point.j),
//                Point(i: point.i, j: point.j + 1),
//                Point(i: point.i, j: point.j - 1)
//            ].filter { $0.i >= 0 && $0.i < loaded.count && $0.j >= 0 && $0.j < loaded[0].count }
//
//            let neighbors = nextPoints.map { loaded[$0.i][$0.j] }.filter { $0 == key }.count
//            sum += 4 - neighbors
//        }
//        return sum * points.count
//    }
//    .reduce(0, +)
//
//print(result)
