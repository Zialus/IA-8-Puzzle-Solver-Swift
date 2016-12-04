//
//  Search.swift
//  Jogo8
//
//  Created by Raul Ferreira on 2/24/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation

func depthFirstSearch() -> (State) {

    let stateList = LinkedList<State>()

    stateList.addItem(firstState)

    while !stateList.isEmpty() {

        let state = stateList.removeLast()!

        if isSolution(state, finalState: finalState) {
            return state
        }

        let childList = generateChild(state)

        for child in childList {
            if !visitedStates.contains(child) {
                stateList.addItem(child)
                visitedStates.insert(child)
                passedByNodes+=1
                if passedByNodes % 1000 == 0 { print (passedByNodes) }
            }
        }



    }

    //TOTAL HACK I KNOW BUT I DONT CARE
    return firstState

}

func breadthFirstSearch() -> (State) {

    let stateList = LinkedList<State>()

    stateList.addItem(firstState)

    while !stateList.isEmpty() {

        let state = stateList.getItemAt(0)!
        stateList.removeItem(0)


        if isSolution(state, finalState: finalState) {
            return state
        }


        let childList = generateChild(state)

        for child in childList {
            if !visitedStates.contains(child) {
                stateList.addItem(child)
                visitedStates.insert(child)
                passedByNodes+=1
                if passedByNodes % 1000 == 0 { print (passedByNodes) }
            }
        }



    }

    //TOTAL HACK I KNOW BUT I DONT CARE
    return firstState
}

func iterativeDepthFirstSearch() -> (State) {
    let max_depth = 31
    var current_depth = 0

    while current_depth < max_depth {
        print("Current Max Depth is \(current_depth)")
        visitedStates.removeAll()


        let stateList = LinkedList<State>()
        stateList.addItem(firstState)

        while !stateList.isEmpty() {

            let state = stateList.removeLast()!

            if isSolution(state, finalState: finalState) {
                return state
            }

            let childList = generateChild(state)

            for child in childList {
                if !visitedStates.contains(child) && child.depth <= current_depth {
                    stateList.addItem(child)
                    visitedStates.insert(child)
                    passedByNodes+=1
                    if passedByNodes % 1000 == 0 { print (passedByNodes) }
                }
            }

        }

        current_depth+=1
    }

    print("You went past the max depth!")

    //TOTAL HACK I KNOW BUT I DONT CARE
    return firstState
}

func greedySearch() -> (State){

    var stateList = PriorityQueue<State>(sort: greedySort)

    stateList.enqueue(firstState)

    while !stateList.isEmpty {

        if let state = stateList.dequeue(){


            if isSolution(state, finalState: finalState) {
                return state
            }


            let childList = generateChild(state)

            for child in childList {
                if !visitedStates.contains(child) {
                    stateList.enqueue(child)
                    visitedStates.insert(child)
                    passedByNodes+=1
                    if passedByNodes % 1000 == 0 { print (passedByNodes) }
                }
            }

        }

    }

    //TOTAL HACK I KNOW BUT I DONT CARE
    return firstState

}

func aStarSearch() -> (State){

    var stateList = PriorityQueue<State>(sort: aStartSort)

    stateList.enqueue(firstState)

    while !stateList.isEmpty {

        if let state = stateList.dequeue(){

            if isSolution(state, finalState: finalState) {
                return state
            }

            let childList = generateChild(state)

            for child in childList {
                if !visitedStates.contains(child) {
                    stateList.enqueue(child)
                    visitedStates.insert(child)
                    passedByNodes+=1
                    if passedByNodes % 1000 == 0 { print (passedByNodes) }
                }
            }

        }

    }

    //TOTAL HACK I KNOW BUT I DONT CARE
    return firstState

}

func depthLimitedDepthFirstSearch() -> (State) {

    let depthLimit = 31

    let stateList = LinkedList<State>()

    stateList.addItem(firstState)

    while !stateList.isEmpty() {

        let state = stateList.removeLast()!

        if isSolution(state, finalState: finalState) {
            return state
        }

        let childList = generateChild(state)

        for child in childList {
            if !visitedStates.contains(child) && child.depth <= depthLimit {
                stateList.addItem(child)
                visitedStates.insert(child)
                passedByNodes+=1
                if passedByNodes % 1000 == 0 { print (passedByNodes) }
            }
        }



    }

    //TOTAL HACK I KNOW BUT I DONT CARE
    return firstState

}

func IDASTAR() -> (State) {
    let max_cost = 30
    var current_cost = 0

    while current_cost < max_cost {
        print("Current Max Cost is \(current_cost)")
        visitedStates.removeAll()

        var stateList = PriorityQueue<State>(sort: aStartSort)
        stateList.enqueue(firstState)

        while !stateList.isEmpty {

            if let state = stateList.dequeue(){

                if isSolution(state, finalState: finalState) {
                    return state
                }

                let childList = generateChild(state)

                for child in childList {
                    if !visitedStates.contains(child) && (child.depth + child.cost <= current_cost) {
                        stateList.enqueue(child)
                        visitedStates.insert(child)
                    }
                }
                
                
                
            }
        }
        
        
        current_cost+=1
    }

    //TOTAL HACK I KNOW BUT I DONT CARE
    return firstState

}

