import Foundation

let input = """
Button A: X+94, Y+34
Button B: X+22, Y+67
Prize: X=8400, Y=5400

Button A: X+26, Y+66
Button B: X+67, Y+21
Prize: X=12748, Y=12176

Button A: X+17, Y+86
Button B: X+84, Y+37
Prize: X=7870, Y=6450

Button A: X+69, Y+23
Button B: X+27, Y+71
Prize: X=18641, Y=10279
"""

let machines = mainInput.components(separatedBy: "\n\n")
    .map {
        $0.components(separatedBy: "\n")
            .map {
                let values = $0.components(separatedBy: ": ")[1]
                    .components(separatedBy: ", ")
                    .map { Int(String($0.dropFirst(2)))! }
                return (values[0], values[1])
            }
    }

func computeTokens(_ min: (Int, Int)?) -> Int {
    guard let min else { return .max }
    return min.0 * 3 + min.1
}


func det(_ a11: Int, _ a12: Int, _ a21: Int, _ a22: Int) -> Int {
    a11 * a22 - a12 * a21
}

let result = machines.compactMap { machine in
    let a = machine[0]
    let b = machine[1]
//    let prize = machine[2]
    let prize = (machine[2].0 + 10000000000000, machine[2].1 + 10000000000000)

    //print(a.0, b.0, prize.0)
    //print(a.1, b.1, prize.1)

    let d = det(a.0, b.0, a.1, b.1)
    let d1 = det(prize.0, b.0, prize.1, b.1)
    let d2 = det(a.0, prize.0, a.1, prize.1)
    //print(d, d1, d2)

    if d1.isMultiple(of: d) && d2.isMultiple(of: d) {
        let x = d1 / d
        let y = d2 / d
        return computeTokens((x, y))
    } else {
        return nil
    }
}.reduce(0, +)
print(result)




//
//let result = machines.compactMap { machine in
////    let a = machine[0]
////    let b = machine[1]
////    let prize = (machine[2].0, machine[2].1)
////    let prize = (machine[2].0 + 10000000000000, machine[2].1 + 10000000000000)
//
//    if let min = part2(machine: machine) {
//        return computeTokens(min)
//    } else {
//        return nil
//    }
//
//
////    let numberOfIterations = [prize.0 / a.0, prize.1 / a.1].max()!
////    var min: (Int, Int)?
////    print(numberOfIterations)
////    for i in 0...numberOfIterations {
////        if i % 10_000_000 == 0 {
////            print(i)
////        }
////        let remaining = prize.0 - a.0 * i
////
////        guard remaining.isMultiple(of: b.0) else { continue }
////
////        let bMultiplier = remaining / b.0
////        let y = a.1 * i + b.1 * bMultiplier
////        guard y == prize.1 else { continue }
////
////        if computeTokens(min) > computeTokens((i, bMultiplier)) {
////            min = (i, bMultiplier)
////        }
////    }
////
//////    print(min)
////
////    if let min {
////        return computeTokens(min)
////    } else {
////        return nil
////    }
//}
//.reduce(0, +)
//
//print(result)
//
//import Accelerate
//
//func part2(machine: [(Int, Int)]) -> (Int, Int)? {
//    let _a = machine[0]
//    let _b = machine[1]
////    let prize = (machine[2].0, machine[2].1)
//    let prize = (machine[2].0 + 10000000000000, machine[2].1 + 10000000000000)
//
//    // Define the coefficient matrix A
//    let A: [Double] = [
//        _a.0, _a.1,
//        _b.0, _b.1
//    ].map(Double.init)
//
//    // Define the right-hand side vector B
//    var B: [Double] = [prize.0, prize.1].map(Double.init)
//
//    // Number of equations
//    var n = __CLPK_integer(2) // 2x2 system
//
//    // Number of right-hand sides
//    var nrhs = __CLPK_integer(1) // One right-hand side
//
//    // Leading dimension of A
//    var lda = n
//
//    // Leading dimension of B
//    var ldb = n
//
//    // Pivot indices
//    var ipiv = [__CLPK_integer](repeating: 0, count: Int(n))
//
//    // Copy of A because dgesv modifies it
//    var a = A
//
//    // Info variable to check success
//    var info: __CLPK_integer = 0
//
//    // Solve the system using dgesv
//    dgesv_(&n, &nrhs, &a, &lda, &ipiv, &B, &ldb, &info)
//
//    if info == 0 {
//        let lhs = B[0]
//        let rhs = B[1]
////        print("Solution: x = \(B[0]), y = \(B[1])")
////        print(abs(lhs - round(lhs)))
////        print(abs(rhs - round(rhs)))
//        if abs(lhs - round(lhs)) < 0.000001 && abs(rhs - round(rhs)) < 0.000001 {
////            print("selected")
//            return (Int(round(lhs)), Int(round(rhs)))
//        }
//    } else if info < 0 {
////        print("Illegal value in argument \(-info)")
//    } else {
////        print("Matrix is singular and cannot be solved")
//    }
//
//    return nil
//}
