//
//  MealType.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 8/24/23.
//

import Foundation

public enum MealType: Int {
    case breakfast
    case snackAM
    case lunch
    case snackPM
    case snackLate
    case dinner
    
}

extension MealType {
    func getDisplayName() -> String {
        if self.rawValue == 0 {
            return "Breakfast"
        } else if rawValue == 1 {
            return "AM Snack"
        } else if rawValue == 2 {
            return "Lunch"
        } else if rawValue == 3 {
            return "PM Snack"
        } else if rawValue == 4 {
            return "Late Snack"
        } else if rawValue == 5 {
            return "Dinner"
        }
        return ""
    }
}
