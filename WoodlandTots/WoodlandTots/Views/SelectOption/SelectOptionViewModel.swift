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
        
        init(type: SelectOptionType = .single) {
            self.type = type
        }
    }
    
}


enum SelectOptionType {
    case single
    case multi
}
