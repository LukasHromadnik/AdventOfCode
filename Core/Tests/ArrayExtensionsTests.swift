import Foundation
import Core
import Testing

struct ArrayExtensionsTests {

    @Test
    func chunk_basic() {
        let array = [0, 1, 2, 3, 4, 5]
        let expected = [[0, 1], [2, 3], [4, 5]]
        let actual = array.chunk(size: 2)

        #expect(actual == expected)
    }

    @Test
    func chunk_odd() {
        let array = [0, 1, 2, 3, 4, 5, 6]
        let expected = [[0, 1], [2, 3], [4, 5], [6]]
        let actual = array.chunk(size: 2)

        #expect(actual == expected)
    }

    @Test
    func chunk_empty() {
        let array: [Int] = []
        let expected: [[Int]] = []
        let actual = array.chunk(size: 2)
        
        #expect(actual == expected)
    }

//    @Test
//    func chunk_empty1() async {
//        let array = [0, 1, 2, 3, 4, 5]
//        await #expect(processExitsWith: .failure) {
//            array.chunk(size: 0)
//        }
//    }
}
