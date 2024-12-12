import Foundation

let input = """
32T3K 765
T55J5 684
KK677 28
KTJJT 220
QQQJA 483
"""

enum Card2: String, CaseIterable {
    case j = "J"
    case c2 = "2"
    case c3 = "3"
    case c4 = "4"
    case c5 = "5"
    case c6 = "6"
    case c7 = "7"
    case c8 = "8"
    case c9 = "9"
    case t = "T"
    case q = "Q"
    case k = "K"
    case a = "A"

    var prioritory: Int {
        Card2.allCases.firstIndex(of: self)!
    }
}

extension Hand where Element == Card2 {
    var variant: Variant {
        var counts: [Element: Int] = [:]
        cards.forEach {
            let value = counts[$0] ?? 0
            counts[$0] = value + 1
        }
        let sorted = counts.values.sorted(by: >)
        let numberOfJokers = cards.filter { $0 == .j }.count

        if sorted[0] == 5 { return .fiveKind }

        else if sorted[0] == 4 && numberOfJokers == 4 { return .fiveKind }
        else if sorted[0] == 4 && numberOfJokers == 1 { return .fiveKind }
        else if sorted[0] == 4 { return .fourKind }
        
        else if sorted[0] == 3 && sorted[1] == 2 && numberOfJokers >= 2 { return .fiveKind }
        else if sorted[0] == 3 && sorted[1] == 2 { return .fullHouse }

        else if sorted[0] == 3 && sorted[1] == 1 && numberOfJokers == 3 { return .fourKind }
        else if sorted[0] == 3 && sorted[1] == 1 && numberOfJokers == 1 { return .fourKind }
        else if sorted[0] == 3 && sorted[1] == 1 { return .threeKind }
        
        else if sorted[0] == 2 && sorted[1] == 2 && numberOfJokers == 2 { return .fourKind }
        else if sorted[0] == 2 && sorted[1] == 2 && numberOfJokers == 1 { return .fullHouse }
        else if sorted[0] == 2 && sorted[1] == 2 { return .twoPair }

        else if sorted[0] == 2 && sorted[1] == 1 && numberOfJokers >= 1 { return .threeKind }
        else if sorted[0] == 2 && sorted[1] == 1 { return .onePair }
        
        else if numberOfJokers == 1 { return .onePair }
        else { return .highCard }
    }
}

let result = mainInput.components(separatedBy: "\n")
    .map { line in
        let values = line.components(separatedBy: " ")
        return Hand(
            cards: Array(values[0]).map(String.init).compactMap(Card2.init(rawValue:)),
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
print(result)
