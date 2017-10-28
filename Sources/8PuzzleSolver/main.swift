import Foundation

// [][] ---> 2D Array for matrices representing the 8-puzzle-game-board
var firstTableFromUser = Array(repeating: Array(repeating: 0, count: 3), count: 3)
var finalTableFromUser = Array(repeating: Array(repeating: 0, count: 3), count: 3)

// Display the Setup Screen
setupScreen()

// Set to store visited States
var visitedStates = Set<State>()

var index_i = 0
var index_j = 0
// Search where the blank position is in the input for the initial state
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
// Search where the blank position is in the input for the final state
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
print("The Manhantan Distance is: \(getCostTo(firstState.table)) ")
print()

var passedByNodes = 0
var generatedNodes = 0

var searchType = searchScreen()

while searchType == nil {
    print()
    print("You idiot!!! Pick a value between 1 and 7")
    print()
    sleep(1)
    searchType = searchScreen()
}

chooseRoute(searchType!)
