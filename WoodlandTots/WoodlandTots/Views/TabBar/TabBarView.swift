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
            ContentView()
                .tabItem {
                    Image(systemName: "globe")
                        .renderingMode(.template)
                    Text("Children")
                }
                .tag(0)
            ContentView()
                .tabItem {
                    Image(systemName: "globe")
                        .renderingMode(.template)
                    Text("Activities")
                }
                .tag(1)
            ContentView()
                .tabItem {
                    Image(systemName: "globe")
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
