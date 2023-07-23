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
            
            self.children = ChildModelMapper.convertChildModelsToChildItems(models: childModels)
        }
    }
}
