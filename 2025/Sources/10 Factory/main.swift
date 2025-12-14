import Foundation
import Core

struct Input {
    let lightDiagram: String
    let buttons: [[Int]]
}

let input = """
[.##.] (3) (1,3) (2) (2,3) (0,2) (0,1) {3,5,4,7}
[...#.] (0,2,3,4) (2,3) (0,4) (0,1,2) (1,2,3,4) {7,5,12,7,2}
[.###.#] (0,1,2,3,4) (0,3,4) (0,1,2,4,5) (1,2) {10,11,11,5,10,5}
"""
let lines = mainInput.split(separator: "\n").map(String.init)

let lightDiagrams = lines
    .map {
        $0.split(separator: " ").map(String.init)[0].dropFirst().dropLast()
    }
    .map { (input: Substring) -> [Bool] in
        Array(input).map { $0 == "#" }
    }

let buttonsInput = lines
    .map {
        $0.split(separator: " ").map(String.init)[1...].dropLast()
    }
let buttons = buttonsInput
    .map {
        let input = Array($0).map { $0.dropFirst().dropLast() }.map(String.init)
        return input.map { $0.components(separatedBy: ",").compactMap(Int.init) }
    }

let result: Int = iterate(count: lightDiagrams.count, concurrently: true) { i in
    findButtonPresses(
        diagram: lightDiagrams[i],
        buttons: buttons[i]
    )
}

func findButtonPresses(
    diagram: [Bool],
    buttons: [[Int]]
) -> Int {
    var states: [([Bool], Int)] = [(Array(repeating: false, count: diagram.count), 0)]

    while !states.isEmpty {
        let state = states.removeFirst()

        for button in buttons {
            var d = state.0
            button.forEach {
                d[$0] = !d[$0]
            }
            if d == diagram { return state.1 + 1 }
            states.append((d, state.1 + 1))
        }
    }

    return 0
}

print(result)
assert(result == 477)
