import Foundation

public protocol GridElement: Hashable, Equatable, Sendable, SendableMetatype, RawRepresentable<String> { }

extension String: @retroactive RawRepresentable {}
extension String: GridElement {
    public var rawValue: String {
        self
    }

    public init?(rawValue: String) {
        self = rawValue
    }
}

public struct Grid<Element: GridElement> {
    public struct Row {
        var items: [Element]

        public var count: Int { items.count }

        init(_ string: String) {
            items = Array(string)
                .map(String.init)
                .compactMap(Element.init(rawValue:))
        }

        public subscript(_ col: Int) -> Element {
            get { items[col] }
            set { items[col] = newValue }
        }
    }

    var rows: [Row]

    public init(_ string: String) {
        rows = string.components(separatedBy: "\n").map(Row.init)
    }

    public func find(_ element: Element) -> Point? {
        for i in 0..<numberOfRows {
            for j in 0..<numberOfColumns {
                if self[i][j] == element {
                    return Point(i, j)
                }
            }
        }

        return nil
    }

    public func contains(_ point: Point) -> Bool {
        point.i >= 0 && point.i < numberOfRows && point.j >= 0 && point.j < numberOfColumns
    }
}

extension Grid {
    public var numberOfRows: Int {
        rows.count
    }

    public var numberOfColumns: Int {
        rows[0].count
    }

    public var indexes: [(Int, Int)] {
        (0..<numberOfRows).flatMap { i in (0..<numberOfColumns).map { j in (i, j) } }
    }

    public subscript(_ row: Int) -> Row {
        rows[row]
    }

    public subscript(_ point: Point) -> Element {
        get { rows[point.i][point.j] }
        set { rows[point.i][point.j] = newValue }
    }
}

extension Grid: CustomStringConvertible {
    public var description: String {
        var result = ""
        for i in 0..<numberOfRows {
            for j in 0..<numberOfColumns {
                result += self[i][j].rawValue
            }
            result += "\n"
        }
        return result
    }
}

