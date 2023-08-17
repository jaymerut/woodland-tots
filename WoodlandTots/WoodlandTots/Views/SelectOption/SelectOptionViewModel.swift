//
//  SelectOptionViewModel.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/26/23.
//

import Foundation

extension SelectOptionView {
    class ViewModel: ObservableObject {
        
        var type: SelectOptionType = .single
        var options: [SelectOption] = [SelectOption]()
        var oldOptions: [SelectOption] = [SelectOption]()
        var valueType: T.Type
        
        init(type: SelectOptionType = .single, options: [SelectOption], valueType: T.Type) {
            self.type = type
            self.options = options
            for option in options {
                self.oldOptions.append(.init(name: option.name, value: option.value, isSelected: option.isSelected))
            }
            self.valueType = valueType
        }
    }
    
}


enum SelectOptionType {
    case single
    case multi
}
