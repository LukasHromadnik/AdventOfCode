struct Hand<Element: Hashable> {
    enum Variant: CaseIterable {
        case highCard
        case onePair
        case twoPair
        case threeKind
        case fullHouse
        case fourKind
        case fiveKind

        var prioritory: Int {
            Variant.allCases.firstIndex(of: self)!
        }
    }

    let cards: [Element]
    let bid: Int
}
