//
//  search.swift
//  Jogo8
//
//  Created by Raul Ferreira on 2/22/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation


class State: CustomStringConvertible{
    let table: [Int]
    let parent: State?
    let move: Character?
    let depth: Int
    let cost: Int
    let white_position: Int
    var description: String {return "{ Tabela: " + String(table) + ", Cost: " + String(cost) + "}"}
    
    init(table: [Int], parent: State?, move: Character?, depth: Int, cost: Int, white_position: Int){
        self.table = table
        self.depth = depth
        self.move = move
        self.parent = parent
        self.white_position = white_position
        self.cost = cost
    }
    
}


extension State: Equatable {}

func ==(lhs: State, rhs: State) -> Bool {
    let areEqual = lhs.table == rhs.table
    return areEqual
}