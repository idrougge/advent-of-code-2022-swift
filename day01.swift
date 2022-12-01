/* Advent of code 2022, day 1, part 1+2 in Swift 5 */

import Foundation

let input = try! String(contentsOfFile: "day01.txt")
    .components(separatedBy: "\n\n")
    .map {
        $0.components(separatedBy: .newlines)
        .compactMap(Int.init)
        .reduce(0, +)
    }
    .sorted(by: >)
 
// part_1:
print(input.first!)

// part_2:
let topThree = input.prefix(3).reduce(0, +)
print(topThree)