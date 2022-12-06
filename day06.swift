/* Advent of code 2022, day 6, part 1+2 in Swift 5 */

import Foundation

let input = Array(try String(contentsOfFile: "day06.txt"))

func solve(message: [Character], size: Int) -> Int? {
    (size ..< message.endIndex).first(where: { index in
        Set(message[index - size ..< index]).count == size
    })
}

print(solve(message: input, size: 4)!)
print(solve(message: input, size: 14)!)
