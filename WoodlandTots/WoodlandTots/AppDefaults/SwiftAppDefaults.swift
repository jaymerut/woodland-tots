//
//  SwiftAppDefaults.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/19/23.
//

import Foundation

public enum SwiftAppKeys: String {
    case childModels = "AppDefaults.Keys.childModels"
}

protocol SwiftAppDefaultsProtocol {
    static func add(_ key: SwiftAppKeys, _ duration: Duration, _ object: Encodable)
    static func get<R: Decodable>(_ key: SwiftAppKeys, entityType: R.Type) -> Any?
}

public class SwiftAppDefaults: SwiftAppDefaultsProtocol {
    
    public static let shared: SwiftAppDefaults = {
        return SwiftAppDefaults()
    }()
    
    private var defaults: UserDefaults
    
    public init() {
        self.defaults = UserDefaults.standard
    }
    
    public static func add(_ key: SwiftAppKeys, _ duration: Duration, _ object: Encodable) {
        if let encoded = try? JSONEncoder().encode(object) {
            UserDefaults.standard.set(encoded, forKey: key.rawValue)
        }
    }
    
    // MARK:- GET function
    public static func get<R: Decodable>(_ key: SwiftAppKeys, entityType: R.Type) -> Any? {
        if let data = UserDefaults.standard.object(forKey: key.rawValue) as? Data {
            if let decoded = try? JSONDecoder().decode(entityType, from: data) {
                return decoded
            }
        }
        return nil
    }
}
