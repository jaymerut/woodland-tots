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
            guard let scheduleModel = SwiftAppDefaults.get(.scheduleModels, entityType: [ScheduleModel].self) as? [ScheduleModel] else { return }
            
            self.schedules = ScheduleModelMapper.convertScheduleModelsToScheduleItems(models: scheduleModel)
        }
    }
}
