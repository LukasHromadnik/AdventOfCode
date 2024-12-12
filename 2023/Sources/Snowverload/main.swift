import Foundation

let input = """
jqt: rhn xhk nvd
rsh: frs pzl lsr
xhk: hfx
cmg: qnr nvd lhk bvb
rhn: xhk bvb hfx
bvb: xhk hfx
pzl: lsr hfx nvd
qnr: nvd
ntq: jqt hfx bvb xhk
nvd: lhk
lsr: lhk
rzs: qnr cmg lsr rsh
frs: qnr lhk lsr
"""

let lines = mainInput.components(separatedBy: "\n").map {
    let parts = $0.components(separatedBy: ": ")
    let from = parts[0]
    let to = parts[1].components(separatedBy: " ")
    return (from, to)
}
let nodes = Array(Set(lines.map { [$0] + $1 }.reduce([], +)))

func hasCut() -> Bool {
    var visited = Array(repeating: false, count: nodes.count)
    var queue = [0]
    while !queue.isEmpty {
        let pop = queue.removeFirst()
        guard !visited[pop] else { continue }
        visited[pop] = true
        queue.append(
            contentsOf: graph[pop].enumerated().filter { $0.element && !queue.contains($0.offset) }.map(\.offset)
        )
    }
    return !visited.allSatisfy { $0 }
}

var graph = Array(
    repeating: Array(repeating: false, count: nodes.count),
    count: nodes.count
)

lines.forEach { (from, to) in
    let fromIndex = nodes.firstIndex(of: from)!
    to.forEach {
        let toIndex = nodes.firstIndex(of: $0)!
        graph[fromIndex][toIndex] = true
        graph[toIndex][fromIndex] = true
    }
}
/*
let randomPairs = 200
let fromIndexes = (0..<randomPairs).map { _ in Int.random(in: 0..<nodes.count) }
let toIndexes = (0..<randomPairs).map { _ in Int.random(in: 0..<nodes.count) }
let indexes = Array(zip(fromIndexes, toIndexes))
//let indexes = [(nodes.firstIndex(of: "frs")!, nodes.firstIndex(of: "lsr")!)]

var counts: [[Int]] = Array(
    repeating: Array(repeating: 0, count: nodes.count),
    count: nodes.count
)

for i in 0..<indexes.count {
    let from = indexes[i].0
    let to = indexes[i].1

    var visited = Array(repeating: false, count: nodes.count)
    var predecessors = Array(repeating: -1, count: nodes.count)
    var queue = [from]
    while !queue.isEmpty {
        let pop = queue.removeFirst()
        if visited[pop] { continue }
        visited[pop] = true

        if pop == to { break }

        let neighbors = graph[pop].enumerated()
            .filter { $0.element }
            .map(\.offset)
            .filter { !queue.contains($0) && !visited[$0] }
        neighbors.forEach {
            predecessors[$0] = pop
        }
        queue.append(contentsOf: neighbors)
    }

    var p1 = to
    while true {
        let p2 = predecessors[p1]

        if p2 == -1 {
            break
        }

        counts[p1][p2] += 1
        counts[p2][p1] += 1

        p1 = p2
    }
}

print(counts)

var top3Counts = [0, 0, 0]
var top3 = Array(repeating: (-1, -1), count: 3)


for i in 0..<counts.count {
    for j in 0..<counts[i].count {
        let count = counts[i][j]
        if top3.contains(where: { $0 == (i, j) || $0 == (j, i) }) {
            continue
        }

        if let index = top3Counts.firstIndex(where: { $0 < count }) {
            top3Counts[index] = count
            top3[index] = (i, j)
        }
    }
}

top3.forEach {
    graph[$0.0][$0.1] = false
    graph[$0.1][$0.0] = false
}

var visited = Array(repeating: false, count: nodes.count)
var queue = [0]
while !queue.isEmpty {
    let pop = queue.removeFirst()
    
    guard !visited[pop] else { continue }
    visited[pop] = true

    queue.append(
        contentsOf: graph[pop].enumerated().filter { $0.element && !queue.contains($0.offset) }.map(\.offset)
    )
}

print(visited.filter { $0 }.count)
print(visited.filter { !$0 }.count)
*/
















func graphIndex(_ i: Int) -> (Int, Int) {
    (i / graph.count, i % graph.count)
}

let numberOfEdges = Int(pow(Double(graph.count), 2))
var loop = 0
outerLoop: for i in 0..<numberOfEdges {
    let iIndex = graphIndex(i)
    guard graph[iIndex.0][iIndex.1] else { continue }

    for j in (i + 1)..<numberOfEdges {
        let jIndex = graphIndex(j)
        guard graph[jIndex.0][jIndex.1] else { continue }

        if iIndex.0 == jIndex.0 || iIndex.1 == jIndex.1 {
            continue
        }

        for k in (j + 1)..<numberOfEdges {
            let kIndex = graphIndex(k)
            guard graph[kIndex.0][kIndex.1] else { continue }

            loop += 1

                print(loop)
//            }

            if iIndex.0 == kIndex.0 || jIndex.0 == kIndex.0 || iIndex.1 == kIndex.1 || jIndex.1 == kIndex.1 {
                continue
            }

            graph[iIndex.0][iIndex.1] = false
            graph[iIndex.1][iIndex.0] = false
            graph[jIndex.0][jIndex.1] = false
            graph[jIndex.1][jIndex.0] = false
            graph[kIndex.0][kIndex.1] = false
            graph[kIndex.1][kIndex.0] = false

            if hasCut() {
                break outerLoop
            }

            graph[iIndex.0][iIndex.1] = true
            graph[iIndex.1][iIndex.0] = true
            graph[jIndex.0][jIndex.1] = true
            graph[jIndex.1][jIndex.0] = true
            graph[kIndex.0][kIndex.1] = true
            graph[kIndex.1][kIndex.0] = true
        }
    }
}

var visited = Array(repeating: false, count: nodes.count)
var queue = [0]
while !queue.isEmpty {
    let pop = queue.removeFirst()

    guard !visited[pop] else { continue }
    visited[pop] = true

    queue.append(
        contentsOf: graph[pop].enumerated().filter { $0.element && !queue.contains($0.offset) }.map(\.offset)
    )
}

print(visited.filter { $0 }.count)
print(visited.filter { !$0 }.count)
print(visited.filter { !$0 }.count * visited.filter { $0 }.count)
