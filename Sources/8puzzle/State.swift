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

extension State: CustomStringConvertible {

    var description: String {
//                return "{ Tabela: " + String(table) + "}"
        //        return "{ Tabela: " + String(table) + ", Depth: " + String(depth) + ", Cost: " + String(cost) + "}"
        //        return "{ Tabela: " + String(table) + ", Depth: " + String(depth) + "}"
        return " \(String(table))\(String(depth)) "
    }
}

extension State: Hashable {

    var hashValue: Int {
        return description.hashValue
    }

}

extension State: Equatable {}

func == (lhs: State, rhs: State) -> Bool {
    return lhs.table == rhs.table && lhs.depth == rhs.depth
//    return compareStates(lhs, rhs)
}

func compareStates(lhs: State, rhs: State) -> Bool {
    if lhs.table.count != rhs.table.count{
        return false
    }

    for i in 0..<3{
        for j in 0..<3{
            if lhs.table[i][j] != rhs.table[i][j]{
                return false
            }
        }
    }
    
    if lhs.depth != rhs.depth {
        return false
    }
    
    return true
}
