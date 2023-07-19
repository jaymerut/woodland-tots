//
//  Child.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/18/23.
//

import Foundation

class ChildItem: ObservableObject, Identifiable {
    var name: String = ""
    
    init(name: String) {
        self.name = name
    }
}
