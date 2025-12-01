import Foundation

func iterate(
    count: Int,
    concurrently: Bool = true,
    debug: Bool = false,
    execute: @escaping (Int) -> Void
) {
    if concurrently {
        DispatchQueue.concurrentPerform(iterations: count) { i in
            if debug {
                print("\(i + 1) / \(count)")
            }
            execute(i)
        }
    } else {
        for i in 0..<count {
            execute(i)
        }
    }
}
