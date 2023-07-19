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
                Text(item.name)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(15)
        }
        
    }
}

struct ChildCell_Previews: PreviewProvider {
    static var previews: some View {
        ChildCell(item: .init(name: "Test"))
    }
}
