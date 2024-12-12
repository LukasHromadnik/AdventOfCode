import Foundation

//assert(canPlaceHashes(count: 2, from: 0, in: Array(".??..??...?##")) == false)
//assert(canPlaceHashes(count: 2, from: 1, in: Array(".??..??...?##")))
//assert(canPlaceHashes(count: 2, from: 2, in: Array(".??..??...?##")) == false)
//assert(canPlaceHashes(count: 1, from: 0, in: Array(".??..??...?##")) == false)
//assert(canPlaceHashes(count: 1, from: 1, in: Array(".??..??...?##")))
//assert(canPlaceHashes(count: 1, from: 2, in: Array(".??..??...?##")))
//assert(canPlaceHashes(count: 1, from: 3, in: Array(".??..??...?##")) == false)

func canPlaceHashes(count: Int, from i: Int, in text: [String.Element]) -> Bool {
    if i > 0 && text[i - 1] == "#" {
        return false
    }
    
    for j in 0..<count {
        if i + j >= text.count {
            return false
        }
        
        if text[i + j] != "?" && text[i + j] != "#" {
            return false
        }
    }
    if i + count == text.count {
        return true
    }
    if text[i + count] == "." || text[i + count] == "?" {
        return true
    }
    return false
}

func numberOfCombinations(
    in text: [String.Element],
    counts: [Int]
) -> Int {
    print(#function, String(text), counts)
    var combinations = 0

    for i in 0..<text.count {

        // Skip dots, they are useless
        if text[i] == "." { continue }

        if i > 0 && i < text.count && text[i - 1] == "#" { break }

        // Check if you can place hashes at the given index
        if canPlaceHashes(count: counts[0], from: i, in: text) {
            print("canPlase", counts[0], i)

            // If it's the last hash update the number of combinations
            if counts.count == 1 {
                print("combinations + 1")
                combinations += 1
            }
            // Otherwise run the algorithm for the next hash count
            else {
                if i + counts[0] + 1 >= text.count {
                    break
                }
                let remaining = Array(text[(i + counts[0] + 1)...])
                combinations += numberOfCombinations(
                    in: remaining,
                    counts: Array(counts.dropFirst())
                )
            }
        }
        // If we're not able to place hashes at the current position
        // and at the current position there is hash
        // we know we would create an invalid sequence,
        // so we can skip the computation.
//        else if text[i] == "#" { return 0 }
    }
    print("return", combinations)
    return combinations
}

let input = """
???.### 1,1,3
.??..??...?##. 1,1,3
?#?#?#?#?#?#?#? 1,3,1,6
????.#...#... 4,1,1
????.######..#####. 1,6,5
?###???????? 3,2,1
"""

func numberOfCombinations(for line: String) -> Int {
    let parts = line.components(separatedBy: " ")
    let text = parts[0].replacing(/\.+/, with: ".")
    let counts = parts[1].components(separatedBy: ",").compactMap(Int.init)

    return numberOfCombinations(
        in: Array(text),
        counts: counts
    )
}

// #???..#?#???????.?# 3,1,2,1,1,1
// ?????.?????#?#????. 2,1,1,5,1
let lines = [".?#?????.???????? 3,1,1,4"]
//let lines = ["?###???????? 3,2,1"]
//let lines = ["???.### 1,1,3"]
//let lines = mainInput.components(separatedBy: "\n")
//let lines = input.components(separatedBy: "\n")
//let line = lines.last!
//print(line)
//print(numberOfCombinations(for: line))

let result = lines
    .map { print(); return numberOfCombinations(for: $0) }
    .reduce(0, +)

print(result)
// 7286