func greedySort (_ lhs: State, rhs: State) -> Bool {

    return lhs.cost < rhs.cost

}

func aStartSort (_ lhs: State, rhs: State) -> Bool {

    return lhs.cost + lhs.depth  <  rhs.cost + rhs.depth
    
}

func generateChild(_ currentState: State) -> ([State]) {
    var newStates = [State]()

    //Coordenates of blank position
    let x = currentState.blank_position_x
    let y = currentState.blank_position_y

    //move célula em branco para a esquerda
    if y>0 {
        //tabela auxiliar que começa como sendo copia da original
        var aux_table = currentState.table
        //move célula
        aux_table[x][y]=aux_table[x][y-1]
        aux_table[x][y-1]=0
        //adiciona tabela à lista
        let auxState = State(table: aux_table, parent: currentState, move: "L", depth: currentState.depth+1, cost: getCostTo(aux_table),
                             blank_position_x: currentState.blank_position_x, blank_position_y: currentState.blank_position_y-1)
        newStates.append(auxState)
        generatedNodes+=1
    }
    //move célula em branco para a direita
    if y<2 {
        //tabela auxiliar que começa como sendo copia da original
        var aux_table = currentState.table
        //move célula
        aux_table[x][y]=aux_table[x][y+1]
        aux_table[x][y+1]=0
        //adiciona tabela à lista
        let auxState = State(table: aux_table, parent: currentState, move: "R", depth: currentState.depth+1, cost: getCostTo(aux_table),
                             blank_position_x: currentState.blank_position_x, blank_position_y: currentState.blank_position_y+1)
        newStates.append(auxState)
        generatedNodes+=1
    }

    //move célula em branco para cima
    if x>0 {
        //tabela auxiliar que começa como sendo copia da original
        var aux_table = currentState.table
        //move célula
        aux_table[x][y]=aux_table[x-1][y]
        aux_table[x-1][y]=0
        //adiciona tabela à lista
        let auxState = State(table: aux_table, parent: currentState, move: "U", depth: currentState.depth+1, cost: getCostTo(aux_table),
                             blank_position_x: currentState.blank_position_x-1, blank_position_y: currentState.blank_position_y)
        newStates.append(auxState)
        generatedNodes+=1
    }

    //move célula em branco para baixo
    if x<2 {
        //tabela auxiliar que começa como sendo copia da original
        var aux_table = currentState.table
        //move célula
        aux_table[x][y]=aux_table[x+1][y]
        aux_table[x+1][y]=0
        //adiciona tabela à lista
        let auxState = State(table: aux_table, parent: currentState, move: "D", depth: currentState.depth+1, cost: getCostTo(aux_table),
                             blank_position_x: currentState.blank_position_x+1, blank_position_y: currentState.blank_position_y)
        newStates.append(auxState)
        generatedNodes+=1
    }


    return newStates
}

func hasSolution(_ initialTable: [[Int]], finalTable: [[Int]]) -> Bool {

    var initialTableParity = 0
    var finalTableParity = 0

    for row in 0..<3 {
        for col in 0..<3 {
            let value = initialTable[row][col]

            for i in row..<3 {
                for j in 0..<3 {
                    let nextValue = initialTable[i][j]
                    if (nextValue < value) && (nextValue != 0) && ( j>col || i > row ) {
                        initialTableParity+=1
                    }
                }
            }
        }
    }

    for row in 0..<3 {
        for col in 0..<3 {
            let value = finalTable[row][col]

            for i in row..<3 {
                for j in 0..<3 {
                    let nextValue = finalTable[i][j]
                    if (nextValue < value) && (nextValue != 0) && ( j>col || i > row ) {
                        finalTableParity+=1
                    }
                }
            }
        }
    }

    return initialTableParity%2 == finalTableParity%2
    
}

func isSolution(_ someState: State, finalState: State) -> (Bool) {
    return someState.table == finalState.table
}

func findCoordinates(_ number: Int, matrix: [[Int]]) -> (row: Int, col: Int)? {
    for i in 0..<3 {
        for j in 0..<3 {
            if matrix[i][j]==number {
                return (i,j)
            }
        }
    }
    return nil
}

func manhantanDistance(_ n:Int,currentTable: [[Int]] ) -> (Int)? {

    if let (x1,y1) = findCoordinates(n, matrix: currentTable), let (x2,y2) = findCoordinates(n, matrix: finalState.table){
        return abs(x1-x2) + abs(y1-y2)
    }

    // If the coordinates can't be found the distance can't be calculated
    return nil
}

func getCostTo(_ currentTable: [[Int]]) -> (Int) {

    var totalCost = 0

    for i in 0...8 {
        let distance = manhantanDistance(i, currentTable: currentTable)!
        totalCost+=distance
    }

    
    return totalCost
}
