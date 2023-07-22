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
    var activities: [ActivityItem] = [ActivityItem]()
    var child: ChildItem = ChildItem()
    
    init() {
        
    }
    
    init(id: String, date: Date, activities: [ActivityItem], child: ChildItem) {
        self.id = id
        self.date = date
        self.activities = activities
        self.child = child
    }
}
