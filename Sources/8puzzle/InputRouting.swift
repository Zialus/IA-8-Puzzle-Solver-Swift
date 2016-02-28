//
//  Input.swift
//  Jogo8
//
//  Created by Raul Ferreira on 2/27/16.
//  Copyright © 2016 FCUP. All rights reserved.
//

import Foundation

public func chooseRoute(searchType: Int)->() {

    switch searchType {
    case 1:
        print("Selecionou: Pesquisa em Profundida");
        depthFirstSearch(stateList);
    case 2:
        print("Selecionou: Pesquisa em Largura");
//        n=breadthFirstSearch(table_list, visited_tables, final_table);
    case 3:
        print("Selecionou: Pesquisa em Profundidade Iterativa");
//        n=iterativeDepthFirstSearch(initial_table, final_table, 0);
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