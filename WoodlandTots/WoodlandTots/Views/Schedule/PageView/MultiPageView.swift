//
//  PageView.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/19/23.
//

import SwiftUI

public struct MultiPageView: View {
    
    public init<PageType: View>(
        pages: [PageType],
        indexDisplayMode: PageTabViewStyle.IndexDisplayMode = .automatic,
        currentPageIndex: Binding<Int>) {
        self.pages = pages.map { AnyView($0) }
        self.indexDisplayMode = indexDisplayMode
        self.currentPageIndex = currentPageIndex
    }
    
    public init<Model, ViewType: View>(
        items: [Model],
        indexDisplayMode: PageTabViewStyle.IndexDisplayMode = .automatic,
        currentPageIndex: Binding<Int>,
        pageBuilder: (Model) -> ViewType) {
        self.pages = items.map { AnyView(pageBuilder($0)) }
        self.indexDisplayMode = indexDisplayMode
        self.currentPageIndex = currentPageIndex
    }
    
    private let pages: [AnyView]
    private let indexDisplayMode: PageTabViewStyle.IndexDisplayMode
    private var currentPageIndex: Binding<Int>
    
    public var body: some View {
        TabView(selection: currentPageIndex) {
            ForEach(Array(pages.enumerated()), id: \.offset) {
                $0.element.tag($0.offset)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: indexDisplayMode))
    }
}
