import Foundation

let input = """
L68
L30
R48
L5
R60
L55
L1
L99
R14
L82
"""

let instructions = mainInput.split(separator: "\n").map {
    let orientation = Array(String($0))[0]
    let value = Int($0.dropFirst())!
    return (orientation == "L", value)
}

var lastValue = 50
var result = 0

instructions.forEach {
    let rotationMultiplier = $0.0 ? -1 : 1
    let rotationValue = $0.1

    for _ in 0..<rotationValue {
        lastValue += rotationMultiplier
        if lastValue < 0 {
            lastValue += 100
        } else if lastValue > 99 {
            lastValue -= 100
        }
        // Part 2
//        if lastValue == 0 {
//            result += 1
//        }
    }
    // Part 1
    if lastValue == 0 {
        result += 1
    }
}

print(result)
