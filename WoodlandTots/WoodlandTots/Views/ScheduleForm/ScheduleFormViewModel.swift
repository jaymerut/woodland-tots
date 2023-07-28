//
//  ScheduleFormViewModel.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/21/23.
//

import Foundation

extension ScheduleFormView {
    class ViewModel: ObservableObject {
        
        var children: [ChildItem] = [ChildItem]()
        var activities: [ActivityItem] = [ActivityItem]()
        var model: ScheduleItem = .init()
        var delegate: ScheduleFormProtocol?
        var mode: FormMode = .add
        lazy var title: String = {
            switch mode {
            case .add:
                return "Add Schedule"
            case .edit:
                return "Edit Schedule"
            }
        }()
        lazy var submitText: String = {
            switch mode {
            case .add:
                return "Add Schedule"
            case .edit:
                return "Edit Schedule"
            }
        }()
        lazy var childrenOptions: [SelectOption] = {
            var options = [SelectOption]()
            for child in children {
                options.append(.init(name: child.name, value: child))
            }
            return options
        }()
        lazy var activityOptions: [SelectOption] = {
            var options = [SelectOption]()
            for activity in activities {
                options.append(.init(name: activity.name, value: activity))
            }
            return options
        }()
        
        init() {
            if let childModels = SwiftAppDefaults.get(.childModels, entityType: [ChildModel].self) as? [ChildModel] {
                self.children = ChildModelMapper.convertChildModelsToChildItems(models: childModels)
            }
            if let activityModels = SwiftAppDefaults.get(.activityModels, entityType: [ActivityModel].self) as? [ActivityModel] {
                self.activities = ActivityModelMapper.convertActivityModelsToActivityItems(models: activityModels)
            }
        }
        convenience init(delegate: ScheduleFormProtocol, mode: FormMode) {
            self.init()
            self.delegate = delegate
            self.mode = mode
        }
        convenience init(model: ScheduleItem, delegate: ScheduleFormProtocol, mode: FormMode) {
            self.init(delegate: delegate, mode: mode)
            self.model = model
            
        }
    }
}
