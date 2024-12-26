import Foundation

let input = """
Register A: 729
Register B: 0
Register C: 0

Program: 0,1,5,4,3,0
"""

struct CPU {
    var registers: [Int]
    let program: [Int]
    var output: [String]

    var formattedOutput: String {
        output.joined(separator: ",")
    }

    var formattedProgram: String {
        program.map(String.init).joined(separator: ",")
    }

    func toInputString() -> String {
        """
        Register A: \(registers[0])
        Register B: \(registers[1])
        Register C: \(registers[2])

        Program: \(program.map(String.init).joined(separator: ","))
        """
    }
}

func solve(_ input: String) -> CPU {
    let components = input.split(separator: "\n\n")
    var registers = components[0].components(separatedBy: "\n").map { $0.components(separatedBy: ": ")[1] }.compactMap(Int.init)
    let program = components[1].split(separator: ": ")[1].split(separator: ",").map(String.init).compactMap(Int.init)

    var instructionPointer = 0
    var output: [String] = []

    func comboOperand(_ value: Int) -> Int {
        switch value {
        case 0, 1, 2, 3: return value
        case 4, 5, 6: return registers[value - 4]
        default: assertionFailure(); return 0
        }
    }

    while instructionPointer < program.count {
        let instruction = program[instructionPointer]
        let operand = program[instructionPointer + 1]

        switch instruction {
        case 0:
            registers[0] = registers[0] / Int(pow(2, Double(comboOperand(operand))))
            instructionPointer += 2

        case 1:
            registers[1] = registers[1] ^ operand
            instructionPointer += 2

        case 2:
            registers[1] = comboOperand(operand) % 8
            instructionPointer += 2

        case 3:
            if registers[0] == 0 {
                instructionPointer += 2
            } else {
                instructionPointer = operand
            }

        case 4:
            registers[1] = registers[1] ^ registers[2]
            instructionPointer += 2

        case 5:
            output.append(String(comboOperand(operand) % 8))
            instructionPointer += 2

        case 6:
            registers[1] = registers[0] / Int(pow(2, Double(comboOperand(operand))))
            instructionPointer += 2

        case 7:
            registers[2] = registers[0] / Int(pow(2, Double(comboOperand(operand))))
            instructionPointer += 2

        default:
            assertionFailure()
        }
    }

    return CPU(registers: registers, program: program, output: output)
}

//assert(solve(input).formattedOutput == "4,6,3,5,6,3,5,2,1,0")
//assert(solve(test1).registers[1] == 1)
//assert(solve(test2).formattedOutput == "0,1,2")
//assert(solve(test3).formattedOutput == "4,2,5,6,7,7,7,7,3,1,0")
//assert(solve(test3).registers[0] == 0)
//assert(solve(test4).registers[1] == 26)
//assert(solve(test5).registers[1] == 44354)
//print(solve(mainInput).formattedOutput)
//var i = 0
let components = mainInput.split(separator: "\n\n")
var registers = components[0].components(separatedBy: "\n").map { $0.components(separatedBy: ": ")[1] }.compactMap(Int.init)
let program = components[1].split(separator: ": ")[1].split(separator: ",").map(String.init).compactMap(Int.init)

var ranges: [ClosedRange<Int>] = [0...1]
outer: while let range = ranges.first {
    ranges = Array(ranges.dropFirst())

    for i in 8*range.lowerBound...8*range.upperBound {
        let cpu = CPU(
            registers: [i, registers[1], registers[2]],
            program: program,
            output: []
        )
        let newInput = cpu.toInputString()
        let newCpu = solve(newInput)

        if cpu.formattedProgram.hasSuffix(newCpu.formattedOutput) {
            ranges.append(i...i+1)
        }

        if cpu.formattedProgram == newCpu.formattedOutput {
            print(i)
            break outer
        }
    }
}
