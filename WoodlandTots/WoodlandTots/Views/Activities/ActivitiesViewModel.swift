//
//  ActivitiesViewModel.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/19/23.
//

import Foundation

extension ActivitiesView {
    class ViewModel: ObservableObject {
        @Published var activities: [ActivityItem] = [ActivityItem]()
        
        init() {
            guard let activityModels = SwiftAppDefaults.get(.activityModels, entityType: [ActivityModel].self) as? [ActivityModel] else { return }
            
            self.activities = ActivityModelMapper.convertActivityModelsToActivityItems(models: activityModels)
        }
    }
}
