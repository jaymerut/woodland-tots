//
//  ScheduleViewModel.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/18/23.
//

import Foundation

extension ScheduleView {
    class ViewModel: ObservableObject {
        
        var model: ScheduleItem = .init()
        var delegate: ScheduleFormProtocol?
        var mode: FormMode = .add
        
        init() {

        }
    }
}
