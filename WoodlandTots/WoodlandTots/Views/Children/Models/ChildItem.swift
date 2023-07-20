//
//  Child.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/18/23.
//

import Foundation

class ChildItem: ObservableObject, Identifiable {
    var name: String = ""
    var age: Int = 0
    var ageUnits: AgeType = .years
    var ageString: String {
        get {
            var ageSuffix = ""
            switch self.ageUnits {
            case .months:
                ageSuffix = self.age == 1 ? "month" : "months"
            case .years:
                ageSuffix = self.age == 1 ? "year" : "years"
            }
            
            return "\(self.age) \(ageSuffix) old"
        }
    }
    var note: String = ""
    
    init(name: String, age: Int, ageUnits: AgeType, note: String) {
        self.name = name
        self.age = age
        self.ageUnits = ageUnits
        self.note = note
    }
}

enum AgeType: String {
    case months = "Months"
    case years = "Years"
}
