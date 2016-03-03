//
//  Input.swift
//  Jogo8
//
//  Created by Raul Ferreira on 2/27/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation

func chooseRoute(searchType: Int)->() {

    switch searchType {
    case 1:
        print("You Selected: Depth First Search")

        depthFirstSearch()
    case 2:
        print("You Selected: Breadth First Search")

        breadthFirstSearch()
    case 3:
        print("You Selected: Iterative DFS")

        iterativeDepthFirstSearch()
    case 4:
        print("You Selected: Greedy Search")

        greedySearch()
    case 5:
        print("You Selected: A Star Search")

        aStarSearch()
    case 6:
        print("You Selected: Depth Limited Depth First Search")

        depthLimitedDepthFirstSearch()

    case 7:
        print("You Selected: IDA*")

        IDASTAR()
    default:
        print("The number you selected is not associated with any search option")

    }

}
