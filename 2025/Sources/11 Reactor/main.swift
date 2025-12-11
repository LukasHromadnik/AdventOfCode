import Foundation

let input = """
aaa: you hhh
you: bbb ccc
bbb: ddd eee
ccc: ddd eee fff
ddd: ggg
eee: out
fff: out
ggg: out
hhh: ccc fff iii
iii: out
"""

let input2 = """
svr: aaa bbb
aaa: fft
fft: ccc
bbb: tty
tty: ccc
ccc: ddd eee
ddd: hub
hub: fff
eee: dac
dac: fff
fff: ggg hhh
ggg: out
hhh: out
"""

let lines = mainInput.split(separator: "\n").map(String.init)
let servers = lines.reduce(into: [String: [String]]()) { acc, next in
    let split = next.split(separator: ": ")
    let key = String(split[0])
    let outputs = split[1].split(separator: " ").map(String.init)

    acc[key] = outputs
}

struct Key: Hashable {
    let key: String
    let hasDac: Bool
    let hasFft: Bool
}

var cache: [Key: Int] = [:]

func computeDistanceToFinish(_ key: Key) -> Int {
    if let value = cache[key] {
        return value
    }

    if key.key == "out" {
        if key.hasDac && key.hasFft {
            return 1
        } else {
            return 0
        }
    }

    let outputs = servers[key.key] ?? []
    let finishes = outputs.map {
        let hasDac = key.hasDac || $0 == "dac"
        let hasFft = key.hasFft || $0 == "fft"
        let newKey = Key(key: $0, hasDac: hasDac, hasFft: hasFft)
        return computeDistanceToFinish(newKey)
    }

    cache[key] = finishes.reduce(0, +)
    return cache[key]!
}

//print(computeDistanceToFinish(Key(key: "you", hasDac: true, hasFft: true)))
print(computeDistanceToFinish(Key(key: "svr", hasDac: false, hasFft: false)))
