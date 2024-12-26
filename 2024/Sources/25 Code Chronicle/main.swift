import Foundation

let input = """
#####
.####
.####
.####
.#.#.
.#...
.....

#####
##.##
.#.##
...##
...#.
...#.
.....

.....
#....
#....
#...#
#.#.#
#.###
#####

.....
.....
#.#..
###..
###.#
###.#
#####

.....
.....
.....
#....
#.#..
#.#.#
#####
"""
let elements = mainInput.components(separatedBy: "\n\n").map { component -> [[String]] in
    component.components(separatedBy: "\n").map { Array($0).map(String.init) }
}
let height = elements[0].count - 2
var locks: [[Int]] = []
var keys: [[Int]] = []
for element in elements {
    if element[0].allSatisfy({ $0 == "#" }) {
        locks.append(decode(element))
    } else {
        keys.append(decode(element))
    }
}

func decode(_ grid: [[String]]) -> [Int] {
    var result = Array(repeating: -1, count: grid[0].count)
    for j in 0..<grid[0].count {
        for i in 0..<grid.count {
            if grid[i][j] == "#" {
                result[j] += 1
            }
        }
    }
    return result
}

var result = 0
for key in keys {
    for lock in locks {
        if zip(key, lock).map({ $0 + $1 }).allSatisfy({ $0 <= height }) {
            result += 1
        }
    }
}

print(result)
