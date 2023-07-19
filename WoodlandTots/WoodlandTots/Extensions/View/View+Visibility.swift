//
//  View+Visibility.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/18/23.
//

import SwiftUI

extension View {
  @ViewBuilder func visibility(_ visibility: ViewVisibility) -> some View {
    if visibility != .gone {
      if visibility == .visible {
        self
      } else {
        hidden()
      }
    }
  }
}
