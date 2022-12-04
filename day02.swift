/* Advent of code 2022, day 2, part 1+2 in Swift 5 */

import Foundation

enum Hand: Int, Comparable {
    case rock, paper, scissors
        
    init(_ string: String) {
        switch string {
        case "A", "X": self = .rock
        case "B", "Y": self = .paper
        case "C", "Z": self = .scissors
        case _: preconditionFailure()
        }
    }
    
    var points: Int { rawValue + 1 }
    
    var winning: Hand { Hand(rawValue: (rawValue + 1) % 3)! }
    
    var losing: Hand { Hand(rawValue: (rawValue + 2) % 3)! }
    
    static func < (lhs: Hand, rhs: Hand) -> Bool {
        rhs == lhs.winning
    }
}

enum Outcome: String {
    case lose = "X", draw = "Y", win = "Z"
    
    var points: Int {
        switch self {
        case .lose: return 0
        case .draw: return 3
        case .win:  return 6
        }
    }
}

let rounds = try String(contentsOfFile: "day02.txt")
    .components(separatedBy: .newlines)
    .map { line in
        line.components(separatedBy: .whitespaces)
    }
    .map {
        (he: Hand($0[0]),
         me: Hand($0[1]),
         outcome: Outcome(rawValue: $0[1])!)
    }

let part1 = rounds.reduce(0) { total, round in
    let (he, me, _) = round
    let outcome: Outcome
    switch true {
    case he < me: outcome = .win
    case he == me: outcome = .draw
    case _: outcome = .lose
    }
    return total + outcome.points + me.points
}

let part2 = rounds.reduce(0) { total, round in
    let (his, _, outcome) = round
    let my: Hand
    switch round.outcome {
    case .win:  my = his.winning
    case .draw: my = his
    case .lose: my = his.losing
    }
    return total + outcome.points + my.points
}

print(part1)
print(part2)
