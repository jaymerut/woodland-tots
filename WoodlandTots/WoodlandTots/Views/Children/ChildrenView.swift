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
        return NavigationView() {
            VStack() {
                
                List {
                    ForEach(viewModel.children) { item in
                        ChildCell(item: item, delegate: self)
                            .listRowInsets(.init(top: 5, leading: 5, bottom: 5, trailing: 5))
                            .buttonStyle(PlainButtonStyle())
                            .listRowBackground(Color.clear)
                            .listRowSeparator(.hidden)
                    }
                }
                .listStyle(PlainListStyle())
                .padding(.top, 10)
            }
            .navigationTitle("Children")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                NavigationLink {
                    ChildFormView(viewModel: .init(delegate: self, mode: .add))
                } label: {
                    Image(systemName: "plus")
                        .renderingMode(.template)
                        .frame(width: 35, height: 35)
                        .foregroundColor(.white)
                        .background(Color.init(hex: 0x097969))
                        .clipShape(Circle())
                }
                .buttonStyle(.automatic)
                
            }
        }
    }
}

extension ChildrenView: ChildFormProtocol {
    func addChild(child: ChildItem) {
        self.viewModel.children.append(child)
        SwiftAppDefaults.add(.childModels, ChildModelMapper.convertChildItemToChildModels(models: self.viewModel.children))
    }
    
    func editChild(child: ChildItem) {
        if let row = self.viewModel.children.firstIndex(where: { $0.id == child.id }) {
            self.viewModel.children[row] = child
            SwiftAppDefaults.add(.childModels, ChildModelMapper.convertChildItemToChildModels(models: self.viewModel.children))
        }
    }
    
    func removeChild(child: ChildItem) {
        if let row = self.viewModel.children.firstIndex(where: { $0.id == child.id }) {
            self.viewModel.children.remove(at: row)
            SwiftAppDefaults.add(.activityModels, ChildModelMapper.convertChildItemToChildModels(models: self.viewModel.children))
        }
    }
}

struct ChildrenView_Previews: PreviewProvider {
    
    static var previews: some View {
        ChildrenView(viewModel: self.getViewModel())
    }
    
    static func getViewModel() -> ChildrenView.ViewModel {
        let viewModel = ChildrenView.ViewModel.init()
        viewModel.children = [.init(id: "123", name: "Test", age: 12, ageUnits: .months, note: "test")]
        
        return viewModel
    }
}
