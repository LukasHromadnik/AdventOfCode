enum Part1 {
    static func invoke(_ input: String) -> Int {
        let north = ["|", "7", "F"]
        let south = ["|", "L", "J"]
        let west = ["-", "F", "L"]
        let east = ["-", "7", "J"]
        let lines = input.components(separatedBy: "\n").map(Array.init)
        let sIndex = lines.enumerated().filter { $0.element.contains("S") }.map { ($0.offset, Int($0.element.firstIndex(of: "S")!)) }.first!
        var steps = 0
        var currentIndex = sIndex
        var fromIndex: (Int, Int)!
        func setNewIndex(_ index: (Int, Int)) {
            fromIndex = currentIndex
            currentIndex = index
            steps += 1
        }

        repeat {
            switch lines[currentIndex.0][currentIndex.1] {
            case "S":
                if currentIndex.0 > 0 {
                    let newIndex = (currentIndex.0 - 1, currentIndex.1)
                    if north.contains(String(lines[newIndex.0][newIndex.1])) {
                        setNewIndex(newIndex)
                        break
                    }
                }
                if currentIndex.0 < lines.count - 1 {
                    let newIndex = (currentIndex.0 + 1, currentIndex.1)
                    if south.contains(String(lines[newIndex.0][newIndex.1])) {
                        setNewIndex(newIndex)
                        break
                    }
                }
                if currentIndex.1 > 0 {
                    let newIndex = (currentIndex.0, currentIndex.1 - 1)
                    if west.contains(String(lines[newIndex.0][newIndex.1])) {
                        setNewIndex(newIndex)
                        break
                    }
                }
                if currentIndex.1 < lines[currentIndex.0].count - 1 {
                    let newIndex = (currentIndex.0, currentIndex.1 + 1)
                    if east.contains(String(lines[newIndex.0][newIndex.1])) {
                        setNewIndex(newIndex)
                        break
                    }
                }
            case "|":
                let newIndex = [(currentIndex.0 + 1, currentIndex.1), (currentIndex.0 - 1, currentIndex.1)].filter { $0 != fromIndex }.first!
                setNewIndex(newIndex)
            case "F":
                let newIndex = [(currentIndex.0 + 1, currentIndex.1), (currentIndex.0, currentIndex.1 + 1)].filter { $0 != fromIndex }.first!
                setNewIndex(newIndex)
            case "-":
                let newIndex = [(currentIndex.0, currentIndex.1 - 1), (currentIndex.0, currentIndex.1 + 1)].filter { $0 != fromIndex }.first!
                setNewIndex(newIndex)
            case "7":
                let newIndex = [(currentIndex.0, currentIndex.1 - 1), (currentIndex.0 + 1, currentIndex.1)].filter { $0 != fromIndex }.first!
                setNewIndex(newIndex)
            case "J":
                let newIndex = [(currentIndex.0 - 1, currentIndex.1), (currentIndex.0, currentIndex.1 - 1)].filter { $0 != fromIndex }.first!
                setNewIndex(newIndex)
            case "L":
                let newIndex = [(currentIndex.0, currentIndex.1 + 1), (currentIndex.0 - 1, currentIndex.1)].filter { $0 != fromIndex }.first!
                setNewIndex(newIndex)
            default:
                assertionFailure()
            }
        } while currentIndex != sIndex

        return Int(steps / 2)
    }
}
