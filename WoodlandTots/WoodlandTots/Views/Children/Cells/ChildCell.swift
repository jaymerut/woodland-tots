//
//  ChildCell.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/18/23.
//

import SwiftUI

struct ChildCell: View {
    @ObservedObject var item: ChildItem
    var delegate: ChildFormProtocol
    
    @State private var isPresentingForm = false
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack() {
                    Text(item.name)
                        .font(FontHelper.fontHelveticaBold(22))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    VStack(alignment: .leading) {
                        HStack {
                            Button() {
                                isPresentingForm.toggle()
                            } label: {
                                Image(systemName: "square.and.pencil")
                                    .renderingMode(.template)
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.white)
                                    .background(.green)
                                    .clipShape(Circle())
                            }
                            .buttonStyle(.plain)
                            
                            
                            NavigationLink(destination: ChildFormView(viewModel: .init(model: item, delegate: self.delegate, mode: .edit)), isActive: $isPresentingForm) {}
                                    .frame(width: 0, height: 0)
                                    .hidden()
            
                            Image(systemName: "trash.fill")
                                .renderingMode(.template)
                                .frame(width: 40, height: 40)
                                .foregroundColor(.white)
                                .background(.red)
                                .clipShape(Circle())
                                .onTapGesture {
                                    self.delegate.removeChild(child: item)
                                }
                        }
                    }
                    
                }
                
                Text(item.ageString)
                    .font(FontHelper.fontHelveticaBold(14))
                    .multilineTextAlignment(.trailing)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(item.note)
                    .font(FontHelper.fontHelveticaNeueItalic(16.0))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 5)
                    .visibility(item.note.isEmpty ? .gone : .visible)
                
                
            }
            .padding(10)
        }
        
    }
}

struct ChildCell_Previews: PreviewProvider {
    static var previews: some View {
        ChildCell(item: .init(
            id: "123",
            name: "Test 1",
            age: 2,
            ageUnits: .years,
            note: "This is a note"
        ), delegate: ChildrenView(viewModel: .init()))
    }
}
