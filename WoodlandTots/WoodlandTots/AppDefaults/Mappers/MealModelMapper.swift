//
//  MealModelMapper.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 12/30/23.
//

import Foundation

class MealModelMapper {
    static func convertMealItemToMealModels(models: [MealItem]) -> [MealModel] {
        var result = [MealModel]()
        
        for item in models {
            result.append(.init(id: item.id, mealType: item.mealType, note: item.note))
        }
        
        return result
    }
    static func convertMealModelsToMealItems(models: [MealModel]) -> [MealItem] {
        var result = [MealItem]()
        
        for item in models {
            result.append(.init(id: item.id, mealType: item.mealType, note: item.note))
        }
        
        return result
    }
}
