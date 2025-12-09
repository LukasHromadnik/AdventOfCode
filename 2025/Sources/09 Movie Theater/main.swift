import Foundation
import AppKit

let input = """
7,1
11,1
11,7
9,7
9,5
2,5
2,3
7,3
"""
let points = mainInput
    .split(separator: "\n").map(String.init)
    .map {
        let values = $0.split(separator: ",").map(String.init).map { Int($0)! }
        return CGPoint(x: values[0], y: values[1])
    }
let path = NSBezierPath()
path.move(to: points[0])
for i in 1..<points.count {
    path.line(to: NSPoint(x: points[i].x, y: points[i].y))
}
path.close()

var maxSize: Double = 0

//    for j in i + 1..<points.count {
//        let size = abs(points[i].i - points[j].i + 1) * abs(points[i].j - points[j].j + 1)
//        maxSize = max(maxSize, size)
//    }

let indexes = points.count * points.count
let lock = NSLock()
DispatchQueue.concurrentPerform(iterations: indexes) { index in
    let i = index / points.count
    let j = index % points.count

    if j <= i { return }

    let size = (abs(points[i].x - points[j].x) + 1) * (abs(points[i].y - points[j].y) + 1)
    if size < maxSize { return }

    print(i, j, "/", points.count)

    let minA = Int(min(points[i].x, points[j].x))
    let maxA = Int(max(points[i].x, points[j].x))
    let minB = Int(min(points[i].y, points[j].y))
    let maxB = Int(max(points[i].y, points[j].y))

    var points: [NSPoint] = []
    for a in minA...maxA {
        points.append(NSPoint(x: a, y: minB))
        points.append(NSPoint(x: a, y: maxB))
    }

    for b in minB...maxB {
        points.append(NSPoint(x: minA, y: b))
        points.append(NSPoint(x: maxA, y: b))
    }

    for p in points {
        if !path.contains(p) {
            return
        }
    }

    lock.lock()
    maxSize = max(maxSize, size)
    lock.unlock()
}

print(maxSize)
