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
        print("Selecionou: Pesquisa em Profundida");

        let stateList = Stack<State>()

        stateList.push(firstState)

        depthFirstSearch(stateList);
    case 2:
        print("Selecionou: Pesquisa em Largura");

        let stateList = Queue<State>()

        stateList.enQueue(firstState)

        breadthFirstSearch(stateList);
    case 3:
        print("Selecionou: Pesquisa em Profundidade Iterativa");

        iterativeDepthFirstSearch();
    case 4:
        print("Selecionou: Pesquisa Gulosa");
//        n=greedySearch(table_list, visited_tables, final_table);
    case 5:
        print("Selecionou: Pesquisa A*");
//        n=aStarSearch(table_list, final_table);
    default:
        print("Operação invalida!\nO número que selecionou não está associado a nenhuma pesquisa");

    }


}