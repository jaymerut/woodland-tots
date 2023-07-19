//
//  ViewVisibility.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/18/23.
//

import Foundation

enum ViewVisibility: CaseIterable {
  case visible, // view is fully visible
       invisible, // view is hidden but takes up space
       gone // view is fully removed from the view hierarchy
}
