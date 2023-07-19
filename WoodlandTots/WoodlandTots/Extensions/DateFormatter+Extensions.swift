//
//  DateFormatter+Extensions.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/18/23.
//

import Foundation

extension DateFormatter {
    static var month: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM"
        return formatter
    }
    
    static var monthAndYear: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        return formatter
    }
}
