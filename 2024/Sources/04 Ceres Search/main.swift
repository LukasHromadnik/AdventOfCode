import Foundation

let input = """
MMMSXXMASM
MSAMXMSMSA
AMXSXMAAMM
MSAMASMSMX
XMASAMXAMM
XXAMMXXAMA
SMSMSASXSS
SAXAMASAAA
MAMMMXMMMM
MXMXAXMASX
"""

func solve(input: String, solution: Solution, result: Int) {
    let loaded = input.components(separatedBy: "\n").map { Array($0).map(String.init) }

    var sum = 0
    for i in 0..<loaded.count {
        for j in 0..<loaded[i].count {
            guard loaded[i][j] == solution.matchLetter else { continue }

            let indexes = solution.generateIndexes(i: i, j: j)
            let validIndexes = solution.filterInvalidIndexes(indexes, maxI: loaded.count, maxJ: loaded[i].count)
            let numberOfXmas = validIndexes
                .filter { solution.checkXmas($0, input: loaded) }
                .count
            sum += numberOfXmas
        }
    }

    assert(sum == result)
}

solve(input: input, solution: Part1(), result: 18)
solve(input: mainInput, solution: Part1(), result: 2427)
solve(input: input, solution: Part2(), result: 9)
solve(input: mainInput, solution: Part2(), result: 1900)
