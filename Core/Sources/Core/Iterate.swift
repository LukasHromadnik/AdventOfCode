import Foundation

public protocol Number: Sendable {
    static var zero: Self { get }
    static func += (lhs: inout Self, rhs: Self)
}

extension Int: Number { }

extension Double: Number { }

private final class Accumulator<Value: Number>: @unchecked Sendable {
    var value: Value

    private let lock = NSLock()

    init(_ initial: Value) {
        self.value = initial
    }

    func add(_ other: Value) {
        lock.lock()
        value += other
        lock.unlock()
    }
}

public func iterate<Value: Number>(
    count: Int,
    concurrently: Bool = false,
    body: @Sendable (Int) -> Value
) -> Value {
    let acc = Accumulator<Value>(.zero)

    if concurrently {
        DispatchQueue.concurrentPerform(iterations: count) { i in
            acc.add(body(i))
        }
    } else {
        for i in 0..<count {
            acc.add(body(i))
        }
    }

    return acc.value
}
