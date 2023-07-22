//
//  ScheduleViewModel.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/18/23.
//

import Foundation

extension ScheduleView {
    class ViewModel: ObservableObject {
        @Published var schedules: [ScheduleItem] = [ScheduleItem]()
        
        init() {
            self.schedules = [
                .init(id: "1", date: .now, activities: [ActivityItem](), child: .init())
            ]
        }
    }
}
