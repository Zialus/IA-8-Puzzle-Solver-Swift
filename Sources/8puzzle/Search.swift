//
//  Search.swift
//  Jogo8
//
//  Created by Raul Ferreira on 2/24/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation

func depthFirstSearch() {

    let stateList = LinkedList<State>()

    stateList.append(firstState)

    while !stateList.isEmpty {

        let state = stateList.removeLast()

        if isSolution(state, finalState: finalState) {
            print("I FOUND THE ANSWER!!!")
            print(state)
            print(state.depth)
            state.printPath()
            return
        }

        let childList = generateChild(state)

        for child in childList {
            if !visitedStates.contains(child) {
                stateList.append(child)
                visitedStates.insert(child)


            }
        }



    }

}

func breadthFirstSearch() {

    let stateList = LinkedList<State>()

    stateList.append(firstState)

    while !stateList.isEmpty {

        let state = stateList.removeAtIndex(0)



        if isSolution(state, finalState: finalState) {
            print("I FOUND THE ANSWER!!!")
            print(state)
            print(state.depth)
            state.printPath()
            return
        }


        let childList = generateChild(state)

        for child in childList {
            if !visitedStates.contains(child) {
                stateList.append(child)
                visitedStates.insert(child)
            }
        }



    }
}

func iterativeDepthFirstSearch() {
    let max_depth = 30
    var current_depth = 0

    while current_depth < max_depth {
        print("Current Max Depth is \(current_depth)")
        visitedStates.removeAll()




        let stateList = LinkedList<State>()
        stateList.append(firstState)

        while !stateList.isEmpty {

            let state = stateList.removeLast()

            if isSolution(state, finalState: finalState) {
                print("I FOUND THE ANSWER!!!")
                print(state)
                print(state.depth)
                state.printPath()
                return
            }

            let childList = generateChild(state)

            for child in childList {
                if !visitedStates.contains(child) && child.depth <= current_depth {
                    stateList.append(child)
                    visitedStates.insert(child)
                }
            }




        }


        current_depth+=1
    }

}


func greedySort (lhs: State, rhs: State) -> Bool {

    return getDistanceTo(lhs.table, finalTable: finalState.table) < getDistanceTo(rhs.table, finalTable: finalState.table)

}

func aStartSort (lhs: State, rhs: State) -> Bool {

    return (getDistanceTo(lhs.table, finalTable: finalState.table) + lhs.depth)   <   ( getDistanceTo(rhs.table, finalTable: finalState.table) + rhs.depth )

}


func IDASTAR() {
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
                    print("I FOUND THE ANSWER!!!")
                    print(state)
                    print(state.depth)
                    state.printPath()
                    return
                }

                let childList = generateChild(state)

                for child in childList {
                    if !visitedStates.contains(child) && child.depth <= current_cost {
                        stateList.enqueue(child)
                        visitedStates.insert(child)
                    }
                }



            }
        }


        current_cost+=1
    }

}

func greedySearch(){

    var stateList = PriorityQueue<State>(sort: greedySort)

    stateList.enqueue(firstState)

    while !stateList.isEmpty {

        if let state = stateList.dequeue(){


            if isSolution(state, finalState: finalState) {
                print("I FOUND THE ANSWER!!!")
                print(state)
                print(state.depth)
                state.printPath()
                return
            }


            let childList = generateChild(state)

            for child in childList {
                if !visitedStates.contains(child) {
                    stateList.enqueue(child)
                    visitedStates.insert(child)
                }
            }

        }

    }

}

func aStarSearch(){

    var stateList = PriorityQueue<State>(sort: aStartSort)

    stateList.enqueue(firstState)

    while !stateList.isEmpty {

        if let state = stateList.dequeue(){


            if isSolution(state, finalState: finalState) {
                print("I FOUND THE ANSWER!!!")
                print(state)
                print(state.depth)
                state.printPath()
                return
            }


            let childList = generateChild(state)

            for child in childList {
                if !visitedStates.contains(child) {
                    stateList.enqueue(child)
                    visitedStates.insert(child)
                }
            }

        }

    }

}

func depthLimitedDepthFirstSearch() {

    let depthLimit = 35

    let stateList = LinkedList<State>()

    stateList.append(firstState)

    while !stateList.isEmpty {

        let state = stateList.removeLast()


        if isSolution(state, finalState: finalState) {
            print("I FOUND THE ANSWER!!!")
            print(state)
            print(state.depth)
            state.printPath()
            return
        }

        let childList = generateChild(state)

        for child in childList {
            if !visitedStates.contains(child) && child.depth <= depthLimit {
                stateList.append(child)
                visitedStates.insert(child)


            }
        }



    }

}

func generateChild(currentState: State) -> ([State]) {
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
        let auxState = State(table: aux_table, parent: currentState, move: "L", depth: currentState.depth+1, cost: 0,
                             blank_position_x: currentState.blank_position_x, blank_position_y: currentState.blank_position_y-1)
        newStates.append(auxState)
    }
    //move célula em branco para a direita
    if y<2 {
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
    if x>0 {
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
    if x<2 {
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

func hasSolution(initialTable: [[Int]], finalTable: [[Int]]) -> Bool {

    var initialTableParity = 0
    var finalTableParity = 0

    for row in 0..<3 {
        for col in 0..<3 {
            let value = initialTable[row][col]

            for i in row..<3 {
                for j in col..<3 {
                    let nextValue = initialTable[i][j]
                    if nextValue < value && nextValue != 0 {
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
                for j in col..<3 {
                    let nextValue = initialTable[i][j]
                    if nextValue < value && nextValue != 0 {
                        finalTableParity+=1
                    }
                }
            }
        }
    }
    
    return initialTableParity%2 == finalTableParity%2
    
}


func isSolution(someState: State, finalState: State) -> (Bool) {
    return someState == finalState
}

func getDistanceTo(currentTable: [[Int]], finalTable: [[Int]]) -> (Int) {
    var distances = Array(count: 9, repeatedValue: 0)
    for i in 0..<3 {
        for j in 0..<3 {
            distances[currentTable[i][j]] = abs(distances[currentTable[i][j]]-((i+1)+(j+1)))
            distances[finalTable[i][j]] = abs(distances[finalTable[i][j]]-((i+1)+(j+1)))
        }
    }
    
    var totalDistance = 0
    
    for i in 1..<9 {
        totalDistance+=distances[i]
    }
    
    return totalDistance
}
