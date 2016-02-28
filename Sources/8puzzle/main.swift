//
//  main.swift
//  Jogo8
//
//  Created by Raul Ferreira on 2/22/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation

var firstTableFromUser = Array(count: 3, repeatedValue: Array(count: 3, repeatedValue: 0))
var finalTableFromUser = Array(count: 3, repeatedValue: Array(count: 3, repeatedValue: 0))

print("-----------------------")
print("IT'S JOGO DOS 8 TIME!!!!!")
print("-----------------------")
print("Example of input\nThis:")
print("1 2 3 4 0 5 6 7 8\nTurns into this:")
print("1 2 3")
print("4 _ 5")
print("6 7 8")


print("Introduce your initial table here: ", terminator:"")

tryingToReadFirst:
    if let userInput = readLine(stripNewline: true) {

        var string_table = userInput.characters.split(" ").map(String.init)
        print("Checking Table...")

        if string_table.count != 9 {
            print("BAD INPUT!!!")
            break tryingToReadFirst
        }

        var index = 0
        for i in 0..<3 {
            for j in 0..<3 {
                if let k = Int(string_table[index]) {
                    firstTableFromUser[i][j] = k
                    index+=1
                } else {
                    print("BAD INPUT!!")
                    break tryingToReadFirst
                }
            }
        }


        print("Table Accepted")

    } else {
    print("BAD INPUT!!!")
}

print("Introduce your final table here: ", terminator:"")

tryingToReadFinal:
    if let userInput = readLine(stripNewline: true) {

    var string_table = userInput.characters.split(" ").map(String.init)
    print("Checking Table...")

    if string_table.count != 9 {
        print("BAD INPUT!!!")
        break tryingToReadFinal
    }

    var index = 0
    for i in 0..<3 {
        for j in 0..<3 {
            if let k = Int(string_table[index]) {
                finalTableFromUser[i][j] = k
                index+=1
            } else {
                print("BAD INPUT!!")
                break tryingToReadFinal
            }
        }
    }


    print("Table Accepted")

} else {
    print("BAD INPUT!!!")
}






//Lista para guardar estados
var stateList = LinkedList<State>()
var visitedStates = Set<State>()

var index_i = 0
var index_j = 0
//Find blank position
for i in 0..<3 {
    for j in 0..<3 {
        if firstTableFromUser[i][j]==0 {
            index_i=i
            index_j=j
        }
    }
}

//Create Initial State
let firstState = State(
    table: firstTableFromUser,
    parent: nil,
    move: nil,
    depth: 0,
    cost: 0,
    blank_position_x: index_i,
    blank_position_y: index_j
)

//Adiciona-lo à lista
stateList.addLink(firstState)

index_i = 0
index_j = 0
//Find blank position
for i in 0..<3 {
    for j in 0..<3 {
        if finalTableFromUser[i][j]==0 {
            index_i=i
            index_j=j
        }
    }
}

//Create Initial State
let finalState = State(
    table: finalTableFromUser,
    parent: nil,
    move: nil,
    depth: 0,
    cost: 0,
    blank_position_x: index_i,
    blank_position_y: index_j
)





print("Selecione o tipo de pesquisa")
print("-Profundidade: 1\n-Largura: 2\n-Profundidade Iterativa: 3\n-Gulosa: 4\n-A*: 5")
print("-----------------------------------")

print("Pesquisa: ", terminator:"")

let searchType = readLine()

let start = NSDate()

//let childStates = generateChild(estado_teste)
//
//for state in childStates{
//    stateList.addLink(state)
//}

stateList.printAllKeys()

chooseRoute(Int(searchType!)!)

// depthFirstSearch(stateList)

// sleep(5)

// print( [[1],[2]] == [[1],[2]] )

let end = NSDate()

var diffDateComponents = NSCalendar.currentCalendar().components([NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day, NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second], fromDate: start, toDate: end, options: NSCalendarOptions.init(rawValue: 0))

print("The difference between dates is: \(diffDateComponents.year) years, \(diffDateComponents.month) months, \(diffDateComponents.day) days, \(diffDateComponents.hour) hours, \(diffDateComponents.minute) minutes, \(diffDateComponents.second) seconds")


stateList.printAllKeys()
