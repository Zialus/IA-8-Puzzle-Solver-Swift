//
//  main.swift
//  Jogo8
//
//  Created by Raul Ferreira on 2/22/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation


print("Agua Parada dá Denge?")
let answer = readLine(stripNewline: true)!

print("Write your table you mofo")

var table_from_user: [Int] = []

// read array
var arr = readLine()!.characters.split(" ").map(String.init)

if arr.count != 9{
    print("Your an idiot!")
}
else{
// iterate over the array in reverse order and print the elements separated by space
    
for i in (arr.count-1).stride(through: 0, by: -1) {
   // print(String(i) + " " + arr[i])
    table_from_user.append(Int(arr[i])!)
}

}

let estado_teste = State(
    table: table_from_user,
    parent: nil,
    move: nil,
    depth: 0,
    cost: 0,
    white_position: 5
)

let someArray = [10, 20, 30]
let list = LinkedList<State>()

list.addLink(estado_teste)


//print(response, terminator: "")

print("Adeus")


list.printAllKeys()
