import Foundation

public protocol HasPredecessor {
    var predecessor: Self? { get }
}
