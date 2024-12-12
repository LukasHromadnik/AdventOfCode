import Foundation

let input = """
broadcaster -> a, b, c
%a -> b
%b -> c
%c -> inv
&inv -> a
"""

let input2 = """
broadcaster -> a
%a -> inv, con
&inv -> b
%b -> con
&con -> output
"""

enum Module: Hashable {
    case button
    case flipFlop(String)
    case conjunction(String)
    case broadcaster
    case other(String)

    var name: String {
        switch self {
        case .button: "button"
        case .flipFlop(let string): string
        case .conjunction(let string): string
        case .broadcaster: "broadcaster"
        case .other(let string): string
        }
    }

    var isConjunction: Bool {
        switch self {
        case .conjunction: true
        case .flipFlop, .broadcaster, .other, .button: false
        }
    }

    var isFlipFlop: Bool {
        switch self {
        case .flipFlop: true
        case .conjunction, .broadcaster, .other, .button: false
        }
    }

    init(stringValue: String) {
        if stringValue == "broadcaster" {
            self = .broadcaster
        } else if stringValue.contains("%") {
            self = .flipFlop(String(stringValue.dropFirst()))
        } else if stringValue.contains("&") {
            self = .conjunction(String(stringValue.dropFirst()))
        } else {
            self = .other(stringValue)
        }
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }
}

enum Pulse {
    case low
    case high
}

enum ModuleState {
    case flipFlop(Bool)
    case conjunction([Module: Pulse])
}

func log(_ values: Any..., use: Bool = false) {
    guard use else { return }
    print(values.map { String(describing: $0) }.joined(separator: " "))
}

var modules: Set<Module> = []
var _outputs: [Module: [String]] = [:]
var states: [Module: ModuleState] = [:]
mainInput.components(separatedBy: "\n").forEach { line in
    let parts = line.components(separatedBy: " -> ")
    let module = Module(stringValue: parts[0])
    _outputs[module] = parts[1].components(separatedBy: ", ")
    modules.insert(module)
}
let outputs = _outputs.mapValues { $0.map { name in modules.first { $0.name == name } ?? Module(stringValue: name) } }
outputs.forEach { module, output in
    if module.isFlipFlop {
        states[module] = .flipFlop(false)
    }

    output.filter { $0.isConjunction }.forEach {
        if let state = states[$0] {
            switch state {
            case var .conjunction(innerState):
                innerState[module] = .low
                states[$0] = .conjunction(innerState)
            case .flipFlop:
                assertionFailure()
            }
        } else {
            states[$0] = .conjunction([module: .low])
        }
    }
}

let numberOfPushes = 1000
var push = 0
var lows = 0
var highs = 0
var cycles = ["bh": 0, "jf": 0, "sh": 0, "mz": 0]
var runLoop = true
while runLoop {
    if push % 10000 == 0 {
        print(push)
    }
    var queue: [(Module, Pulse, Module)] = [(.button, .low, .broadcaster)]
    while !queue.isEmpty {
        let (from, pulse, module) = queue.removeFirst()

        switch pulse {
        case .low: lows += 1
        case .high: highs += 1
        }

        switch module {
        case .button:
            assertionFailure()

        case .broadcaster:
            outputs[module]!.forEach { output in
                log(module.name, pulse, "->", output.name)
                queue.append((module, pulse, output))
            }

        case .flipFlop:
            guard pulse == .low else { continue }
            guard case let .flipFlop(value) = states[module] else { assertionFailure(); break }
            outputs[module]!.forEach { output in
                let pulse: Pulse = value ? .low : .high
                log(module.name, pulse, "->", output.name)
                queue.append((module, pulse, output))
            }
            states[module] = .flipFlop(!value)

        case .conjunction:
            guard case let .conjunction(state) = states[module] else { assertionFailure(); break }
            
            var newState = state
            newState[from] = pulse
            states[module] = .conjunction(newState)

            let newPulse: Pulse = newState.values.allSatisfy { $0 == .high } ? .low : .high
            outputs[module]!.forEach { output in
                log(module.name, newPulse, "->", output.name)
                queue.append((module, newPulse, output))
            }

            if ["bh", "jf", "sh", "mz"].contains(module.name) && newPulse == .high {
                cycles[module.name] = push + 1
                if cycles.values.allSatisfy({$0 > 0 }) {
                    runLoop = false
                }
            }

        case let .other(name):
            if name == "rx" && pulse == .low {
                print(push)
                exit(0)
            }
        }
    }

    push += 1
    log()
}

func gcd(_ x: Int, _ y: Int) -> Int {
    var a = 0
    var b = max(x, y)
    var r = min(x, y)

    while r != 0 {
        a = b
        b = r
        r = a % b
    }
    return b
}

func lcm(_ x: Int, _ y: Int) -> Int {
    x / gcd(x, y) * y
}

print(cycles.values.reduce(1) { lcm($0, $1) })
