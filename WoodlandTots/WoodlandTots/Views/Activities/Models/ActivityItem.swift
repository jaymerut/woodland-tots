//
//  Activity.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/19/23.
//

import SwiftUI

class ActivityItem: ObservableObject, Identifiable, Hashable {

    static func == (lhs: ActivityItem, rhs: ActivityItem) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var id: String = UUID().uuidString
    var name: String = ""
    var categoryType: CategoryType = .empty
    var description: String = ""
    
    init() {

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
