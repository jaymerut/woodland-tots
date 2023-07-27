//
//  SelectOption.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/26/23.
//

import Foundation

class SelectOption: ObservableObject, Identifiable {
    
    var name: String = ""
    var value: Any
    var isSelected: Bool = false
    
    init(name: String, value: Any) {
        self.name = name
        self.value = value
    }
}
