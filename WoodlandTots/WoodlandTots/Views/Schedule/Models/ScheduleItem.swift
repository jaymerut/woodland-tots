//
//  ScheduleItem.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/21/23.
//

import Foundation

class ScheduleItem: ObservableObject, Identifiable {
    
    var id: String = UUID().uuidString
    var date: Date = Date()
    var child: ChildItem = ChildItem()
    var activities: [ActivityItem] = [ActivityItem]()
    var meals: [MealItem] = [MealItem]()
    
    init() {
        
    }
    
    init(id: String, date: Date, child: ChildItem, activities: [ActivityItem], meals: [MealItem]) {
        self.id = id
        self.date = date
        self.child = child
        self.activities = activities
        self.meals = meals
    }
}
