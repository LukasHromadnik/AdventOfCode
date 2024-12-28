//import Foundation
//
//let conns = input.components(separatedBy: "\n").map { $0.components(separatedBy: "-") }
//var connections: [String: [String]] = [:]
//for conn in conns {
//    let c1 = conn[0]
//    let c2 = conn[1]
//
//    let current1 = connections[c1] ?? []
//    connections[c1] = Array(Set([c2] + current1))
//
//    let current2 = connections[c2] ?? []
//    connections[c2] = Array(Set([c1] + current2))
//}

//var triangles: Set<Set<String>> = []
//connections.forEach { key, value in
//    for i in 0..<value.count - 1 {
//        for j in i + 1..<value.count {
//            if connections[value[i]]!.contains(value[j]) {
//                let triangle = Set([key, value[i], value[j]])
//                triangles.insert(triangle)
//            }
//        }
//    }
//}
//
//var result = 0
//for triangle in triangles {
//    if triangle.contains(where: { $0.hasPrefix("t") }) {
//        print(triangle.joined(separator: ","))
//        result += 1
//    }
//}
//print(result)
