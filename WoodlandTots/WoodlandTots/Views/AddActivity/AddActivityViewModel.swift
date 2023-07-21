//
//  AddActivityViewModel.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/20/23.
//

import Foundation

extension AddActivityView {
    class ViewModel: ObservableObject {
        var categories: [String] = [
            CategoryType.art.rawValue,
            CategoryType.language.rawValue
        ]
        var delegate: AddActivityProtocol?
        
        init() {
            
        }
        init(delegate: AddActivityProtocol) {
            self.delegate = delegate
        }
    }
}
