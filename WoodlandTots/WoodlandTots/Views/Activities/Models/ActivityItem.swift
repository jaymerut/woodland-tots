//
//  Activity.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/19/23.
//

import Foundation

class ActivityItem: ObservableObject, Identifiable {
    var name: String = ""
    
    init(name: String) {
        self.name = name
    }
}
