//
//  ChildModelMapper.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/23/23.
//

import Foundation

class ChildModelMapper {
    static func convertChildItemToChildModels(models: [ChildItem]) -> [ChildModel] {
        var result = [ChildModel]()
        
        for item in models {
            result.append(.init(id: item.id, name: item.name, age: item.age, ageUnits: item.ageUnits, note: item.note))
        }
        
        return result
    }
    static func convertChildModelsToChildItems(models: [ChildModel]) -> [ChildItem] {
        var result = [ChildItem]()
        
        for item in models {
            result.append(.init(id: item.id, name: item.name, age: item.age, ageUnits: item.ageUnits, note: item.note))
        }
        
        return result
    }
}
