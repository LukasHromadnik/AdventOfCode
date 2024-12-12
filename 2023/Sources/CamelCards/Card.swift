import Foundation

enum Card: String, CaseIterable {
    case c2 = "2"
    case c3 = "3"
    case c4 = "4"
    case c5 = "5"
    case c6 = "6"
    case c7 = "7"
    case c8 = "8"
    case c9 = "9"
    case t = "T"
    case j = "J"
    case q = "Q"
    case k = "K"
    case a = "A"

    var prioritory: Int {
        Card.allCases.firstIndex(of: self)!
    }
}
