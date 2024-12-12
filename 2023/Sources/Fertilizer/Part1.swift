import Foundation

enum Part1 {
    static func invoke(_ input: String) -> Int {
        let categories = input.components(separatedBy: "\n\n")
        let seeds = categories[0].components(separatedBy: " ").dropFirst().compactMap(Int.init)
        let mappings = categories.dropFirst().map { category in
            category
                .components(separatedBy: "\n")
                .dropFirst()
                .map { $0.components(separatedBy: " ").compactMap(Int.init) }
                .map { DSRange(destination: $0[0], source: $0[1], count: $0[2]) }
        }
        return seeds.map {
            var index = $0
            for ranges in mappings {
                for range in ranges {
                    if range.sourceRange.contains(index) {
                        index = index - range.sourceRange.lowerBound + range.destination
                        break
                    }
                }
            }
            return index
        }
        .min()!
    }
}
