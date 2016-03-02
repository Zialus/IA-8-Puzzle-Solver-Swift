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
//        n=greedySearch(table_list, visited_tables, final_table);
    case 5:
        print("You Selected: A Star Search")
//        n=aStarSearch(table_list, final_table);
    default:
        print("The number you selected is not associated with any search option")

    }

}
