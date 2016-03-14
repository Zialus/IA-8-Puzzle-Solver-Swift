//
//  Node.swift
//  Doubly Linked List Node Implementation
//
//  Created by Ergin Bilgin on 28/09/15.
//  Copyright © 2015 Ergin Bilgin. All rights reserved.
//

import Foundation

class Node<T:NSObject> {
    var value: T? = nil
    var next: Node<T>? = nil
    var prev: Node<T>? = nil
    
    init() {
    }
    
    init(value: T) {
        self.value = value
    }
}