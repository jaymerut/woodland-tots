//
//  ChildFormViewModel.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/18/23.
//

import Foundation

extension ChildFormView {
    class ViewModel: ObservableObject {
        var ageTypes: [String] = [
            AgeType.years.rawValue,
            AgeType.months.rawValue
        ]
        var delegate: ChildFormProtocol?
        var mode: FormMode = .add
        
        init() {
            
        }
        init(delegate: ChildFormProtocol, mode: FormMode) {
            self.delegate = delegate
            self.mode = mode
        }
    }
}
