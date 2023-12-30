//
//  MealItem.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 12/30/23.
//

import Foundation

class MealItem: ObservableObject, Identifiable, Hashable {
    static func == (lhs: MealItem, rhs: MealItem) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    var id: String = UUID().uuidString
    var mealType: MealType = .breakfast
    var note: String = ""
    
    init() {
        
    }
    
    init(mealType: MealType, note: String) {
        self.mealType = mealType
        self.note = note
    }
    init(id: String, mealType: MealType, note: String) {
        self.id = id
        self.mealType = mealType
        self.note = note
    }
}
