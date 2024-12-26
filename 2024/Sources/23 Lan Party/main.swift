import Foundation

let input = """
kh-tc
qp-kh
de-cg
ka-co
yn-aq
qp-ub
cg-tb
vc-aq
tb-ka
wh-tc
yn-cg
kh-ub
ta-co
de-co
tc-td
tb-wq
wh-td
ta-ka
td-qp
aq-cg
wq-ub
ub-vc
de-ta
wq-aq
wq-vc
wh-yn
ka-de
kh-ta
co-tc
wh-qp
tb-vc
td-yn
"""
let conns = mainInput.components(separatedBy: "\n").map { $0.components(separatedBy: "-") }

var computers: [String: Int] = [:]
for conn in conns {
    if computers[conn[0]] == nil {
        computers[conn[0]] = computers.count
    }
    if computers[conn[1]] == nil {
        computers[conn[1]] = computers.count
    }
}

let numbersOfComputers = computers.count

//var connections: [String: [String]] = [:]
var neighbors: [[Bool]] = Array(repeating: Array(repeating: false, count: numbersOfComputers), count: numbersOfComputers)
for conn in conns {
    let c1 = computers[conn[0]]!
    let c2 = computers[conn[1]]!
    neighbors[c1][c2] = true
    neighbors[c2][c1] = true
}

// Funkce pro kontrolu, zda je daná množina vrcholů klikou
func isClique(graph: [[Bool]], vertices: [Int]) -> Bool {
    for i in 0..<vertices.count {
        for j in i+1..<vertices.count {
            if !graph[vertices[i]][vertices[j]] {
                return false
            }
        }
    }
    return true
}

// Backtracking pro nalezení maximální kliky
func findMaxClique(graph: [[Bool]]) -> [Int] {
    let n = graph.count
    var maxClique: [Int] = []

    func backtrack(currentClique: [Int], start: Int) {
        if currentClique.count > maxClique.count {
            maxClique = currentClique
        }
        for i in start..<n {
            if isClique(graph: graph, vertices: currentClique + [i]) {
                backtrack(currentClique: currentClique + [i], start: i + 1)
            }
        }
    }

    backtrack(currentClique: [], start: 0)
    return maxClique
}

// Hledání maximální kliky
let maxClique = findMaxClique(graph: neighbors)
print(maxClique.map { item in computers.first { $0.value == item }!.key }.sorted().joined(separator: ","))
