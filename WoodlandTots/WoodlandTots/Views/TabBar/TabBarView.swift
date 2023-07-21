//
//  TabBarView.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/18/23.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab = 0

    var body: some View {
        return TabView(selection: $selectedTab) {
            ChildrenView(viewModel: .init())
                .tabItem {
                    Image("children_tab")
                        .renderingMode(.template)
                        .foregroundColor(Color.init(hex: 0x097969))
                    Text("Children")
                }
                .foregroundColor(Color.init(hex: 0x097969))
                .tag(0)
            ActivitiesView(viewModel: .init())
                .tabItem {
                    Image(systemName: "star.fill")
                        .renderingMode(.template)
                    Text("Activities")
                }
                .tag(1)
            ScheduleView(viewModel: .init())
                .tabItem {
                    Image(systemName: "calendar")
                        .renderingMode(.template)
                    Text("Schedule")
                }
                .tag(2)
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
