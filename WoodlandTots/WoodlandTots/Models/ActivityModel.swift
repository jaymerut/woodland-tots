//
//  ActivityModel.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/20/23.
//

import Foundation

public class ActivityModel: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case categoryType = "categoryType"
        case description = "description"
    }
    
    var id: String = ""
    var name: String = ""
    var categoryType: CategoryType = .empty
    var description: String = ""
    
    init() {
        
    }
    init(id: String, name: String, categoryType: CategoryType, description: String) {
        self.id = id
        self.name = name
        self.categoryType = categoryType
        self.description = description
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.categoryType.rawValue, forKey: .categoryType)
        try container.encodeIfPresent(self.description, forKey: .description)
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.categoryType = CategoryType(rawValue: try container.decodeIfPresent(String.self, forKey: .categoryType) ?? "") ?? .empty
        self.description = try container.decodeIfPresent(String.self, forKey: .description) ?? ""
    }
}
