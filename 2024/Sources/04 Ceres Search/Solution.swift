import Foundation

protocol Solution {
    var matchLetter: String { get }

    func generateIndexes(i: Int, j: Int) -> [[(Int, Int)]]
    func filterInvalidIndexes(_ indexes: [[(Int, Int)]], maxI: Int, maxJ: Int) -> [[(Int, Int)]]
    func checkXmas(_ indexes: [(Int, Int)], input: [[String]]) -> Bool
}

extension Solution {
    func filterInvalidIndexes(
        _ indexes: [[(Int, Int)]],
        maxI: Int,
        maxJ: Int
    ) -> [[(Int, Int)]] {
        indexes.filter { item in
            item.allSatisfy {
                $0.0 >= 0 && $0.0 < maxI && $0.1 >= 0 && $0.1 < maxJ
            }
        }
    }
}

final class Part1: Solution {
    let matchLetter = "X"
    
    func generateIndexes(
        i: Int,
        j: Int
    ) -> [[(Int, Int)]] {
        [
            [(i, j), (i + 1, j), (i + 2, j), (i + 3, j)],
            [(i, j), (i - 1, j), (i - 2, j), (i - 3, j)],
            [(i, j), (i, j + 1), (i, j + 2), (i, j + 3)],
            [(i, j), (i, j - 1), (i, j - 2), (i, j - 3)],

            [(i, j), (i + 1, j + 1), (i + 2, j + 2), (i + 3, j + 3)],
            [(i, j), (i - 1, j - 1), (i - 2, j - 2), (i - 3, j - 3)],
            [(i, j), (i + 1, j - 1), (i + 2, j - 2), (i + 3, j - 3)],
            [(i, j), (i - 1, j + 1), (i - 2, j + 2), (i - 3, j + 3)]
        ]
    }

    func checkXmas(
        _ indexes: [(Int, Int)],
        input: [[String]]
    ) -> Bool {
        let xmas = ["X", "M", "A", "S"]
        let letters = indexes.map { String(input[$0.0][$0.1]) }
        return zip(xmas, letters).allSatisfy { $0 == $1 }
    }
}

final class Part2: Solution {
    let matchLetter = "A"

    func generateIndexes(
        i: Int,
        j: Int
    ) -> [[(Int, Int)]] {
        [
            [(i - 1, j - 1), (i, j), (i + 1, j + 1), (i - 1, j + 1), (i, j), (i + 1, j - 1)],
            [(i - 1, j - 1), (i, j), (i + 1, j + 1), (i + 1, j - 1), (i, j), (i - 1, j + 1)],

            [(i + 1, j + 1), (i, j), (i - 1, j - 1), (i - 1, j + 1), (i, j), (i + 1, j - 1)],
            [(i + 1, j + 1), (i, j), (i - 1, j - 1), (i + 1, j - 1), (i, j), (i - 1, j + 1)]
        ]
    }

    func checkXmas(
        _ indexes: [(Int, Int)],
        input: [[String]]
    ) -> Bool {
        let xmas = ["M", "A", "S", "M", "A", "S"]
        let letters = indexes.map { String(input[$0.0][$0.1]) }
        return zip(xmas, letters).allSatisfy { $0 == $1 }
    }
}
