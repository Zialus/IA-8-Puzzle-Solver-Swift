import Foundation

class State {
    let table: [[Int]]
    let parent: State?
    let move: Character?
    let depth: Int
    let cost: Int
    let blank_position_x: Int
    let blank_position_y: Int

    init(table: [[Int]], parent: State?, move: Character?, depth: Int, cost: Int, blank_position_x: Int, blank_position_y: Int) {
        self.table = table
        self.depth = depth
        self.move = move
        self.parent = parent
        self.blank_position_x = blank_position_x
        self.blank_position_y = blank_position_y
        self.cost = cost
    }

    deinit {
//        print("\(table) is being deinitialized")
    }

    func printPath() {
        var nodeToPrint: State? = self

        while nodeToPrint != nil {

            nodeToPrint!.prettyPrint()
            print()

            if let move = nodeToPrint!.move {
                print("Move: \(move)")
                print()
            }

            nodeToPrint = nodeToPrint!.parent

        }

    }

    func prettyPrint() {
        print("+-----+")
        for i in 0..<3 {
            print("|", terminator:"")
            for j in 0..<2 {
                print(table[i][j], terminator:" ")
            }
            print(table[i][2], terminator: "|\n")
        }
        print("+-----+")
    }

}

extension State: CustomStringConvertible {

    var description: String {
        return "{ Tabela:  \(table) } "
        //        return "{ Tabela: " + String(table) + ", Depth: " + String(depth) + ", Cost: " + String(cost) + "}"
        //        return "{ Tabela: " + String(table) + ", Depth: " + String(depth) + "}"
        //        return "\(String(table)) \(String(depth)) "
    }

}

extension State: Hashable {

    var hashValue: Int {
        return description.hashValue
    }

}

extension State: Equatable {}

func == (lhs: State, rhs: State) -> Bool {
    return lhs.table == rhs.table
}


func tableAndDepthEquality (_ lhs: State, rhs: State) -> Bool {
    return lhs.table == rhs.table && lhs.depth == rhs.depth
}


// Makes multi-dementional Arrays Equatable
func == (lhs: [[Int]], rhs: [[Int]]) -> Bool {

    if lhs.count != rhs.count {
        return false
    }

    let count = lhs.count

    for i in 0..<count {
        if lhs[i] != rhs[i] {
            return false
        }
    }

    return true
}
