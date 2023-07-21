//
//  Activity.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/19/23.
//

import Foundation

class ActivityItem: ObservableObject, Identifiable {
    var id: String = ""
    var name: String = ""
    var categoryType: CategoryType = .empty
    var description: String = ""
    
    init() {
        self.id = UUID.init().uuidString
    }
    
    init(id: String, name: String, categoryType: CategoryType, description: String) {
        self.id = id
        self.name = name
        self.categoryType = categoryType
        self.description = description
    }
}

enum CategoryType: String {
    case empty = ""
    case art = "Art"
    case language = "Language"
}
