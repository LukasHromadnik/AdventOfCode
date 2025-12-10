import Foundation

struct Input {
    let lightDiagram: String
    let buttons: [[Int]]
}

let input = """
[.##.] (3) (1,3) (2) (2,3) (0,2) (0,1) {3,5,4,7}
[...#.] (0,2,3,4) (2,3) (0,4) (0,1,2) (1,2,3,4) {7,5,12,7,2}
[.###.#] (0,1,2,3,4) (0,3,4) (0,1,2,4,5) (1,2) {10,11,11,5,10,5}
"""
let lightDiagrams = input
    .split(separator: "\n").map(String.init)
    .map {
        $0.split(separator: " ").map(String.init)[0].dropFirst().dropLast()
    }
    .map { (input: Substring) -> [Bool] in
        Array(input).map { $0 == "#" }
    }


let buttonsInput = input
    .split(separator: "\n").map(String.init)
    .map {
        $0.split(separator: " ").map(String.init)[1...].dropLast()
    }
let buttons = buttonsInput
    .map {
        let input = Array($0).map { $0.dropFirst().dropLast() }.map(String.init)
        return input.map { $0.components(separatedBy: ",").compactMap(Int.init) }
    }

let joltages = input
    .split(separator: "\n").map(String.init)
    .map {
        $0.split(separator: " ").map(String.init).last!.dropFirst().dropLast()
    }
    .map { (input: Substring) -> [Int] in
        input.components(separatedBy: ",").compactMap(Int.init)
    }

var result = 0
let lock = NSLock()
//DispatchQueue.concurrentPerform(iterations: lightDiagrams.count) { i in
//for i in 0..<lightDiagrams.count {
let indexes = [0]
for i in indexes {
//    let diagram = lightDiagrams[i]
    let joltage = joltages[i]
    let _buttons = buttons[i]

//    let _result = findButtonPresses(
//        diagram: diagram,
//        buttons: _buttons
//    )
    let _result = findButtonPresses(
        joltage: joltage,
        buttons: _buttons
    )
    lock.lock()
    result += _result
    lock.unlock()
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

func findButtonPresses(
    joltage: [Int],
    buttons: [[Int]]
) -> Int {
    var constraints = Array(
        repeating: Array(repeating: 0.0, count: buttons.count),
        count: joltage.count
    )

//    for i in 0..<joltage.count {
//        constraints[i][buttons.count] = Double(joltage[i])
//    }

    for i in 0..<buttons.count {
        for j in 0..<buttons[i].count {
            let c = buttons[i][j]
            constraints[c][i] = 1
        }
    }
//    let function = Array(repeating: 1.0, count: buttons.count)
//    print(function)
//    print(constraints)

//    (3) (1,3) (2) (2,3) (0,2) (0,1) {3,5,4,7}

//    let function    : [Double] = [1, 1, 1, 1, 1, 1]
//    let constraint1: [Double] = [0, 0, 0, 0, 1, 1, 3]
//    let constraint2: [Double] = [0, 1, 0, 0, 0, 1, 5]
//    let constraint3: [Double] = [0, 0, 1, 1, 1, 0, 4]
//    let constraint4: [Double] = [1, 1, 0, 1, 0, 0, 7]

//    let solution = SimplexSolver.minimize(
//        function: function,
//        constraints: [constraint1, constraint2, constraint3, constraint4],
//        maximumIterationsCount: 10
//    )
//        let x1 = solution[0]  // 8
//        let x2 = solution[1]  // 0
//        let f  = solution[2]  // 24
//    }
//    print(solution)

    // Example usage
//    let objective = function
////    let constraints = [[1, 2, 1], [3, 2, 0]]
//    let sense = Array(repeating: "<=", count: constraints.count)
//    let rhs = joltage.map(Double.init)
//    let lp = LinearProgram(objective: objective, constraints: constraints, sense: sense, rhs: rhs)
//    let solution = simplex(lp: lp)
//    print(solution)

    // min 3x1 + 2x2
    // s podmínkami:
    // x1 + 2x2 <= 4
    // 3x1 + 2x2 <= 6
    // x >= 0

    let lp = LinearProgram(
        objective: [3, 2],
        sense: .minimize
    )

    lp.addConstraint(
        coefficients: [1, 2],
        rhs: 4,
        relation: .greaterOrEqual
    )

    lp.addConstraint(
        coefficients: [3, 2],
        rhs: 6,
        relation: .greaterOrEqual
    )

    let result = lp.solve()
    print(result)

    return 0
}

print(result)
