import Foundation

enum Part1 {
    static let input = """
    RL

    AAA = (BBB, CCC)
    BBB = (DDD, EEE)
    CCC = (ZZZ, GGG)
    DDD = (DDD, DDD)
    EEE = (EEE, EEE)
    GGG = (GGG, GGG)
    ZZZ = (ZZZ, ZZZ)
    """

    static let input2 = """
    LLR

    AAA = (BBB, BBB)
    BBB = (AAA, ZZZ)
    ZZZ = (ZZZ, ZZZ)
    """
    
    static func invoke(_ input: String) -> Int {
        let parts = input.components(separatedBy: "\n\n")
        let instructions = Array(parts[0])
        let nodes = parts[1].components(separatedBy: "\n")
            .map { line in line.ranges(of: /[A-Z]{3}/).map { String(line[$0]) } }
            .reduce(into: [String: (String, String)]()) { acc, next in
                acc[next[0]] = (next[1], next[2])
            }

        var node = "AAA"
        var steps = 0
        var instructionIndex = 0
        while true {
            guard let list = nodes[node] else { break }
            let i = instructions[instructionIndex]
            node = i == "L" ? list.0 : list.1
            steps += 1
            instructionIndex = (instructionIndex + 1) % instructions.count

            if node == "ZZZ" {
                break
            }
        }

        return steps
    }
}
