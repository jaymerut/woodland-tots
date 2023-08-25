//
//  ScheduleHelper.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 8/24/23.
//

import Foundation

class ScheduleHelper {
    
    static func getAllActivities() -> [ActivityItem] {
        var activities = [ActivityItem]()
        if let activityModels = SwiftAppDefaults.get(.activityModels, entityType: [ActivityModel].self) as? [ActivityModel] {
            activities = ActivityModelMapper.convertActivityModelsToActivityItems(models: activityModels)
        }
        return activities
    }
}
