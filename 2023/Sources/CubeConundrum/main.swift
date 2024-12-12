import Foundation

let input = """
Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green
"""
let result = mainInput
    .split(separator: "\n")
    .compactMap { game -> Int? in
        let elements = game.split(separator: ": ")
        var colors = ["red": 0, "green": 0, "blue": 0]
        elements[1]
            .split(separator: "; ")
            .flatMap { $0.split(separator: ", ") }
            .map { $0.split(separator: " ") }
            .forEach {
                let value = Int(String($0[0]))!
                let key = String($0[1])
                colors[key] = max(colors[key]!, value)
            }

        return colors.values.reduce(1, *)
    }
    .reduce(0, +)

print(result)
