//
//  ScheduleListViewModel.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 8/20/23.
//

import Foundation

extension ScheduleListView {
    class ViewModel: ObservableObject {
        @Published var schedules: [ScheduleItem] = [ScheduleItem]()
        
        init(schedules: [ScheduleItem]) {
            self.schedules = schedules
        }
    }
}
