//
//  DateHelper.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/21/23.
//

import Foundation

class DateHelper {
    
    static var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM dd"
        
        return formatter
    }()
    
    static func isEqual(date1: Date, date2: Date) -> Bool {
        var date1String = dateFormatter.string(from: date1)
        var date2String = dateFormatter.string(from: date2)
        
        return date1String == date2String
    }
}
