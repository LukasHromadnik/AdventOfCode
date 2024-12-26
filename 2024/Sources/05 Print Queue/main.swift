import Foundation

let input = """
47|53
97|13
97|61
97|47
75|29
61|13
75|53
29|13
97|29
53|29
61|53
97|53
61|29
47|13
75|47
97|75
47|61
75|61
47|29
75|13
53|13

75,47,61,53,29
97,61,53,29,13
75,29,13
75,97,47,61,53
61,13,29
97,13,75,29,47
"""

func solve(input: String, isValidReturnValue: Bool) -> Int {
    let components = input.components(separatedBy: "\n\n")
    let instructions = components[0].components(separatedBy: "\n")
        .map { $0.components(separatedBy: "|") }
        .map { $0.compactMap(Int.init) }
        .reduce(into: [Int: [Int]]()) { dict, next in
            if let value = dict[next[0]] {
                dict[next[0]] = value + [next[1]]
            } else {
                dict[next[0]] = [next[1]]
            }
        }
    let updates = components[1].components(separatedBy: "\n")
        .map { $0.components(separatedBy: ",") }
        .map { $0.compactMap(Int.init) }

    // Either valid or invalid based on the part of the task
    let selectedUpdates = updates.filter { update in
        var seen: Set<Int> = .init()
        for page in update {
            let rules = instructions[page] ?? []
            let isValid = rules.map { seen.contains($0) }.allSatisfy { !$0 }
            guard isValid else { return isValidReturnValue }
            seen.insert(page)
        }
        return !isValidReturnValue
    }

    let correctedUpdates = selectedUpdates.map { update in
        var newUpdate: [Int] = []
        update.forEach { page in
            let rules = instructions[page] ?? []
            for i in 0..<newUpdate.count {
                if rules.contains(newUpdate[i]) {
                    newUpdate.insert(page, at: i)
                    return
                }
            }
            newUpdate.append(page)
        }
        return newUpdate
    }

    let result = correctedUpdates
        .map { update in
            let index = (update.count - 1) / 2
            return update[index]
        }
        .reduce(0, +)

    return result
}

assert(solve(input: input, isValidReturnValue: false) == 143)
assert(solve(input: input, isValidReturnValue: true) == 123)
assert(solve(input: mainInput, isValidReturnValue: false) == 5391)
assert(solve(input: mainInput, isValidReturnValue: true) == 6142)
