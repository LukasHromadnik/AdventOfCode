import Foundation

func print(_ items: String..., padding: Int) {
    for _ in 0..<padding {
        print(" ", terminator: "")
    }
    print(items.joined(separator: " "))
}
