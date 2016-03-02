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
//        return "{ Tabela: " + String(table) + ", Depth: " + String(depth) + "}"  // withheld until i find a better way to Hash a State
        return "{ Tabela: " + String(table) + " }"

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
        print("------")
        if let move = move{
            print(move)
            print("------")
            if let parent = parent{
                parent.printPath()
            }

        }
    }

    func prettyPrint(){
        for i in 0..<3 {
            for j in 0..<3 {
                print(table[i][j],terminator:" ")
            }
            print()
        }
    }

}

extension State: CustomStringConvertible {}

extension State: Hashable {}

extension State: Equatable {}

func == (lhs: State, rhs: State) -> Bool {
    let areEqual = lhs.table == rhs.table
    return areEqual
}
