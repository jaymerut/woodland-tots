//
//  SelectOptionProtocol.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/27/23.
//

import Foundation

protocol SelectOptionProtocol {
    func apply<T>(options: [SelectOption], valueType: T.Type)
}
