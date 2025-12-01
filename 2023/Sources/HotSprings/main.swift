import Foundation

let input = """
???.### 1,1,3
.??..??...?##. 1,1,3
?#?#?#?#?#?#?#? 1,3,1,6
????.#...#... 4,1,1
????.######..#####. 1,6,5
?###???????? 3,2,1
"""

let numberOfRepeats = 5
let springs = mainInput.components(separatedBy: "\n")
    .map {
        let c = $0.components(separatedBy: " ")
        let pattern = Array(repeating: c[0], count: numberOfRepeats).joined(separator: "?")
        let values = Array(repeating: c[1], count: numberOfRepeats).joined(separator: ",").components(separatedBy: ",").compactMap(Int.init)
        return (pattern, values)
    }

var results = Array(repeating: 0, count: springs.count)
iterate(count: springs.count) { i in
    let spring = springs[i]
    let hashes = spring.1.map { Array(repeating: "#", count: $0).joined() }
    let regex = Array("." + hashes.joined(separator: ".") + ".").map(String.init)
    let pattern = Array(spring.0).map(String.init)

    var states = Array(repeating: 0, count: regex.count)
    states[0] = 1

    for i in 0..<pattern.count {
        for state in (0..<states.count).reversed() {
            guard states[state] > 0 else { continue }

            let nextState = min(state + 1, states.count - 1)
            let transition = regex[state] + regex[nextState]

            switch transition {
            case ".#":
                switch pattern[i] {
                case ".":
                    break
                case "#":
                    states[nextState] += states[state]
                    states[state] = 0
                case "?":
                    states[nextState] += states[state]
                default:
                    fatalError()
                }

            case "##":
                switch pattern[i] {
                case ".":
                    states[state] = 0
                case "#":
                    states[nextState] += states[state]
                    states[state] = 0
                case "?":
                    states[nextState] += states[state]
                    states[state] = 0
                default:
                    fatalError()
                }

            case "#.":
                switch pattern[i] {
                case ".":
                    states[nextState] += states[state]
                    states[state] = 0
                case "#":
                    states[state] = 0
                case "?":
                    states[nextState] += states[state]
                    states[state] = 0
                default:
                    fatalError()
                }

            case "..":
                switch pattern[i] {
                case ".":
                    break
                case "#":
                    states[state] = 0
                case "?":
                    break
                default:
                    fatalError()
                }

            default:
                fatalError()
            }
        }
    }


    results[i] = states[states.count - 2] + states[states.count - 1]
}
print(results.reduce(0, +))
