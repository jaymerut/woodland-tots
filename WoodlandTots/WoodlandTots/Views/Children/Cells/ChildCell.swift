//
//  ChildCell.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/18/23.
//

import SwiftUI

struct ChildCell: View {
    @ObservedObject var item: ChildItem
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack() {
                    Text(item.name)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(item.ageString)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Text(item.note)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 5)
                    .visibility(item.note.isEmpty ? .gone : .visible)
                
                
            }
            .padding(15)
        }
        
    }
}

struct ChildCell_Previews: PreviewProvider {
    static var previews: some View {
        ChildCell(item: .init(
            name: "Test 1",
            age: 2,
            ageUnits: .years,
            note: "This is a note"
        ))
    }
}
