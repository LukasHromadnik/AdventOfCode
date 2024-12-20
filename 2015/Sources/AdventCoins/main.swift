import Foundation
import CryptoKit

func MD5(string: String) -> String {
    Insecure.MD5.hash(data: Data(string.utf8))
        .map { String(format: "%02hhx", $0) }
        .joined()
}

let input1 = "abcdef"
let input2 = "pqrstuv"

DispatchQueue.concurrentPerform(iterations: 100_000_000) {
    let hash = MD5(string: mainInput + String($0))
    if hash.hasPrefix("000000") {
        print($0)
    }
}
//var i = 0
//while true {
//    let hash = MD5(string: mainInput + String(i))
//    if hash.hasPrefix("000000") {
//        print(i)
//        break
//    } else {
//        i += 1
//    }
//}
