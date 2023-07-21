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
    
    init(id: String, name: String, categoryType: CategoryType, description: String) {
        self.name = name
    }
}

enum CategoryType: String {
    case empty = ""
    case art = "Art"
    case language = "Language"
}
