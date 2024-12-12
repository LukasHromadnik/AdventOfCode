import Foundation

let input = """
19, 13, 30 @ -2,  1, -2
18, 19, 22 @ -1, -1, -2
20, 25, 34 @ -2, -2, -4
12, 31, 28 @ -1, -2, -1
20, 19, 15 @  1, -5, -3
"""

struct Item {
    let point: [Int]
    let velocity: [Int]
}

struct Point {
    let x: Double
    let y: Double
    let z: Double
}

extension Point {
    init(values: [Double]) {
        x = values[0]
        y = values[1]
        z = values[2]
    }
}

//let rangeFrom = 200000000000000
//let rangeTo = 400000000000000
let rangeFrom = 7
let rangeTo = 27
let testRange = Double(rangeFrom)...Double(rangeTo)

let items = mainInput.components(separatedBy: "\n").map { line in
    let parts = line.components(separatedBy: " @ ")
    let p = parts[0].components(separatedBy: ", ").map { $0.trimmingCharacters(in: .whitespaces) }.compactMap(Int.init)
    let v = parts[1].components(separatedBy: ", ").map { $0.trimmingCharacters(in: .whitespaces) }.compactMap(Int.init)
    return Item(point: p, velocity: v)
}

/*
func linePoints(point: [Int], velocity: [Int]) -> (Point, Point) {
    let p1 = zip(point, velocity.map { $0 * -rangeTo }).map { $0 + $1 }.map(Double.init)
    let p2 = zip(point, velocity.map { $0 * rangeTo }).map { $0 + $1 }.map(Double.init)
    return (Point(values: p1), Point(values: p2))
}

func computeT(_ p1: Point, _ p2: Point, _ p3: Point, _ p4: Point) -> Double {
    let t1 = (p1.x - p3.x) * (p3.y - p4.y) - (p1.y - p3.y) * (p3.x - p4.x)
    let t2 = (p1.x - p2.x) * (p3.y - p4.y) - (p1.y - p2.y) * (p3.x - p4.x)
    return t1 / t2
}

var count = 0
for i in 0..<items.count {
    for j in (i + 1)..<items.count {
        let (p1, p2) = linePoints(point: items[i].point, velocity: items[i].velocity)
        let (p3, p4) = linePoints(point: items[j].point, velocity: items[j].velocity)
        let t = computeT(p1, p2, p3, p4)
        
        let Px = p1.x + t * (p2.x - p1.x)
        let Py = p1.y + t * (p2.y - p1.y)

        let i0 = Double(items[i].point[0])
        let j0 = Double(items[j].point[0])

        let r1 = (min(i0, p2.x)...max(i0, p2.x))
        let r2 = (min(j0, p4.x)...max(j0, p4.x))

        guard r1.contains(Px) && r2.contains(Px) else { continue }

        guard testRange.contains(Px) && testRange.contains(Py) else { continue }

        count += 1
    }
}

print(count)
*/


// PART 2
// (dy'-dy) X + (dx-dx') Y + (y-y') DX + (x'-x) DY = x' dy' - y' dx' - x dy + y dx
// https://www.reddit.com/r/adventofcode/comments/18q40he/2023_day_24_part_2_a_straightforward_nonsolver/

for i in 0...3 {
    let item0 = items[i]
    let item1 = items[i + 1]

    let x = item0.point[0]
    let y = item0.point[1]
    let dx = item0.velocity[0]
    let dy = item0.velocity[1]
    let x_ = item1.point[0]
    let y_ = item1.point[1]
    let dx_ = item1.velocity[0]
    let dy_ = item1.velocity[1]

    let sign: (Int) -> String = { $0 < 0 ? "\($0)" : "+\($0)" }
    print(sign(dy_ - dy), "a", sign(dx - dx_), "b", sign(y - y_), "c", sign(x_ - x), "d=", x_ * dy_ - y_ * dx_ - x * dy + y * dx, separator: "")
}

//a = 261502975177164 and b = 196765966839909 and c = 28 and d = 123
//a = 261502975177164 and b = 428589795012222 and c = 28 and d = -286
// 261502975177164 + 196765966839909 + 428589795012222 = 886858737029295
