//
//  ChildModel.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/19/23.
//

import Foundation

public class ChildModel: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case age = "age"
        case ageUnits = "ageUnits"
        case ageString = "ageString"
        case note = "note"
    }
    
    var id: String = ""
    var name: String = ""
    var age: Int = 0
    var ageUnits: AgeType = .years
    var ageString: String = ""
    var note: String = ""
    
    init(id: String, name: String, age: Int, ageUnits: AgeType, note: String) {
        self.id = id
        self.name = name
        self.age = age
        self.ageUnits = ageUnits
        self.note = note
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encodeIfPresent(self.id, forKey: .id)
        try container.encodeIfPresent(self.name, forKey: .name)
        try container.encodeIfPresent(self.age, forKey: .age)
        try container.encodeIfPresent(self.ageUnits.rawValue, forKey: .ageUnits)
        try container.encodeIfPresent(self.ageString, forKey: .ageString)
        try container.encodeIfPresent(self.note, forKey: .note)
    }
    
    required public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decodeIfPresent(String.self, forKey: .id) ?? ""
        self.name = try container.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.age = try container.decodeIfPresent(Int.self, forKey: .age) ?? 0
        self.ageUnits = AgeType(rawValue: try container.decodeIfPresent(String.self, forKey: .ageUnits) ?? "") ?? .years
        self.ageString = try container.decodeIfPresent(String.self, forKey: .ageString) ?? ""
        self.note = try container.decodeIfPresent(String.self, forKey: .note) ?? ""
    }
}
