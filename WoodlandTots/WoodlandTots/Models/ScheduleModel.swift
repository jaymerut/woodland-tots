//
//  ScheduleModel.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/23/23.
//

import Foundation

public class ScheduleModel: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case date = "date"
        case child = "child"
        case activities = "activities"
    }
    
    var id: String = UUID().uuidString
    var date: Date = Date()
    var child: ChildModel = ChildModel()
    var activities: [ActivityModel] = [ActivityModel]()
    
    init() {
        
    }
    init(id: String, date: Date, child: ChildModel, activities: [ActivityModel]) {
        self.id = id
        self.date = date
        self.child = child
        self.activities = activities
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.date, forKey: .date)
        try container.encodeIfPresent(self.child, forKey: .child)
        try container.encodeIfPresent(self.activities, forKey: .activities)
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        self.date = try container.decodeIfPresent(Date.self, forKey: .date) ?? .now
        self.child =  try container.decodeIfPresent(ChildModel.self, forKey: .child) ?? ChildModel()
        self.activities = try container.decodeIfPresent([ActivityModel].self, forKey: .activities) ?? [ActivityModel]()
    }
}
