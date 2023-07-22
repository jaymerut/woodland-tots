//
//  ScheduleFormViewModel.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/21/23.
//

import Foundation

extension ScheduleFormView {
    class ViewModel: ObservableObject {
        
        var model: ScheduleItem = .init()
        var delegate: ScheduleFormProtocol?
        var mode: FormMode = .add
        lazy var title: String = {
            switch mode {
            case .add:
                return "Add Schedule"
            case .edit:
                return "Edit Schedule"
            }
        }()
        lazy var submitText: String = {
            switch mode {
            case .add:
                return "Add Schedule"
            case .edit:
                return "Edit Schedule"
            }
        }()
        
        init() {
            
        }
        init(delegate: ScheduleFormProtocol, mode: FormMode) {
            self.delegate = delegate
            self.mode = mode
        }
        convenience init(model: ScheduleItem, delegate: ScheduleFormProtocol, mode: FormMode) {
            self.init(delegate: delegate, mode: mode)
            self.model = model
            
        }
    }
}
