//
//  ActivityCell.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/19/23.
//

import SwiftUI

struct ActivityCell: View {
    @ObservedObject var item: ActivityItem
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                HStack() {
                    Text(item.name)
                        .font(FontHelper.fontHelveticaBold(22))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(item.categoryType.rawValue)
                        .font(FontHelper.fontHelveticaBold(14))
                        .multilineTextAlignment(.trailing)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                Text(item.description)
                    .font(FontHelper.fontHelveticaNeueItalic(16.0))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 5)
                    .visibility(item.description.isEmpty ? .gone : .visible)
                
                
            }
            .padding(10)
        }
        
    }
}

struct ActivityCell_Previews: PreviewProvider {
    static var previews: some View {
        ActivityCell(item: .init(
            id: UUID.init().uuidString,
            name: "Test 1",
            categoryType: .language,
            description: "Description"
        ))
    }
}
