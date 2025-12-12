import Foundation

func rotateGrid(
    _ gift: [[Int]],
    times: Int
) -> [[Int]] {
    if times == 0 { return gift }

    var rotated = gift
    for _ in 0..<times {
        rotated = rotateGrid(rotated)
    }

    return rotated
}

private func rotateGrid(_ grid: [[Int]]) -> [[Int]] {
    let n = grid.count
    var rotated = Array(
        repeating: Array(repeating: 0, count: grid.count),
        count: grid[0].count
    )

    for i in 0..<grid.count {
        for j in 0..<grid[i].count {
            rotated[j][n - 1 - i] = grid[i][j]
        }
    }

    return rotated
}

func placeGift(
    _ gift: [[Int]],
    atIndex index: (Int, Int),
    onGrid grid: inout [[Int]]
) {
    let giftPlaceIndex = grid.map { $0.max()! }.max()! + 1
    let giftIndexes = (0..<gift.count).flatMap { i in (0..<gift[i].count).map { (i, $0) } }

    for giftIndex in giftIndexes {
        if gift[giftIndex.0][giftIndex.1] == 1 {
            grid[index.0 + giftIndex.0][index.1 + giftIndex.1] = giftPlaceIndex
        }
    }
}

func giftsGridIndex(
    _ gift: [[Int]],
    grid: [[Int]],
    bannedIndexes: [(Int, Int)]
) -> (Int, Int)? {
    let indexes = (0..<grid.count).flatMap { i in (0..<grid[i].count).map { (i, $0) } }
    let giftIndexes = (0..<gift.count).flatMap { i in (0..<gift[i].count).map { (i, $0) } }

    outer: for index in indexes {
        if bannedIndexes.contains(where: { $0.0 == index.0 && $0.1 == index.1 }) { continue }

        for giftIndex in giftIndexes {
            if index.0 + giftIndex.0 > grid.count - 1 { continue outer }
            if index.1 + giftIndex.1 > grid[0].count - 1 { continue outer }

            let hasGiftMatter = gift[giftIndex.0][giftIndex.1] == 1
            let isGridOccupied = grid[index.0 + giftIndex.0][index.1 + giftIndex.1] > 0

            if hasGiftMatter && isGridOccupied {
                continue outer
            }
        }

        return index
    }

    return nil
}

func printGrid(
    _ grid: [[Int]]
) {
    for row in grid {
        print(row.map(\.description).joined())
    }
}
