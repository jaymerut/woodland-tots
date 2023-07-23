//
//  ScheduleModelMapper.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/23/23.
//

import Foundation

class ScheduleModelMapper {
    static func convertScheduleItemToScheduleModels(models: [ScheduleItem]) -> [ScheduleModel] {
        var result = [ScheduleModel]()
        
        for item in models {
            result.append(.init(id: item.id, date: item.date, child: ChildModelMapper.convertChildItemToChildModels(models: [item.child]).first ?? .init(), activities: ActivityModelMapper.convertActivityItemToActivityModels(models: item.activities)))
        }
        
        return result
    }
    static func convertScheduleModelsToScheduleItems(models: [ScheduleModel]) -> [ScheduleItem] {
        var result = [ScheduleItem]()
        
        for item in models {
            result.append(.init(id: item.id, date: item.date, child: ChildModelMapper.convertChildModelsToChildItems(models: [item.child]).first ?? .init(), activities: ActivityModelMapper.convertActivityModelsToActivityItems(models: item.activities)))
        }
        
        return result
    }
}
