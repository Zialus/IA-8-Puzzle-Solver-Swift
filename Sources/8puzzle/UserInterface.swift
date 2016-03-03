//
//  SetupScreen.swift
//  Jogo8
//
//  Created by Raul Ferreira on 3/1/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation

func setupScreen() -> () {

    print("\t ---------------------- ")
    print("\t|IT'S JOGO DOS 8 TIME!!| ")
    print("\t ---------------------- ")
    print("")
    print("----Input Example----")
    print("")
    print("This:")
    print("\t1 2 3 4 0 5 6 7 8")
    print("Turns into this:")
    print("\t\t1 2 3")
    print("\t\t4 _ 5")
    print("\t\t6 7 8")
    print()

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


}

func searchScreen() -> (Int?) {


    if(hasSolution(firstState.table, finalTable: finalState.table)){
    }
    else{
        print("THERE IS NO SOLUTION FOR THE PROVIDED TABLES")
        exit(0)
    }

    print("Selecione o tipo de pesquisa")
    print("1) DFS")
    print("2) BFS")
    print("3) iDFS")
    print("4) Greedy")
    print("5) A*")
    print("6) Depth Limited DFS")
    print("7) IDA*")
    print("-----------------------------------")
    print("Search Type: ", terminator:"")

    if let searchType = readLine() {
        if let searchType = Int(searchType) {
            return searchType
        } else {
            return nil
        }

    } else {
        return nil
    }

}
