//
//  ChildrenView.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/18/23.
//

import SwiftUI

struct ChildrenView: View {

    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        return VStack() {
            List {
                ForEach(viewModel.children) { item in
                    Section {
                        ChildCell(item: item)
                            .listRowInsets(.init(top: 5, leading: 0, bottom: 5, trailing: 0))
                            .listRowSeparator(.hidden)
                            .background(.blue)
                    }
                    .cornerRadius(8)
                }
            }
            .listStyle(PlainListStyle())
            .padding(.top, 10)
        }
        .padding(.top, 30)
        .padding(.horizontal, 20)
    }
}

struct ChildrenView_Previews: PreviewProvider {
    static var previews: some View {
        ChildrenView(viewModel: .init())
    }
}
