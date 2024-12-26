import Foundation

let input = "2333133121414131402"

func loadInput(_ input: String) -> [Int] {
    Array(input).map(String.init).compactMap(Int.init)
}

func computeChecksum(_ input: [String]) -> Int {
    input.enumerated().reduce(0) { acc, next in
        guard next.element != "." else { return acc }
        return acc + next.offset * Int(next.element)!
    }
}

let loaded = loadInput(mainInput)

var mapped = loaded.enumerated().flatMap { offset, value in
    if offset % 2 == 0 {
        Array(repeating: offset / 2, count: value)
    } else {
        Array(repeating: -1, count: value)
    }
}

func computeBlockLength(index: Int) -> Int {
    var length = 1
    while index - length > 0 && mapped[index] == mapped[index - length] {
        length += 1
    }
    return length
}

func computeSpaceLength(index: Int) -> Int {
    var length = 1
    while mapped[index] == mapped[index + length] {
        length += 1
    }
    return length
}

// part1
//func computeBlockLength(index: Int) -> Int {
//    1
//}
//
//func computeSpaceLength(index: Int) -> Int {
//    1
//}

var j = mapped.count - 1
//var i = 0 // part 1
while j >= 0 {
    while mapped[j] < 0 {
        j -= 1
    }

    let jCount = computeBlockLength(index: j)

    var i = 0 // part 2
    while i < j {
        if mapped[i] >= 0 {
            i += 1
            continue
        }

        let iCount = computeSpaceLength(index: i)

        if iCount >= jCount {
            break
        } else {
            i += iCount
        }
    }

    guard i < j else {
        j -= jCount
        continue
    }

    for inc in 0..<jCount {
        mapped[i + inc] = mapped[j - inc]
        mapped[j - inc] = -1
    }

    j -= jCount
}

let checksum = mapped.enumerated()
    .map { $0.element == -1 ? 0 : $0.element * $0.offset }
    .reduce(0, +)

//assert(checksum == 6353658451014) // part 1
assert(checksum == 6382582136592)
