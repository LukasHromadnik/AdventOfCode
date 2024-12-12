import Foundation

let input = """
2x3x4
1x1x10
"""
let dimensions = mainInput.components(separatedBy: "\n").map { $0.components(separatedBy: "x").compactMap(Int.init).sorted() }
let result = dimensions.map { dims in
    // PART 1
//    let a = dims[0] * dims[1] * 3
//    let b = dims[1] * dims[2] * 2
//    let c = dims[0] * dims[2] * 2
//    return a + b + c
    // PART 2
    let ribbon = dims[0] * 2 + dims[1] * 2
    let bow = dims[0] * dims[1] * dims[2]
    return ribbon + bow

}
    .reduce(0, +)
print(result)
