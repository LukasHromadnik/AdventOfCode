import Foundation

//let input = "dvszwmarrgswjxmb"

let vowels = ["a", "e", "i", "o", "u"]

func isNice1(_ input: String) -> Bool {
    let loaded = Array(input).map(String.init)
    let moreThanThreeVowels = loaded.count { vowels.contains($0) } >= 3
    let hasLettersInRow = !(1..<loaded.count).filter { loaded[$0 - 1] == loaded[$0] }.isEmpty
    let disallowedStrings = ["ab", "cd", "pq", "xy"]
    let hasDisallowedStrings = disallowedStrings.map { input.contains($0) }.reduce(false) { $0 || $1 }
    return moreThanThreeVowels && hasLettersInRow && !hasDisallowedStrings
}

func isNice2(_ input: String) -> Bool {
    let loaded = Array(input).map(String.init)
    let hasLettersInRowWithInBetween = !(2..<loaded.count).filter { loaded[$0 - 2] == loaded[$0] }.isEmpty

    var hasRepeatingSubstring = false
    if loaded.count >= 4 {
        for i in 1..<loaded.count - 2 {
            for j in i + 2..<loaded.count {
                if loaded[i - 1] == loaded[j - 1] && loaded[i] == loaded[j] {
                    hasRepeatingSubstring = true
                }
            }
        }
    }

    return hasLettersInRowWithInBetween && hasRepeatingSubstring
}

print(mainInput.components(separatedBy: "\n").count { isNice2($0) })
//print(isNice2("aaa"))
