//
//  ChildrenViewModel.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/18/23.
//

import Foundation

extension ChildrenView {
    class ViewModel: ObservableObject {
        var children: [ChildItem] = [ChildItem]()
        
        init() {
            self.children = [
                .init(name: "Test 1"),
                .init(name: "Test 2")
            ]
        }
    }
}
