import Foundation

let input = """
0:
###
##.
##.

1:
###
##.
.##

2:
.##
###
##.

3:
##.
###
##.

4:
###
#..
###

5:
###
.#.
###

4x4: 0 0 0 0 2 0
12x5: 1 0 1 0 2 2
12x5: 1 0 1 0 3 2
"""

var parts = mainInput.split(separator: "\n\n")
let regions = String(parts.removeLast()).split(separator: "\n")
    .map {
        let parts = $0.split(separator: ": ")
        let dimensions = parts[0].split(separator: "x").map(String.init).compactMap(Int.init)
        let counts = parts[1].split(separator: " ").map(String.init).compactMap(Int.init)
        return (dimensions, counts)
    }

let gifts = parts.map {
    $0.split(separator: "\n").dropFirst()
        .map { Array(String($0)).map { $0 == "#" ? 1 : 0 } }
}

var result = 0
for region in regions {
    let size = region.0
    let counts = region.1

    let grid = Array(
        repeating: Array(repeating: 0, count: size[0]),
        count: size[1]
    )

    var regionGifts: [[[Int]]] = []
    for i in 0..<counts.count where counts[i] > 0 {
        for _ in 0..<counts[i] {
            regionGifts.append(gifts[i])
        }
    }

    if buildGrid(grid, regionGifts: regionGifts) {
        result += 1
    }
}
print(result)

func buildGrid(
    _ grid: [[Int]],
    regionGifts: [[[Int]]]
) -> Bool {
    if regionGifts.isEmpty { return true }

    let neededSpaces = regionGifts.map { $0.map { $0.reduce(0, +) }.reduce(0, +) }.reduce(0, +)
    let emptySpaces = grid.map { $0.count { $0 == 0 } }.reduce(0, +)
    if neededSpaces > emptySpaces { return false }


//    print()
//    printGrid(grid)
//    print("gift remaining: \(regionGifts.count)")

    outer: for t in 0..<4 {
//        print("rotation: \(t)")
        let gift = rotateGrid(regionGifts.first!, times: t)
//        printGrid(gift)
        var bannedIndexes: [(Int, Int)] = []

        while true {
            if let giftIndex = giftsGridIndex(gift, grid: grid, bannedIndexes: bannedIndexes) {
                var gridCopy = grid
                placeGift(gift, atIndex: giftIndex, onGrid: &gridCopy)
//                print("placed at: \(giftIndex)")

                if buildGrid(gridCopy, regionGifts: Array(regionGifts.dropFirst())) {
                    return true
                } else {
//                    print("banning: \(giftIndex)")
                    bannedIndexes.append(giftIndex)
                }
            } else {
                continue outer
            }
        }
    }

    return false
}
