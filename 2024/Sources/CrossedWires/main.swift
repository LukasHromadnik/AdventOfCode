import Foundation

class Wire {
    let name: String
    var value: Bool?

    init(name: String, value: Bool? = nil) {
        self.name = name
        self.value = value
    }
}

struct Gate {
    enum Variant: String {
        case and = "AND"
        case xor = "XOR"
        case or = "OR"
    }

    let id: Int
    let variant: Variant
    let inputs: [Wire]
    let output: Wire
}

let input = """
x00: 1
x01: 1
x02: 1
y00: 0
y01: 1
y02: 0

x00 AND y00 -> z00
x01 XOR y01 -> z01
x02 OR y02 -> z02
"""

let input2 = """
x00: 1
x01: 0
x02: 1
x03: 1
x04: 0
y00: 1
y01: 1
y02: 1
y03: 1
y04: 1

ntg XOR fgs -> mjb
y02 OR x01 -> tnw
kwq OR kpj -> z05
x00 OR x03 -> fst
tgd XOR rvg -> z01
vdt OR tnw -> bfw
bfw AND frj -> z10
ffh OR nrd -> bqk
y00 AND y03 -> djm
y03 OR y00 -> psh
bqk OR frj -> z08
tnw OR fst -> frj
gnj AND tgd -> z11
bfw XOR mjb -> z00
x03 OR x00 -> vdt
gnj AND wpb -> z02
x04 AND y00 -> kjc
djm OR pbm -> qhw
nrd AND vdt -> hwm
kjc AND fst -> rvg
y04 OR y02 -> fgs
y01 AND x02 -> pbm
ntg OR kjc -> kwq
psh XOR fgs -> tgd
qhw XOR tgd -> z09
pbm OR djm -> kpj
x03 XOR y03 -> ffh
x00 XOR y04 -> ntg
bfw OR bqk -> z06
nrd XOR fgs -> wpb
frj XOR qhw -> z04
bqk OR frj -> z07
y03 OR x01 -> nrd
hwm AND bqk -> z03
tgd XOR rvg -> z12
tnw OR pbm -> gnj
"""

let input3 = """
x00: 0
x01: 1
x02: 0
x03: 1
x04: 0
x05: 1
y00: 0
y01: 0
y02: 1
y03: 1
y04: 0
y05: 1

x00 AND y00 -> z05
x01 AND y01 -> z02
x02 AND y02 -> z01
x03 AND y03 -> z03
x04 AND y04 -> z04
x05 AND y05 -> z00
"""

let c = input3.components(separatedBy: "\n\n")
var wires = c[0].components(separatedBy: "\n")
    .map {
        let c = $0.components(separatedBy: ": ")
        return Wire(name: c[0], value: c[1] == "1")
    }
    .reduce(into: [String: Wire]()) { acc, next in acc[next.name] = next }
func getOrCreateWire(_ name: String) -> Wire {
    if let wire = wires[name] {
        return wire
    } else {
        let wire = Wire(name: name)
        wires[name] = wire
        return wire
    }
}

let gates = c[1].components(separatedBy: "\n")
    .enumerated()
    .map { i, item in
        let c = item.components(separatedBy: " -> ")
        let output = getOrCreateWire(c[1])
        let _c = c[0].components(separatedBy: " ")
        let input1 = getOrCreateWire(_c[0])
        let input2 = getOrCreateWire(_c[2])
        let gateVariant = Gate.Variant(rawValue: _c[1])!
        return Gate(id: i, variant: gateVariant, inputs: [input1, input2], output: output)
    }

func readBinary(_ prefix: String) -> Int {
    let outputWires = wires.values.filter { $0.name.hasPrefix(prefix) }.sorted { $0.name > $1.name }
    let output = outputWires.map { $0.value == true ? "1" : "0" }.joined()

    return Int(output, radix: 2)!
}

func solveGates(outputs: inout [Wire]) -> Int {
    var toProcess = gates
    while !toProcess.isEmpty {
        let gate = toProcess.removeFirst()

        if let i1 = gate.inputs[0].value, let i2 = gate.inputs[1].value {
            outputs[gate.id].value = switch gate.variant {
            case .and: i1 && i2
            case .or: i1 || i2
            case .xor: i1 != i2
            }
        } else {
            toProcess.append(gate)
        }
    }

    return readBinary("z")
}

//var outputs = gates.map(\.output)
//print(solveGates(outputs: &outputs))

//outer: while true {
outer: for i in 0..<gates.count {
        for j in (i + 1)..<gates.count {

            for k in (i + 1)..<gates.count {
                guard k != j else { continue }
                for l in (k + 1)..<gates.count {
                    guard k != j else { continue }


                    var outputs = gates.map(\.output)

                    outputs.swapAt(i, j)
                    outputs.swapAt(k, l)

                    let result = solveGates(outputs: &outputs)
                    print(i, j, k, l, result, readBinary("x"), readBinary("y"))

                    if readBinary("x") + readBinary("y") == result {
                        break outer
                    }
                }
            }
        }
    }
//}
