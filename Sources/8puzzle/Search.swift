//
//  Search.swift
//  Jogo8
//
//  Created by Raul Ferreira on 2/24/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation

func dfs(stateList: LinkedList<State>) -> () {
    while !stateList.isEmpty() {

        if let state = stateList.getAtIndex(0){
            stateList.printAllKeys()
            stateList.removeLinkAtIndex(0)

            let childList = generateChild(state)

            for child in childList{
                stateList.addLink(child)
            }
        }

        print("bom dia")

    }
}

func bfs(stateList: LinkedList<State>) -> () {

}


func generateChild(currentState: State) -> ([State]) {
    var newStates = [State]()

    //Coordenates of blank position
    let x = currentState.blank_position_x
    let y = currentState.blank_position_y

    //move célula em branco para a esquerda
    if(y>0){
        //tabela auxiliar que começa como sendo copia da original
        var aux_table = currentState.table
        //move célula
        aux_table[x][y]=aux_table[x][y-1]
        aux_table[x][y-1]=0
        //adiciona tabela à lista
        let auxState = State(table: aux_table, parent: currentState, move: "L", depth: currentState.depth+1, cost: 0,
                             blank_position_x: currentState.blank_position_x, blank_position_y: currentState.blank_position_y-1)
        newStates.append(auxState)
    }
    //move célula em branco para a direita
    if(y<2){
        //tabela auxiliar que começa como sendo copia da original
        var aux_table = currentState.table
        //move célula
        aux_table[x][y]=aux_table[x][y+1]
        aux_table[x][y+1]=0
        //adiciona tabela à lista
        let auxState = State(table: aux_table, parent: currentState, move: "R", depth: currentState.depth+1, cost: 0,
                             blank_position_x: currentState.blank_position_x, blank_position_y: currentState.blank_position_y+1)
        newStates.append(auxState)
    }

    //move célula em branco para cima
    if(x>0){
        //tabela auxiliar que começa como sendo copia da original
        var aux_table = currentState.table
        //move célula
        aux_table[x][y]=aux_table[x-1][y]
        aux_table[x-1][y]=0
        //adiciona tabela à lista
        let auxState = State(table: aux_table, parent: currentState, move: "U", depth: currentState.depth+1, cost: 0,
                             blank_position_x: currentState.blank_position_x-1, blank_position_y: currentState.blank_position_y)
        newStates.append(auxState)
    }

    //move célula em branco para baixo
    if(x<2){
        //tabela auxiliar que começa como sendo copia da original
        var aux_table = currentState.table
        //move célula
        aux_table[x][y]=aux_table[x+1][y]
        aux_table[x+1][y]=0
        //adiciona tabela à lista
        let auxState = State(table: aux_table, parent: currentState, move: "D", depth: currentState.depth+1, cost: 0,
                             blank_position_x: currentState.blank_position_x+1, blank_position_y: currentState.blank_position_y)
        newStates.append(auxState)
    }


    return newStates
}

func isSolution(currentState: State, finalState: State) -> (Bool) {
    return currentState == finalState
}

func getDistanceTo(currentTable: [[Int]], finalTable: [[Int]]) -> (Int){
    var distances = Array(count: 9, repeatedValue: 0)
    for i in 0..<3{
        for j in 0..<3{
            distances[currentTable[i][j]] = abs(distances[currentTable[i][j]]-((i+1)+(j+1)))
            distances[finalTable[i][j]] = abs(distances[finalTable[i][j]]-((i+1)+(j+1)))
        }
    }

    var totalDistance = 0

    for i in 1..<9{
        totalDistance+=distances[i]
    }

    return totalDistance
}
