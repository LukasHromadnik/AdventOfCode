import Foundation
import AppKit

let input = """
p=0,4 v=3,-3
p=6,3 v=-1,-3
p=10,3 v=-1,2
p=2,0 v=2,-1
p=0,0 v=1,3
p=3,0 v=-2,-2
p=7,6 v=-1,-3
p=3,0 v=-1,-2
p=9,3 v=2,3
p=7,3 v=-1,2
p=2,4 v=2,-3
p=9,5 v=-3,-3
"""
let loaded = mainInput.components(separatedBy: "\n").map {
    let c = $0.components(separatedBy: " ")
    let p = c[0].dropFirst(2).components(separatedBy: ",").compactMap(Int.init)
    let v = c[1].dropFirst(2).components(separatedBy: ",").compactMap(Int.init)
    return (p, v)
}
//let width = 11
let width = 101
//let height = 7
let height = 103
//let numberOfSeconds = 100

let wHalf = (width - 1) / 2
let hHalf = (height - 1) / 2
var quadrants = Array(repeating: 0, count: 4)

//loaded.forEach { robot in
//    let w = (((robot.0[0] + robot.1[0] * numberOfSeconds) % width) + width) % width
//    let h = (((robot.0[1] + robot.1[1] * numberOfSeconds) % height) + height) % height
//
//    if w < wHalf && h < hHalf {
//        quadrants[0] += 1
//    } else if w < wHalf && h > hHalf {
//        quadrants[1] += 1
//    } else if w > wHalf && h < hHalf {
//        quadrants[2] += 1
//    } else if w > wHalf && h > hHalf {
//        quadrants[3] += 1
//    }
//}
//print(quadrants.reduce(1, *))

for i in 0..<10_000 {
    var grid = Array(repeating: Array(repeating: ".", count: width), count: height)

    loaded.forEach { robot in
        let w = (((robot.0[0] + robot.1[0] * i) % width) + width) % width
        let h = (((robot.0[1] + robot.1[1] * i) % height) + height) % height

        grid[h][w] = switch grid[h][w] {
        case ".": "1"
        case "1": "2"
        case "2": "3"
        default: "X"
        }
    }

    var result = ""

//    print(i)
    var hasMoreThan4 = false
    for i in 0..<grid.count {
        for j in 0..<grid[0].count {
            result.append(grid[i][j])

            if i > 0 && j > 0 && i < grid.count - 1 && j < grid[0].count - 1 {
                let hasStar = [(i, j), (i - 1, j), (i + 1, j), (i, j - 1), (i, j + 1)].map { grid[$0.0][$0.1] }.allSatisfy { $0 != "." }
                if hasStar {
                    hasMoreThan4 = true
                }
//                if grid[i][j] != "." && grid[i - 1][j] != "." && grid[i + 1][j] != "." && grid[i][j - 1] != "." &&
            }


//            print(grid[i][j], terminator: "")
        }
        result.append("\n")
//        print()
    }
    if hasMoreThan4 {
        print(i)
        print(result)
        print()
        //            print(result)
    }
//    print()
//    print(result)

//    try result.write(to: URL(filePath: "/Users/Luke/Desktop/aoc/\(i).txt"), atomically: true, encoding: .utf8)
//    var myImageDataArray : [UInt8] = [167, 241, 217, 42, 130, 200, 216, 254, 67, 77, 152, 85, 140, 226, 179, 71]
////    let dataProv = CGDataProviderCreateWithData(nil, myImageDataArray, myImageDataArray.count, nil)
//    let dataProv = CGDataProvider.init(dataInfo: nil, data: myImageDataArray, size: myImageDataArray.count) { _, _, _  in }
//    let myCG = CGImageCreate(
//        4,
//        4,
//        8,
//        8,
//        4,
//        CGColorSpace(name: kCGColorSpaceGenericGrayGamma2_2),
//        CGBitmapInfo.ByteOrderDefault,
//        dataProv,
//        nil,
//        false,
//        CGColorRenderingIntent.RenderingIntentDefault
//    )
//    let testTIFF = NSBitmapImageRep(CGImage: myCG!)
//    let mynewData = testTIFF.representationUsingType(NSBitmapImageFileType.NSTIFFFileType, properties: [NSImageCompressionMethod: 1])
//    mynewData?.writeToFile("testTIFF.tiff", atomically: false)
////    print()
}

