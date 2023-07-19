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
                .init(
                    name: "Tim",
                    age: 2,
                    ageUnits: .years,
                    note: "This is a note"
                ),
                .init(
                    name: "Charlie",
                    age: 8,
                    ageUnits: .months,
                    note: ""
                )
            ]
        }
    }
}
