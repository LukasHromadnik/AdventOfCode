import Foundation

func hash(line: String) -> Int {
    Array(line)
        .map { Int($0.asciiValue ?? 0) }
        .reduce(0) { acc, next in
            (acc + next) * 17 % 256
        }
}

struct Item: CustomStringConvertible {
    let key: String
    let value: Int

    var description: String {
        key + "=" + String(value)
    }
}

let input = "rn=1,cm-,qp=3,cm=2,qp-,pc=4,ot=9,ab=5,pc-,pc=6,ot=7"
var boxes: [[Item]] = Array(repeating: [], count: 256)
mainInput.components(separatedBy: ",").forEach { line in
    if line.contains(where: { $0 == "=" }) {
        let parts = line.components(separatedBy: "=")
        let item = Item(key: parts[0], value: Int(parts[1])!)
        let index = hash(line: item.key)
        if let firstIndex = boxes[index].firstIndex(where: { $0.key == item.key }) {
            boxes[index][firstIndex] = item
        } else {
            boxes[hash(line: item.key)] += [item]
        }
    } else {
        let line = String(line.dropLast())
        let index = hash(line: line)
        boxes[index] = boxes[index].filter { $0.key != line }
    }
}
let result = boxes.enumerated()
    .filter { !$0.element.isEmpty }
    .map { box, element in
        element.enumerated().map { slot, lens in
            (box + 1) * (slot + 1) * lens.value
        }
        .reduce(0, +)
    }
    .reduce(0, +)

print(result)
