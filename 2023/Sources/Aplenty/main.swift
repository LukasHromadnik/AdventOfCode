import Foundation

enum Destination {
    case accepted
    case rejected
    case workflow(String)

    init(stringValue: String) {
        switch stringValue {
        case "A": self = .accepted
        case "R": self = .rejected
        default: self = .workflow(stringValue)
        }
    }

    var isFinal: Bool {
        switch self {
        case .accepted, .rejected: true
        case .workflow: false
        }
    }

    var workflow: String? {
        switch self {
        case let .workflow(name): name
        case .accepted, .rejected: nil
        }
    }
}

enum Condition {
    case lower(String, Int, Destination)
    case upper(String, Int, Destination)
    case direct(Destination)
}

let input = """
px{a<2006:qkq,m>2090:A,rfg}
pv{a>1716:R,A}
lnx{m>1548:A,A}
rfg{s<537:gd,x>2440:R,A}
qs{s>3448:A,lnx}
qkq{x<1416:A,crn}
crn{x>2662:A,R}
in{s<1351:px,qqz}
qqz{s>2770:qs,m<1801:hdj,R}
gd{a>3333:R,R}
hdj{m>838:A,pv}

{x=787,m=2655,a=1222,s=2876}
{x=1679,m=44,a=2067,s=496}
{x=2036,m=264,a=79,s=2244}
{x=2461,m=1339,a=466,s=291}
{x=2127,m=1623,a=2188,s=1013}
"""

let input2 = """
in{s<1351:px,A}
px{a<2006:R,A}
"""

let parts = mainInput.components(separatedBy: "\n\n")
var workflows: [String: [Condition]] = [:]
parts[0].components(separatedBy: "\n").forEach {
    let parts = $0.dropLast().components(separatedBy: "{")
    let name = parts[0]
    let conditions = parts[1].components(separatedBy: ",").map {
        if $0.contains(where: { $0 == "<" }) {
            let components = $0.components(separatedBy: "<")
            let key = components[0]
            let components2 = components[1].components(separatedBy: ":")
            let value = Int(components2[0])!
            let to = components2[1]
            return Condition.lower(key, value, Destination(stringValue: to))
        } else if $0.contains(where: { $0 == ">" }) {
            let components = $0.components(separatedBy: ">")
            let key = components[0]
            let components2 = components[1].components(separatedBy: ":")
            let value = Int(components2[0])!
            let to = components2[1]
            return Condition.upper(key, value, Destination(stringValue: to))
        } else {
            return Condition.direct(Destination(stringValue: $0))
        }
    }
    workflows[name] = conditions
}


var items: [[String: Range<Int>]] = [["x": 1..<4001, "m": 1..<4001, "a": 1..<4001, "s": 1..<4001]]
var count = 0
var i = 0
while !items.isEmpty {
    let item = items.popLast()!
//    i += 1
//    if i == 100 {
//        break
//    }
//    print("[ITEM]", item)
    var dest: Destination = .workflow("in")
    innerWhile: while true {
        guard let workflow = dest.workflow else { break }
//        print(workflow)

        outerLoop: for condition in workflows[workflow]! {
//            print(condition)
            switch condition {
            case let .lower(key, value, destination):
                if item[key]!.contains(value) && item[key]!.lowerBound != value {
//                    print(value, item[key]!)
                    var newItem1 = item
                    newItem1[key] = item[key]!.lowerBound..<value

                    var newItem2 = item
                    newItem2[key] = value..<item[key]!.upperBound
                    items.append(contentsOf: [newItem1, newItem2])
//                    print(newItem1)
//                    print(newItem2)
                    break innerWhile
                } else if item[key]!.upperBound <= value {
                    dest = destination
                    break outerLoop
                }

            case let .upper(key, value, destination):
                if item[key]!.contains(value) && item[key]!.upperBound != value + 1 {
//                    print(value, item[key]!)
                    var newItem1 = item
                    newItem1[key] = item[key]!.lowerBound..<(value + 1)

                    var newItem2 = item
                    newItem2[key] = (value + 1)..<item[key]!.upperBound
                    items.append(contentsOf: [newItem1, newItem2])
//                    print(newItem1)
//                    print(newItem2)
                    break innerWhile
                } else if item[key]!.lowerBound >= value {
                    dest = destination
                    break outerLoop
                }

            case let .direct(destination):
                dest = destination
                break outerLoop
            }
        }
    }

    switch dest {
    case .accepted: count += item.map(\.value.count).reduce(1, *)
    case .rejected: break //print("R", item)
    case .workflow: break
    }
}
print(count)

/* PART ONE
let items = parts[1].components(separatedBy: "\n").map {
    var part: [String: Int] = [:]
    $0.dropFirst().dropLast().components(separatedBy: ",").forEach {
        let parts = $0.components(separatedBy: "=")
        let key = parts[0]
        let value = Int(parts[1])!
        part[key] = value
    }
    return part
}

let result = items.map { item in
    var dest: Destination = .workflow("in")
    while true {
        guard let workflow = dest.workflow else { break }
        outerLoop: for condition in workflows[workflow]! {
            switch condition {
            case let .lower(key, value, destination):
                if item[key]! < value {
                    dest = destination
                    break outerLoop
                }

            case let .upper(key, value, destination):
                if item[key]! > value {
                    dest = destination
                    break outerLoop
                }

            case let .direct(destination):
                dest = destination
                break outerLoop
            }
        }
    }
    switch dest {
    case .accepted: return item.values.reduce(0, +)
    case .rejected, .workflow: return 0
    }
}

print(result.reduce(0, +))
*/
