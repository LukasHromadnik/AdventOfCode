//import Foundation
//
//protocol GridElement: Hashable, Equatable, RawRepresentable<String> { }
//
//struct Point: Hashable {
//    let i: Int
//    let j: Int
//
//    func up() -> Point {
//        Point(i: i - 1, j: j)
//    }
//
//    func left() -> Point {
//        Point(i: i, j: j - 1)
//    }
//
//    func down() -> Point {
//        Point(i: i + 1, j: j)
//    }
//
//    func right() -> Point {
//        Point(i: i, j: j + 1)
//    }
//}
//
//struct Grid<Element: GridElement> {
//    struct Row {
//        var items: [Element]
//
//        var count: Int { items.count }
//
//        init(_ string: String) {
//            items = Array(string).map(String.init).compactMap(Element.init(rawValue:))
//        }
//
//        subscript(_ col: Int) -> Element {
//            get { items[col] }
//            set { items[col] = newValue }
//        }
//    }
//
//    var rows: [Row]
//
//    init(_ string: String) {
//        rows = string.components(separatedBy: "\n").map(Row.init)
//    }
//
//    func find(_ element: Element) -> Point? {
//        for i in 0..<numberOfRows {
//            for j in 0..<numberOfColumns {
//                if self[i][j] == element {
//                    return Point(i: i, j: j)
//                }
//            }
//        }
//
//        return nil
//    }
//}
//
//extension Grid {
//    var numberOfRows: Int {
//        rows.count
//    }
//
//    var numberOfColumns: Int {
//        rows[0].count
//    }
//
//    var indexes: [(Int, Int)] {
//        (0..<numberOfRows).flatMap { i in (0..<numberOfColumns).map { j in (i, j) } }
//    }
//
//    subscript(_ row: Int) -> Row {
//        rows[row]
//    }
//
//    subscript(_ point: Point) -> Element {
//        get { rows[point.i][point.j] }
//        set { rows[point.i][point.j] = newValue }
//    }
//}
//
//extension Grid: CustomStringConvertible {
//    var description: String {
//        var result = ""
//        for i in 0..<numberOfRows {
//            for j in 0..<numberOfColumns {
//                result += self[i][j].rawValue
//            }
//            result += "\n"
//        }
//        return result
//    }
//}
//
//enum Orientation: String {
//    case up = "^"
//    case left = "<"
//    case down = "v"
//    case right = ">"
//}
//
//enum Element: String, GridElement {
//    case wall = "#"
//    case box = "O"
//    case empty = "."
//    case player = "@"
//}
//
//let input = """
//##########
//#..O..O.O#
//#......O.#
//#.OO..O.O#
//#..O@..O.#
//#O#..O...#
//#O..O..O.#
//#.OO.O.OO#
//#....O...#
//##########
//
//<vv>^<v^>v>^vv^v>v<>v^v<v<^vv<<<^><<><>>v<vvv<>^v^>^<<<><<v<<<v^vv^v>^
//vvv<<^>^v^^><<>>><>^<<><^vv^^<>vvv<>><^^v>^>vv<>v<<<<v<^v>^<^^>>>^<v<v
//><>vv>v^v^<>><>>>><^^>vv>v<^^^>>v^v^<^^>v^^>v^<^v>v<>>v^v^<v>v^^<^^vv<
//<<v<^>>^^^^>>>v^<>vvv^><v<<<>^^^vv^<vvv>^>v<^^^^v<>^>vvvv><>>v^<<^^^^^
//^><^><>>><>^^<<^^v>>><^<v>^<vv>>v>>>^v><>^v><<<<v>>v<v<v>vvv>^<><<>^><
//^>><>^v<><^vvv<^^<><v<<<<<><^v<<<><<<^^<v<^^^><^>>^<v^><<<^>>^v<v^v<v^
//>^>>^v>vv>^<<^v<>><<><<v<<v><>v<^vv<<<>^^v^>^^>>><<^v>>v^v><^^>>^<>vv^
//<><^^>^^^<><vvvvv^v<v<<>^v<v>v<<^><<><<><<<^^<<<^<<>><<><^^^>^^<>^>v<>
//^^>vv<^v^v<vv>^<><v<^v>^^^>>>^^vvv^>vvv<>>>^<^>>>>>^<<^v>^vvv<>^<><<v>
//v^^>>><<^^<>>^v^<v^vv<>v^<<>^<^v^v><^<<<><<^<v><v<>vv>>v><v^<vv<>v^<<^
//"""
//
//func moveForInstruction(
//    _ instruction: Orientation
//) -> (Point) -> Point {
//    switch instruction {
//    case .up:    { $0.up() }
//    case .left:  { $0.left() }
//    case .down:  { $0.down() }
//    case .right: { $0.right() }
//    }
//}
//
//func emptySpaceFrom(
//    _ point: Point,
//    on grid: inout Grid<Element>,
//    move: (Point) -> Point
//) -> Point? {
//    var point = point
//    while true {
//        switch grid[point] {
//        case .empty: return point
//        case .wall: return nil
//        default: break
//        }
//
//        point = move(point)
//    }
//}
//
//func makeMove(
//    from: Point,
//    to: Point,
//    on grid: inout Grid<Element>,
//    move: (Point) -> Point
//) {
//    let next = move(from)
//    if next != to {
//        makeMove(from: next, to: to, on: &grid, move: move)
//    }
//    grid[next] = grid[from]
//    grid[from] = .empty
//}
//
//func solve(_ input: String) -> Int {
//    let components = input.components(separatedBy: "\n\n")
//    var grid = Grid<Element>(components[0])
//    let instructions = components[1].map(String.init).compactMap(Orientation.init(rawValue:))
//
//    var point: Point! = grid.find(.player)
//    for instruction in instructions {
//        let move = moveForInstruction(instruction)
//
//        guard let emptyPoint = emptySpaceFrom(point, on: &grid, move: move) else { continue }
//
//        makeMove(from: point, to: emptyPoint, on: &grid, move: move)
//
//        grid[point] = .empty
//        point = move(point)
//    }
//
//    return grid.indexes
//        .filter { grid[$0.0][$0.1] == .box }
//        .map { 100 * $0.0 + $0.1 }
//        .reduce(0, +)
//}
//
//assert(solve(input) == 10092)
//assert(solve(mainInput) == 1559280)
