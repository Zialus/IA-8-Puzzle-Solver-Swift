//
//  main.swift
//  Jogo8
//
//  Created by Raul Ferreira on 2/22/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation

// [][] ---> 2D Array for matrices representing the 8-puzzle-game-board
var firstTableFromUser = Array(count: 3, repeatedValue: Array(count: 3, repeatedValue: 0))
var finalTableFromUser = Array(count: 3, repeatedValue: Array(count: 3, repeatedValue: 0))

// Display the Setup Screen
setupScreen()

// List to Store visited States
var visitedStates = Set<State>()

var index_i = 0
var index_j = 0
// Find blank position for the initial state
for i in 0..<3 {
    for j in 0..<3 {
        if firstTableFromUser[i][j]==0 {
            index_i=i
            index_j=j
        }
    }
}

// Create Initial State
let firstState = State(
    table: firstTableFromUser,
    parent: nil,
    move: nil,
    depth: 0,
    cost: 0,
    blank_position_x: index_i,
    blank_position_y: index_j
)


index_i = 0
index_j = 0
// Find blank position for the Final State
for i in 0..<3 {
    for j in 0..<3 {
        if finalTableFromUser[i][j]==0 {
            index_i=i
            index_j=j
        }
    }
}

// Create Final State
let finalState = State(
    table: finalTableFromUser,
    parent: nil,
    move: nil,
    depth: 0,
    cost: 0,
    blank_position_x: index_i,
    blank_position_y: index_j
)

print()
print("Here is your initial Table:")
firstState.prettyPrint()
print("Here is your final Table")
finalState.prettyPrint()
print("The Manhantan Distance is:")
print(getCostTo(firstState.table))
print()

// print( [[1],[2]] == [[1],[2]] )

var searchType = searchScreen()

while searchType == nil {
    print()
    print("You idiot!!! Pick a value between 1 and 7")
    print()
    sleep(1)
    searchType = searchScreen()
}

let start = NSDate()

chooseRoute(searchType!)

let end = NSDate()

var diffDateComponents = NSCalendar.currentCalendar().components(
    [NSCalendarUnit.Year, NSCalendarUnit.Month, NSCalendarUnit.Day,
    NSCalendarUnit.Hour, NSCalendarUnit.Minute, NSCalendarUnit.Second],
    fromDate: start, toDate: end, options: NSCalendarOptions.init(rawValue: 0))

print("The difference between dates is: \(diffDateComponents.year) years, \(diffDateComponents.month) months,\(diffDateComponents.day) days, \(diffDateComponents.hour) hours, \(diffDateComponents.minute) minutes,\(diffDateComponents.second) seconds")
