import Foundation

let input = """
1
2
3
2024
"""
let secrets = mainInput.components(separatedBy: "\n").compactMap(Int.init)
//let secrets = [123]

func mix(_ value: Int, into: Int) -> Int {
    into ^ value
}

func prune(_ value: Int) -> Int {
    value % 16777216
}

func calculateNextSecret(_ secret: Int) -> Int {
    let s1 = prune(mix(secret * 64, into: secret))
    let s2 = prune(mix(s1 / 32, into: s1))
    return prune(mix(s2 * 2048, into: s2))
}

var storage: [Int] = Array(repeating: 0, count: 3_200_000)
let lock = NSLock()

DispatchQueue.concurrentPerform(iterations: secrets.count) {
    print("ITER", $0)
    let secret = secrets[$0]
    var localStorage: [Int] = Array(repeating: 0, count: 3_200_000)
    var sequence = [secret]
    for _ in 0..<2000 {
        let nextSecret = calculateNextSecret(sequence.last!)
        sequence.append(nextSecret)
    }

    var differences: [Int] = []
    for i in 1..<sequence.count {
        let difference = (sequence[i] % 10) - (sequence[i - 1] % 10)
        differences.append(difference)
    }

    for i in 3..<differences.count {
        let d1 = (differences[i - 3] + 10) * 20
        let d2 = (differences[i - 2] + 10) * 400
        let d3 = (differences[i - 1] + 10) * 8_000
        let d4 = (differences[i] + 10) * 160_000
        let key = d1 + d2 + d3 + d4
        if localStorage[key] > 0 { continue }
        localStorage[key] = sequence[i + 1] % 10
    }

    lock.lock()
    for i in 0..<localStorage.count {
        storage[i] += localStorage[i]
    }
    lock.unlock()
}

print(storage.max()!)

//let result = secrets
//    .map {
//        var secret = $0
//        for _ in 0..<2000 {
//            secret = calculateNextSecret(secret)
//        }
//        return secret
//    }
//    .reduce(0, +)
//print(result)

