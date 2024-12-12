import Foundation

let input = """
#.#####################
#.......#########...###
#######.#########.#.###
###.....#.>.>.###.#.###
###v#####.#v#.###.#.###
###.>...#.#.#.....#...#
###v###.#.#.#########.#
###...#.#.#.......#...#
#####.#.#.#######.#.###
#.....#.#.#.......#...#
#.#####.#.#.#########v#
#.#...#...#...###...>.#
#.#.#v#######v###.###v#
#...#.>.#...>.>.#.###.#
#####v#.#.###v#.#.###.#
#.....#...#...#.#.#...#
#.#########.###.#.#.###
#...###...#...#...#.###
###.###.#.###v#####v###
#...#...#.#.>.>.#.>.###
#.###.###.#.###.#.#v###
#.....###...###...#...#
#####################.#
"""

struct Coord: Hashable, CustomStringConvertible {
    let x: Int
    let y: Int

    var description: String {
        "(\(x), \(y))"
    }

    init(_ x: Int, _ y: Int) {
        self.x = x
        self.y = y
    }
}

let graph = mainInput.components(separatedBy: "\n").map(Array.init)
let start = Coord(0, 1)
let end = Coord(graph.count - 1, graph.last!.count - 2)

var junctions: [Coord] = []

for i in 0..<graph.count {
    for j in 0..<graph[0].count {
        let coord = Coord(i, j)
        
        if graph[coord.x][coord.y] == "#" { continue }

        let left = Coord(coord.x, coord.y - 1)
        let right = Coord(coord.x, coord.y + 1)
        let up = Coord(coord.x - 1, coord.y)
        let down = Coord(coord.x + 1, coord.y)

        let directions = [up, down, left, right]
            .filter { coord -> Bool in
                guard
                    coord.x >= 0 && coord.x <= graph.count - 1 && coord.y >= 0 && coord.y <= graph[0].count - 1
                else { return false }
                return graph[coord.x][coord.y] != "#"
            }

        if directions.count > 2 {
            junctions.append(coord)
        }
    }
}

func search(from: Coord, to: Coord, skip: Set<Coord> = []) -> Int {
    var visited: Set<Coord> = []
    var queue = [(from, 0)]

    while !queue.isEmpty {
        let (lastCoord, cost) = queue.removeFirst()
        visited.insert(lastCoord)

        if lastCoord == to {
            return cost
        }

        if skip.contains(lastCoord) {
            continue
        }

        let left = Coord(lastCoord.x, lastCoord.y - 1)
        let right = Coord(lastCoord.x, lastCoord.y + 1)
        let up = Coord(lastCoord.x - 1, lastCoord.y)
        let down = Coord(lastCoord.x + 1, lastCoord.y)

        [up, down, left, right]
            .filter { coord -> Bool in
                guard !visited.contains(coord) else { return false }
                guard coord.x >= 0 && coord.x <= graph.count - 1 && coord.y >= 0 && coord.y <= graph[0].count - 1 else { return false }

                let symbol = graph[coord.x][coord.y]
                let isOnPath = symbol != "#"
//                let isNotOnSlide: Bool = if coord == up && symbol == "v" { false }
//                else if coord == down && symbol == "^" { false }
//                else if coord == left && symbol == ">" { false }
//                else if coord == right && symbol == "<" { false }
//                else { true }

                return isOnPath// && isNotOnSlide
            }
            .forEach {
                queue.append(($0, cost + 1))
            }
    }

    return -1
}

junctions.append(contentsOf: [start, end])

var costs = Array(
    repeating: Array(
        repeating: -1,
        count: junctions.count
    ),
    count: junctions.count
)

for i in 0..<junctions.count {
    for j in 0..<junctions.count {
        if i == j { continue }
        let from = junctions[i]
        let to = junctions[j]
        var skip = junctions
        skip.remove(at: max(i, j))
        skip.remove(at: min(i, j))
        costs[i][j] = search(from: from, to: to, skip: Set(skip))
    }
}
//print(junctions)
//print(junctions.enumerated().map { costs[$0.offset].filter { $0 > -1 }.count })
//print(costs)

class Path {
    var coords: [Int]

    init(coords: [Int]) {
        self.coords = coords
    }
}

var queue = [Path(coords: [junctions.count - 2])]
var maxCost = 0
var loop = 0
while !queue.isEmpty {
    loop += 1
    if loop % 100_000 == 0 {
        print(queue.count)
        print(queue.map { $0.coords.count }.max()!)
    }

    let lastPath = queue.popLast()!
    let index = lastPath.coords.last!

    if index == junctions.count - 1 {
        let from = lastPath.coords.dropLast()
        let to = lastPath.coords.dropFirst()
        let cost = zip(from, to).map { costs[$0.0][$0.1] }.reduce(0, +)
        maxCost = max(maxCost, cost)
        continue
    }

    let neighbors = costs[index].enumerated().filter { $0.element > -1 }.map(\.offset)
    neighbors
        .filter { !lastPath.coords.contains($0) }
        .forEach {
            let path = Path(coords: lastPath.coords + [$0])
            queue.append(path)
        }
}
print()
print(maxCost)


/*
while !queue.isEmpty {
    loop += 1
    if loop % 1000 == 0 {
        print(queue.count)
    }
    let lastPath = queue.removeFirst()
    let lastCoord = lastPath.coords.last!
//    print(queue.count, lastCoord)

    if lastCoord == end {
        cost = max(cost, lastPath.coords.count - 1)
        continue
    }

    let left = Coord(lastCoord.x, lastCoord.y - 1)
    let right = Coord(lastCoord.x, lastCoord.y + 1)
    let up = Coord(lastCoord.x - 1, lastCoord.y)
    let down = Coord(lastCoord.x + 1, lastCoord.y)

    let directions = [up, down, left, right]
        .compactMap { $0 }
        .filter { coord -> Bool in
            guard !lastPath.coords.contains(where: { $0 == coord }) else { return false }
            guard coord.x >= 0 && coord.x <= graph.count - 1 && coord.y >= 0 && coord.y <= graph[0].count - 1 else { return false }

            let symbol = graph[coord.x][coord.y]
            let isOnPath = symbol != "#"
//            let isNotOnSlide: Bool = if coord == up && symbol == "v" { false }
//            else if coord == down && symbol == "^" { false }
//            else if coord == left && symbol == ">" { false }
//            else if coord == right && symbol == "<" { false }
//            else { true }

            return isOnPath// && isNotOnSlide
        }

    if directions.count == 1 {
        lastPath.coords.append(directions[0])
        queue.append(lastPath)
    } else {
        directions.forEach {
            let path = Path(coords: lastPath.coords + [$0])
            queue.append(path)
        }
    }
}

print()
print(cost)
*/
