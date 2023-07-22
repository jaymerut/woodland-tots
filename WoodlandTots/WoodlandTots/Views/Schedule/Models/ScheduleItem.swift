//
//  ScheduleItem.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/21/23.
//

import Foundation

class ScheduleItem: ObservableObject, Identifiable {
    
    var id: String = UUID().uuidString
    var activities: [ActivityItem] = [ActivityItem]()
    var child: [ChildItem] = [ChildItem]()
}
