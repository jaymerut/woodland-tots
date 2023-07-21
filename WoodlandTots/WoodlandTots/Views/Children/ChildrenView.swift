//
//  ChildrenView.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/18/23.
//

import SwiftUI
import SwipeActions

struct ChildrenView: View {

    @State private var selection: String? = nil
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        return NavigationStack() {
            VStack() {
                
                List {
                    ForEach(viewModel.children) { item in
                        Section {
                            SwipeView {
                                ChildCell(item: item)
                                    .listRowSeparator(.hidden)
                                    .listRowInsets(.init(top: 5, leading: 0, bottom: 5, trailing: 0))
                            } leadingActions: { _ in
                            } trailingActions: { _ in
                                SwipeAction(systemImage: "square.and.pencil", backgroundColor: .green) {
                                    // TODO: Navigate user to Edit view
                                }
                                .allowSwipeToTrigger(false)
                                .foregroundColor(.white)
                                
                                SwipeAction(systemImage: "trash.fill", backgroundColor: .red) {
                                    
                                    if let index = self.viewModel.children.firstIndex(where: { $0.id == item.id }) {
                                        self.viewModel.children.remove(at: Int(index.description)!)
                                        SwiftAppDefaults.add(.childModels, self.viewModel.convertChildItemToChildModels(models: self.viewModel.children))
                                    }
                                    
                                }
                                .allowSwipeToTrigger(false)
                                .foregroundColor(.white)
                                
                            }
                        }
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
    }
}

extension ChildrenView: ChildFormProtocol {
    func addChild(child: ChildItem) {
        self.viewModel.children.append(child)
        SwiftAppDefaults.add(.childModels, self.viewModel.convertChildItemToChildModels(models: self.viewModel.children))
    }
    
    func editChild(child: ChildItem) {
        // TODO: Implement
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
