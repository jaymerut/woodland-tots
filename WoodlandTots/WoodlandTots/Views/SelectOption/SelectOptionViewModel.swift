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
        
        init(type: SelectOptionType = .single, options: [SelectOption]) {
            self.type = type
            self.options = options
        }
    }
    
}


enum SelectOptionType {
    case single
    case multi
}
