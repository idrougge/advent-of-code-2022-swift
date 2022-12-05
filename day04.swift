/* Advent of code 2022, day 4, part 1+2 in Swift 5.7 */

import Foundation

let regex = /(\d+)-(\d+),(\d+)-(\d+)/
let ranges = try String(contentsOfFile: "day04.txt")
    .components(separatedBy: .newlines)
    .map { $0.firstMatch(of: regex)!.output }
    .map { (Int($0.1)!, Int($0.2)!, Int($0.3)!, Int($0.4)!) }
    .map { (left: $0.0...$0.1, right: $0.2...$0.3)}

let part1 = ranges.reduce(into: 0) { count, range in
    if range.0.contains(range.1) || range.1.contains(range.0) {
        count += 1
    }
}
print(part1)

let part2 = ranges.reduce(into: 0) { count, range in
    if range.0.overlaps(range.1) {
        count += 1
    }
}
print(part2)
