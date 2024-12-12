import Foundation

let input = """
1,0,1~1,2,1
0,0,2~2,0,2
0,2,3~2,2,3
0,0,4~0,2,4
2,0,5~2,2,5
0,1,6~2,1,6
1,1,8~1,1,9
"""

typealias Coord = (x: Int, y: Int, z: Int)
struct Brick: CustomStringConvertible {
    let from: Coord
    let to: Coord

    var description: String {
        "\(from.x),\(from.y),\(from.z)~\(to.x),\(to.y),\(to.z)"
    }
}

let bricks = mainInput.components(separatedBy: "\n")
    .map { line in
        let parts = line.components(separatedBy: "~")
        let from = parts[0].components(separatedBy: ",").compactMap(Int.init)
        let to = parts[1].components(separatedBy: ",").compactMap(Int.init)
        return Brick(
            from: Coord(x: from[0], y: from[1], z: from[2]),
            to: Coord(x: to[0], y: to[1], z: to[2])
        )
    }
    .sorted(by: { $0.from.z < $1.from.z })
let maxX = bricks.map { max($0.from.x, $0.to.x) }.max()! + 1
let maxY = bricks.map { max($0.from.y, $0.to.y) }.max()! + 1
var tetris = Array(
    repeating: Array(
        repeating: Array(repeating: -1, count: maxX),
        count: maxY
    ),
    count: bricks.last!.to.z
)
extension Int {
    func times<T>(_ closure: (Int) -> T) -> [T] {
        guard self > 0 else { return [] }
        return (0..<self).map(closure)
    }
}

func printTetris(nonRemovable: Set<Int> = .init()) {
    let numberLength = String(bricks.count).count
    let prefix = ((numberLength / 2) - 1).times { _ in " " }.joined()
    let suffix = (numberLength / 2).times { _ in " " }.joined()
    let emptySpace = prefix + "." + suffix
    let markNonRemovable: (String) -> String = {
        guard nonRemovable.contains(Int($0)!) else { return $0 }
        var array = Array($0)
        array[0] = "X"
        return String(array)
    }
    for line in tetris.reversed() {
        var offset = 0
        for row in line {
            if offset > 0 {
                print((0..<offset).map { _ in " " }.joined(separator: ""), terminator: "")
            }
            print(
                row
                    .map {
                        $0 >= 0
                        ? markNonRemovable(String(format: "%0\(numberLength)d", $0))
                        : emptySpace
                    }
                    .joined(separator: " ")
            )
            offset += 1
        }
        print("----")
    }
    print()
}

bricks.enumerated().forEach { offset, brick in
    if brick.from.x == brick.to.x && brick.from.y != brick.to.y && brick.from.z == brick.to.z {
        var maxZ = 0
        for i in brick.from.y...brick.to.y {
            var _maxZ = -1
            for z in 0..<tetris.count {
                if tetris[z][i][brick.from.x] >= 0 {
                    _maxZ = z
                }
            }
            maxZ = max(maxZ, _maxZ + 1)
        }

        for i in brick.from.y...brick.to.y {
            tetris[maxZ][i][brick.from.x] = offset
        }
    } else if brick.from.x != brick.to.x && brick.from.y == brick.to.y && brick.from.z == brick.to.z {
        var maxZ = 0
        for i in brick.from.x...brick.to.x {
            var _maxZ = -1
            for z in 0..<tetris.count {
                if tetris[z][brick.from.y][i] >= 0 {
                    _maxZ = z
                }
            }
            maxZ = max(maxZ, _maxZ + 1)
        }

        for i in brick.from.x...brick.to.x {
            tetris[maxZ][brick.from.y][i] = offset
        }
    } else if brick.from.x == brick.to.x && brick.from.y == brick.to.y {
        var maxZ = -1
        for z in 0..<tetris.count {
            if tetris[z][brick.from.y][brick.from.x] >= 0 {
                maxZ = z
            }
        }
        maxZ += 1

        let height = brick.to.z - brick.from.z + 1
        for z in 0..<height {
            tetris[maxZ + z][brick.from.y][brick.from.x] = offset
        }
    } else {
        print(brick)
        assertionFailure()
    }
}

var nonRemovable = Set<Int>()

for z in 1..<tetris.count {
//for z in 1..<2 {
    let bottom = tetris[z - 1]
    let top = tetris[z]

    var struts: [Int: Set<Int>] = [:]

    for y in 0..<top.count {
        for x in 0..<top[y].count {
            let topValue = top[y][x]
            let bottomValue = bottom[y][x]
            if topValue >= 0 && bottomValue >= 0 && topValue != bottomValue {
                if struts[topValue] == nil {
                    struts[topValue] = .init([bottomValue])
                } else {
                    struts[topValue]?.insert(bottomValue)
                }
            }
        }
    }

    struts.values.forEach {
        if $0.count == 1 {
            $0.forEach {
                nonRemovable.insert($0)
            }
        }
    }
}

// Part 1
//print(bricks.count - nonRemovable.count)

var parents: [Int: Set<Int>] = [:]
var children: [Int: Set<Int>] = [:]
for i in 0..<bricks.count {
    parents[i] = .init()
    children[i] = .init()
}

for z in 1..<tetris.count {
    let bottom = tetris[z - 1]
    let top = tetris[z]

    for y in 0..<bottom.count {
        for x in 0..<bottom[y].count {
            let bottomValue = bottom[y][x]
            let topValue = top[y][x]
            
            if topValue >= 0 && bottomValue >= 0 && topValue != bottomValue {
                parents[bottomValue]?.insert(topValue)
                children[topValue]?.insert(bottomValue)
            }
        }
    }
}

printTetris()

var count = 0
nonRemovable.forEach {
    var allParents = Set<Int>([$0])

    var queue = Set(Array(parents[$0]!))
    while !queue.isEmpty {
        let pop = queue.popFirst()!
        
        if children[pop]!.isSubset(of: allParents) {
            allParents.insert(pop)
        }

        parents[pop]!.forEach { queue.insert($0) }
    }
    count += allParents.count
}

print(count - nonRemovable.count)
// 103010
