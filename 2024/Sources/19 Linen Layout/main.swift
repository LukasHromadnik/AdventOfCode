import Foundation

let input = """
r, wr, b, g, bwu, rb, gb, br

brwrr
bggr
gbbr
rrbgbr
ubwu
bwurrg
brgr
bbrgwb
"""

let c = mainInput.components(separatedBy: "\n\n")
let towels = c[0].components(separatedBy: ", ")
let patterns = c[1].components(separatedBy: "\n")
let maxTowelLength = towels.map(\.count).max()!

var storage: [String: Int] = [:]

func canMakePattern(_ pattern: String, padding: Int = 0) -> Int {
    var count = 0
    for i in 1...min(maxTowelLength, pattern.count) {
        let prefix = String(pattern.prefix(i))

        guard towels.contains(prefix) else {
            continue
        }

        if prefix.count == pattern.count {
            storage[prefix] = 1
            count += 1
        } else {
            let nextPattern = String(pattern.dropFirst(i))
            let childCount = storage[nextPattern] ?? canMakePattern(nextPattern, padding: padding + i + 1)
            storage[nextPattern] = childCount
            count += childCount
        }
    }

    return count
}

var count = 0
for pattern in patterns {
    storage = [:]
    let canMake = canMakePattern(pattern)
    // PART 1
//    count += (canMake > 0 ? 1 : 0)
    // PART 2
    count += canMake
}
print(count)
