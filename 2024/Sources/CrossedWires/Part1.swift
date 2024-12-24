import Foundation

//let c = mainInput.components(separatedBy: "\n\n")
//var wires = c[0].components(separatedBy: "\n")
//    .map {
//        let c = $0.components(separatedBy: ": ")
//        return Wire(name: c[0], value: c[1] == "1")
//    }
//    .reduce(into: [String: Wire]()) { acc, next in acc[next.name] = next }
//func getOrCreateWire(_ name: String) -> Wire {
//    if let wire = wires[name] {
//        return wire
//    } else {
//        let wire = Wire(name: name)
//        wires[name] = wire
//        return wire
//    }
//}
//
//let gates = c[1].components(separatedBy: "\n")
//    .map {
//        let c = $0.components(separatedBy: " -> ")
//        let output = getOrCreateWire(c[1])
//        let _c = c[0].components(separatedBy: " ")
//        let input1 = getOrCreateWire(_c[0])
//        let input2 = getOrCreateWire(_c[2])
//        let gateVariant = Gate.Variant(rawValue: _c[1])!
//        return Gate(variant: gateVariant, inputs: [input1, input2], output: output)
//    }
//
//var outputs = gates.map(\.output)
//
//
//
//var toProcess = gates
//while !toProcess.isEmpty {
//    let gate = toProcess.removeFirst()
//
//    if let i1 = gate.inputs[0].value, let i2 = gate.inputs[1].value {
//        gate.output.value = switch gate.variant {
//        case .and: i1 && i2
//        case .or: i1 || i2
//        case .xor: i1 != i2
//        }
//    } else {
//        toProcess.append(gate)
//    }
//}
//
//let outputWires = wires.values.filter { $0.name.hasPrefix("z") }.sorted { $0.name > $1.name }
//let output = outputWires.map { $0.value == true ? "1" : "0" }.joined()
//print(Int(output, radix: 2)!)
