//
//  MealModel.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 12/30/23.
//

import Foundation

public class MealModel: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case mealType = "mealType"
        case note = "note"
    }
    
    var id: String = ""
    var mealType: MealType = .breakfast
    var note: String = ""
    
    init() {
        
    }
    
    init(id: String, mealType: MealType, note: String) {
        self.id = id
        self.mealType = mealType
        self.note = note
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.mealType.rawValue, forKey: .mealType)
        try container.encodeIfPresent(self.note, forKey: .note)
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        self.mealType = MealType(rawValue: try container.decodeIfPresent(Int.self, forKey: .mealType) ?? 0) ?? .breakfast
        self.note = try container.decodeIfPresent(String.self, forKey: .note) ?? ""
    }
}
