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
            
            self.activities = self.convertActivityModelsToActivityItems(models: activityModels)
        }
        
        func convertActivityItemToActivityModels(models: [ActivityItem]) -> [ActivityModel] {
            var result = [ActivityModel]()
            
            for item in models {
                result.append(.init(id: item.id, name: item.name, categoryType: item.categoryType, description: item.description))
            }
            
            return result
        }
        func convertActivityModelsToActivityItems(models: [ActivityModel]) -> [ActivityItem] {
            var result = [ActivityItem]()
            
            for item in models {
                result.append(.init(id: item.id, name: item.name, categoryType: item.categoryType, description: item.description))
            }
            
            return result
        }
    }
}
