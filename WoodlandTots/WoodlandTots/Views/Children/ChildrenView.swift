//
//  ChildrenView.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/18/23.
//

import SwiftUI

struct ChildrenView: View {

    @State private var selection: String? = nil
    @State private var isEditActive = false
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        return NavigationStack() {
            VStack() {
                
                List {
                    ForEach(viewModel.children) { item in
                        Section {
                            SwipeView {
                                ChildCell(item: item)
                                    .listRowInsets(.init(top: 5, leading: 0, bottom: 5, trailing: 0))
                                NavigationLink(destination: ChildFormView(viewModel: .init(model: item, delegate: self, mode: .edit)), isActive: $isEditActive) {
                                    EmptyView()
                                }
                                .listRowSeparator(.hidden)
                                .frame(width: 0, height: 0)
                                .hidden()
                            } leadingActions: { _ in
                            } trailingActions: { _ in
                                SwipeAction(systemImage: "square.and.pencil", backgroundColor: .green) {
                                    isEditActive.toggle()
                                }
                                .allowSwipeToTrigger(false)
                                .foregroundColor(.white)
                                
                                SwipeAction(systemImage: "trash.fill", backgroundColor: .red) {
                                    
                                    if let row = self.viewModel.children.firstIndex(where: { $0.id == item.id }) {
                                        self.viewModel.children.remove(at: row)
                                        SwiftAppDefaults.add(.childModels, self.viewModel.convertChildItemToChildModels(models: self.viewModel.children))
                                    }
                                    
                                }
                                .allowSwipeToTrigger(false)
                                .foregroundColor(.white)
                                
                            }
                            .listRowSeparator(.hidden)
                        }
                    }
                }
                .listStyle(PlainListStyle())
                .padding(.top, 10)
            }
            .navigationTitle("Children")
            .toolbar {
                NavigationLink {
                    ChildFormView(viewModel: .init(delegate: self, mode: .add))
                } label: {
                    Image(systemName: "plus")
                        .renderingMode(.template)
                        .frame(width: 45, height: 45)
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
        SwiftAppDefaults.add(.childModels, self.viewModel.convertChildItemToChildModels(models: self.viewModel.children))
    }
    
    func editChild(child: ChildItem) {
        if let row = self.viewModel.children.firstIndex(where: { $0.id == child.id }) {
            self.viewModel.children[row] = child
            SwiftAppDefaults.add(.childModels, self.viewModel.convertChildItemToChildModels(models: self.viewModel.children))
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
