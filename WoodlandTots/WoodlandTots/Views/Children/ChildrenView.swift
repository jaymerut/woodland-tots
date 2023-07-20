//
//  ChildrenView.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/18/23.
//

import SwiftUI

struct ChildrenView: View {

    @State private var selection: String? = nil
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        return NavigationStack() {
            VStack() {
                
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
            .navigationTitle("Children")
            .toolbar {
                NavigationLink {
                    AddChildView(viewModel: .init(delegate: self))
                } label: {
                    Image("add")
                        .renderingMode(.template)
                        .foregroundColor(.init(hex: 0x097969))
                }
                .buttonStyle(.automatic)
                
            }
        }
        .padding(.horizontal, 20)
    }
}

extension ChildrenView: AddChildProtocol {
    func addedChild(child: ChildItem) {
        self.viewModel.children.append(child)
        SwiftAppDefaults.add(.childModels, self.viewModel.convertChildItemTtoChildModels(models: self.viewModel.children))
    }
}

struct ChildrenView_Previews: PreviewProvider {
    static var previews: some View {
        ChildrenView(viewModel: .init())
    }
}
