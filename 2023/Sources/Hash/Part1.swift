import Foundation

enum Part1 {
    static func invoke(_ input: String) -> Int {
        input
            .components(separatedBy: ",")
            .map(hash(line:))
            .reduce(0, +)
    }
}
