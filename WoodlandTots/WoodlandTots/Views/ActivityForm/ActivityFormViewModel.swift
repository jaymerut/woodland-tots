//
//  ActivityFormViewModel.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/20/23.
//

import Foundation

extension ActivityFormView {
    class ViewModel: ObservableObject {
        var categories: [String] = [
            CategoryType.art.rawValue,
            CategoryType.language.rawValue
        ]
        var delegate: ActivityFormProtocol?
        
        init() {
            
        }
        init(delegate: ActivityFormProtocol) {
            self.delegate = delegate
        }
    }
}
