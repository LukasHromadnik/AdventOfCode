import Foundation

extension Hand where Element == Card {
    var variant: Variant {
        var counts: [Element: Int] = [:]
        cards.forEach {
            let value = counts[$0] ?? 0
            counts[$0] = value + 1
        }
        let sorted = counts.values.sorted(by: >)
        if sorted[0] == 5 { return .fiveKind }
        else if sorted[0] == 4 { return .fourKind }
        else if sorted[0] == 3 && sorted[1] == 2 { return .fullHouse }
        else if sorted[0] == 3 && sorted[1] == 1 { return .threeKind }
        else if sorted[0] == 2 && sorted[1] == 2 { return .twoPair }
        else if sorted[0] == 2 && sorted[1] == 1 { return .onePair }
        else { return .highCard }
    }
}

enum Part1 {
    static func invoke(_ input: String) -> Int {
        input.components(separatedBy: "\n")
            .map { line in
                let values = line.components(separatedBy: " ")
                return Hand(
                    cards: Array(values[0]).map(String.init).compactMap(Card.init(rawValue:)),
                    bid: Int(values[1])!
                )
            }
            .sorted { (lhs: Hand, rhs: Hand) -> Bool in
                if lhs.variant.prioritory > rhs.variant.prioritory { return true }
                else if lhs.variant.prioritory < rhs.variant.prioritory { return false }

                for i in 0..<5 {
                    if lhs.cards[i].prioritory > rhs.cards[i].prioritory { return true }
                    else if lhs.cards[i].prioritory < rhs.cards[i].prioritory { return false }
                }

                assertionFailure()
                return false
            }
            .reversed()
            .enumerated()
            .map { offset, element in
                (offset + 1) * element.bid
            }
            .reduce(0, +)
    }
}
