//
//  ChildSummaryViewModel.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 8/20/23.
//

import Foundation

extension ChildSummaryView {
    class ViewModel: ObservableObject {
        @Published var schedule: ScheduleItem = .init()
        
        init(schedule: ScheduleItem) {
            self.schedule = schedule
        }
    }
}
