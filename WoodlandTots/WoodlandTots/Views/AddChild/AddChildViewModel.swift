//
//  AddChildViewModel.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/18/23.
//

import Foundation

extension AddChildView {
    class ViewModel: ObservableObject {
        var ageTypes: [String] = [
            AgeType.years.rawValue,
            AgeType.months.rawValue
        ]
        
        init() {
            
        }
    }
}
