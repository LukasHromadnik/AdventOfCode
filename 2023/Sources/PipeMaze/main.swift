import Foundation

let input = """
.....
.S-7.
.|.|.
.L-J.
.....
"""

let input2 = """
..F7.
.FJ|.
SJ.L7
|F--J
LJ...
"""

let input3 = """
...........
.S-------7.
.|F-----7|.
.||.....||.
.||.....||.
.|L-7.F-J|.
.|..|.|..|.
.L--J.L--J.
...........
"""

let input4 = """
OF----7F7F7F7F-7OOOO
O|F--7||||||||FJOOOO
O||OFJ||||||||L7OOOO
FJL7L7LJLJ||LJIL-7OO
L--JOL7IIILJS7F-7L7O
OOOOF-JIIF7FJ|L7L7L7
OOOOL7IF7||L7|IL7L7|
OOOOO|FJLJ|FJ|F7|OLJ
OOOOFJL-7O||O||||OOO
OOOOL---JOLJOLJLJOOO
"""

let north = ["|", "7", "F"]
let south = ["|", "L", "J"]
let west = ["-", "F", "L"]
let east = ["-", "7", "J"]
var lines = mainInput.components(separatedBy: "\n").map(Array.init)
let sIndex = lines.enumerated().filter { $0.element.contains("S") }.map { ($0.offset, Int($0.element.firstIndex(of: "S")!)) }.first!
var indexes: [(Int, Int)] = []
var steps = 0
var currentIndex = sIndex
var fromIndex: (Int, Int)!
func setNewIndex(_ index: (Int, Int)) {
    indexes.append(currentIndex)
    fromIndex = currentIndex
    currentIndex = index
    steps += 1
}

repeat {
    switch lines[currentIndex.0][currentIndex.1] {
    case "S":
        if currentIndex.1 > 0 {
            let newIndex = (currentIndex.0, currentIndex.1 - 1)
            if west.contains(String(lines[newIndex.0][newIndex.1])) {
                setNewIndex(newIndex)
                break
            }
        }
        if currentIndex.0 < lines.count - 1 {
            let newIndex = (currentIndex.0 + 1, currentIndex.1)
            if south.contains(String(lines[newIndex.0][newIndex.1])) {
                setNewIndex(newIndex)
                break
            }
        }
        if currentIndex.1 < lines[currentIndex.0].count - 1 {
            let newIndex = (currentIndex.0, currentIndex.1 + 1)
            if east.contains(String(lines[newIndex.0][newIndex.1])) {
                setNewIndex(newIndex)
                break
            }
        }
        if currentIndex.0 > 0 {
            let newIndex = (currentIndex.0 - 1, currentIndex.1)
            if north.contains(String(lines[newIndex.0][newIndex.1])) {
                setNewIndex(newIndex)
                break
            }
        }
    case "|":
        let newIndex = [(currentIndex.0 + 1, currentIndex.1), (currentIndex.0 - 1, currentIndex.1)].filter { $0 != fromIndex }.first!
        setNewIndex(newIndex)
    case "F":
        let newIndex = [(currentIndex.0 + 1, currentIndex.1), (currentIndex.0, currentIndex.1 + 1)].filter { $0 != fromIndex }.first!
        setNewIndex(newIndex)
    case "-":
        let newIndex = [(currentIndex.0, currentIndex.1 - 1), (currentIndex.0, currentIndex.1 + 1)].filter { $0 != fromIndex }.first!
        setNewIndex(newIndex)
    case "7":
        let newIndex = [(currentIndex.0, currentIndex.1 - 1), (currentIndex.0 + 1, currentIndex.1)].filter { $0 != fromIndex }.first!
        setNewIndex(newIndex)
    case "J":
        let newIndex = [(currentIndex.0 - 1, currentIndex.1), (currentIndex.0, currentIndex.1 - 1)].filter { $0 != fromIndex }.first!
        setNewIndex(newIndex)
    case "L":
        let newIndex = [(currentIndex.0, currentIndex.1 + 1), (currentIndex.0 - 1, currentIndex.1)].filter { $0 != fromIndex }.first!
        setNewIndex(newIndex)
    default:
        assertionFailure()
    }
} while currentIndex != sIndex

/*
indexes.append(indexes[0])
var sum = 0
for i in 0..<indexes.count - 1 {
    let (x1, y1) = indexes[i]
    let (x2, y2) = indexes[i + 1]
    sum += (x1 * y2) - (x2 * y1)
}

print(Double(sum / 2) - Double(steps / 2) + 1)
*/
