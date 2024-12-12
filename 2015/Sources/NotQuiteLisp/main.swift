import Foundation

let input = ")"
let input2 = "()())"

let loaded = Array(mainInput).map(String.init)
var count = 0
for i in 0..<loaded.count {
    if loaded[i] == ")" {
        count -= 1
    } else if loaded[i] == "(" {
        count += 1
    }
    if count == -1 {
        print("basement", i + 1)
    }
}
print(count)
