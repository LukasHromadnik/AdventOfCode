import Foundation

struct Point: Hashable { let i: Int; let j: Int }

let input = """
89010123
78121874
87430965
96549874
45678903
32019012
01329801
10456732
"""

func loadInput(_ input: String) -> [[Int]] {
    input.components(separatedBy: "\n").map { Array($0).map(String.init).map { $0 == "." ? -1 : Int($0)! } }
}

func loadZeros(_ grid: [[Int]]) -> [Point] {
    var zeros: [Point] = []
    for i in 0..<grid.count {
        for j in 0..<grid[i].count {
            if grid[i][j] == 0 {
                zeros.append(Point(i: i, j: j))
            }
        }
    }

    return zeros
}

func generateNextPoints(from point: Point, grid: [[Int]]) -> [Point] {
    let nextPoints = [
        Point(i: point.i + 1, j: point.j),
        Point(i: point.i - 1, j: point.j),
        Point(i: point.i, j: point.j + 1),
        Point(i: point.i, j: point.j - 1)
    ]

    let nextPointsInBounds = nextPoints.filter {
        $0.i >= 0 && $0.i < grid.count && $0.j >= 0 && $0.j < grid[0].count
    }

    let nextPointsGradual = nextPointsInBounds.filter {
        grid[$0.i][$0.j] == grid[point.i][point.j] + 1
    }

    return nextPointsGradual
}

func part1(input: String) -> Int {
    let loaded = loadInput(input)
    return loadZeros(loaded)
        .map { search1(from: $0, grid: loaded) }
        .map(Set.init)
        .map(\.count)
        .reduce(0, +)
}

func search1(from point: Point, grid: [[Int]]) -> [Point] {
    if grid[point.i][point.j] == 9 {
        return [point]
    }

    return generateNextPoints(from: point, grid: grid)
        .flatMap { search1(from: $0, grid: grid) }
}

func part2(input: String) -> Int {
    let loaded = loadInput(input)
    return loadZeros(loaded)
        .map { search2(from: $0, grid: loaded) }
        .reduce(0, +)
}

func search2(from point: Point, grid: [[Int]]) -> Int {
    if grid[point.i][point.j] == 9 {
        return 1
    }

    return generateNextPoints(from: point, grid: grid)
        .map { search2(from: $0, grid: grid) }
        .reduce(0, +)
}

assert(part1(input: input) == 36)
assert(part1(input: mainInput) == 719)

assert(part2(input: input) == 81)
assert(part2(input: mainInput) == 1530)
