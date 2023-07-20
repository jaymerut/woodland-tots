//
//  ChildrenViewModel.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/18/23.
//

import Foundation

extension ChildrenView {
    class ViewModel: ObservableObject {
        @Published var children: [ChildItem] = [ChildItem]()
        
        init() {
            guard let childModels = SwiftAppDefaults.get(.childModels, entityType: [ChildModel].self) as? [ChildModel] else { return }
            
            self.children = self.convertChildModelsToChildItems(models: childModels)
        }
        
        func convertChildItemTtoChildModels(models: [ChildItem]) -> [ChildModel] {
            var result = [ChildModel]()
            
            for item in models {
                result.append(.init(name: item.name, age: item.age, ageUnits: item.ageUnits, note: item.note))
            }
            
            return result
        }
        func convertChildModelsToChildItems(models: [ChildModel]) -> [ChildItem] {
            var result = [ChildItem]()
            
            for item in models {
                result.append(.init(name: item.name, age: item.age, ageUnits: item.ageUnits, note: item.note))
            }
            
            return result
        }
    }
}
