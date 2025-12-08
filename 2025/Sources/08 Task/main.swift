import Foundation
import Core

let input = """
162,817,812
57,618,57
906,360,560
592,479,940
352,342,300
466,668,158
542,29,236
431,825,988
739,650,466
52,470,668
216,146,977
819,987,18
117,168,530
805,96,715
346,949,466
970,615,88
941,993,340
862,61,35
984,92,344
425,690,689
"""

let boxes = mainInput.split(separator: "\n").map { $0.split(separator: ",").map(String.init).compactMap(Int.init) }
var distances: [((Int, Int), Double)] = []

for i in 0..<boxes.count {
    for j in i + 1..<boxes.count {
        let distance = sqrt(
            pow(Double(boxes[j][2] - boxes[i][2]), 2) +
            pow(Double(boxes[j][1] - boxes[i][1]), 2) +
            pow(Double(boxes[j][0] - boxes[i][0]), 2)
        )

        distances.append(((i, j), distance))
    }
}

distances.sort { $0.1 < $1.1 }

var ids = (0..<boxes.count).map { _ in -1 }
var numberOfConnections = 0
var i = -1
while true {
    i += 1

//    if numberOfConnections == 1000 { break }

    let pair = distances[i].0

    switch (ids[pair.0], ids[pair.1]) {
    case (-1, -1):
        let key = ids.max()! + 1
        ids[pair.0] = key
        ids[pair.1] = key

    case let (value, -1), let (-1, value):
        ids[pair.0] = value
        ids[pair.1] = value

    case let (key1, key2):
        if key1 == key2 { break }

        for i in 0..<ids.count {
            if ids[i] == key2 {
                ids[i] = key1
            }
        }
    }

    numberOfConnections += 1

    let allSame = ids.allSatisfy { ids[0] == $0 }
    if allSame { break }
}

//var counts: [Int: Int] = [:]
//ids.forEach {
//    if $0 == -1 { return }
//
//    if counts[$0] == nil {
//        counts[$0] = 1
//    } else {
//        counts[$0]! += 1
//    }
//}
//let sizes = Set(counts.values).sorted(by: >)[0..<3]
//print(sizes.reduce(1, *))

let x1 = boxes[distances[i].0.0][0]
let x2 = boxes[distances[i].0.1][0]
print(x1 * x2)
