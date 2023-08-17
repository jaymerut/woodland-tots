//
//  ActivityModelMapper.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/23/23.
//

import Foundation

class ActivityModelMapper {
    static func convertActivityItemToActivityModels(models: [ActivityItem]) -> [ActivityModel] {
        var result = [ActivityModel]()
        
        for item in models {
            result.append(.init(id: item.id, name: item.name, categoryType: item.categoryType, description: item.description))
        }
        
        return result
    }
    static func convertActivityModelsToActivityItems(models: [ActivityModel]) -> [ActivityItem] {
        var result = [ActivityItem]()
        
        for item in models {
            result.append(.init(id: item.id, name: item.name, categoryType: item.categoryType, description: item.description))
        }
        
        return result
    }
}
