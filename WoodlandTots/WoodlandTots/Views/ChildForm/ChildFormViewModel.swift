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
        var model: ChildItem = .init()
        var delegate: ChildFormProtocol?
        var mode: FormMode = .add
        lazy var title: String = {
            switch mode {
            case .add:
                return "Add Child"
            case .edit:
                return "Edit Child"
            }
        }()
        lazy var submitText: String = {
            switch mode {
            case .add:
                return "Add Child"
            case .edit:
                return "Edit Child"
            }
        }()
        
        init() {
            
        }
        init(delegate: ChildFormProtocol, mode: FormMode) {
            self.delegate = delegate
            self.mode = mode
        }
        convenience init(model: ChildItem, delegate: ChildFormProtocol, mode: FormMode) {
            self.init(delegate: delegate, mode: mode)
            self.model = model
        }
    }
}
