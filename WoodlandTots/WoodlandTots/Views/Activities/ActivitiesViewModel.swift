//
//  ActivitiesViewModel.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/19/23.
//

import Foundation

extension ActivitiesView {
    class ViewModel: ObservableObject {
        var children: [ActivityItem] = [ActivityItem]()
        
        init() {
            self.children = [
                .init(
                    name: "Build Dinosaurs"
                ),
                .init(
                    name: "Read a Book"
                )
            ]
        }
    }
}
