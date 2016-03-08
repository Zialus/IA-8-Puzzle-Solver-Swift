//
//  search.swift
//  Jogo8
//
//  Created by Raul Ferreira on 2/22/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation


class State {
    let table: [[Int]]
    let parent: State?
    let move: Character?
    let depth: Int
    let cost: Int
    let blank_position_x: Int
    let blank_position_y: Int
    var description: String {
//        return "{ Tabela: " + String(table) + "}"
//        return "{ Tabela: " + String(table) + ", Depth: " + String(depth) + ", Cost: " + String(cost) + "}"
        return "{ Tabela: " + String(table) + ", Depth: " + String(depth) + " }"
    }
    var hashValue: Int {
        return description.hashValue
    }

    init(table: [[Int]], parent: State?, move: Character?, depth: Int, cost: Int, blank_position_x: Int, blank_position_y: Int) {
        self.table = table
        self.depth = depth
        self.move = move
        self.parent = parent
        self.blank_position_x = blank_position_x
        self.blank_position_y = blank_position_y
        self.cost = cost
    }

    func printPath() {
        self.prettyPrint()
        print()
        if let move = move{
            print("Move: \(move)")
            print()
            if let parent = parent{
                parent.printPath()
            }

        }
    }

    func prettyPrint(){
        print("+-----+")
        for i in 0..<3 {
            print("|",terminator:"")
            for j in 0..<2 {
                print(table[i][j],terminator:" ")
            }
            print(table[i][2],terminator: "|\n")
        }
        print("+-----+")
    }

}

extension State: CustomStringConvertible {}

extension State: Hashable {}

extension State: Equatable {}

func == (lhs: State, rhs: State) -> Bool {
    let areEqual = lhs.table == rhs.table
    return areEqual
}


//WEIRD LINUX STUFF TO FIGURE OUT LATER

//func == (lhs: State, rhs: State) -> Bool {
//
//    if lhs.table.count == rhs.table.count{
//        for i in 0..<3{
//            for j in 0..<3{
//                if lhs.table[i][j] != rhs.table[i][j]{
//                    return false
//                }
//
//            }
//        }
//        return true
//    }
//    return false
//}
//



