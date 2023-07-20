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
                                SwipeAction("Edit") {
                                    print("Tapped!")
                                }
                                .allowSwipeToTrigger(false)
                                SwipeAction("Delete") {
                                    print("Tapped!")
                                }
                                .allowSwipeToTrigger(false)
                            }
                        }
                        .cornerRadius(8)
                    }
                    
                    
                    //.onDelete(perform: deleteItems(at:))
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
        //.padding(.horizontal, 20)
    }
    
    func deleteItems(at offsets: IndexSet) {
        self.viewModel.children.remove(atOffsets: offsets)
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
        ChildrenView(viewModel: self.getViewModel())
    }
    
    static func getViewModel() -> ChildrenView.ViewModel {
        var viewModel = ChildrenView.ViewModel.init()
        viewModel.children = [.init(name: "Test", age: 12, ageUnits: .months, note: "test")]
        
        return viewModel
    }
}
