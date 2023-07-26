//
//  SelectOptionView.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/26/23.
//

import SwiftUI

struct SelectOptionView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        return HStack {
            
        }
    }
}

extension SelectOptionView: SelectOptionProtocol {
    func selectedOption(option: SelectOption) {
        
    }
    
    func applyOptions(options: [SelectOption]) {
        
    }
}
