import Foundation

protocol GridElement: Hashable, Equatable, RawRepresentable<String> { }

struct Grid<Element: GridElement> {
    struct Row {
        var items: [Element]

        var count: Int { items.count }

        init(_ string: String) {
            items = Array(string).map(String.init).compactMap(Element.init(rawValue:))
        }

        subscript(_ col: Int) -> Element {
            get { items[col] }
            set { items[col] = newValue }
        }
    }

    var rows: [Row]

    init(_ string: String) {
        rows = string.components(separatedBy: "\n").map(Row.init)
    }

    func find(_ element: Element) -> Point? {
        for i in 0..<numberOfRows {
            for j in 0..<numberOfColumns {
                if self[i][j] == element {
                    return Point(i, j)
                }
            }
        }

        return nil
    }

    func contains(_ point: Point) -> Bool {
        point.i >= 0 && point.i < numberOfRows && point.j >= 0 && point.j < numberOfColumns
    }
}

extension Grid {
    var numberOfRows: Int {
        rows.count
    }

    var numberOfColumns: Int {
        rows[0].count
    }

    var indexes: [(Int, Int)] {
        (0..<numberOfRows).flatMap { i in (0..<numberOfColumns).map { j in (i, j) } }
    }

    subscript(_ row: Int) -> Row {
        rows[row]
    }

    subscript(_ point: Point) -> Element {
        get { rows[point.i][point.j] }
        set { rows[point.i][point.j] = newValue }
    }
}

extension Grid: CustomStringConvertible {
    var description: String {
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
