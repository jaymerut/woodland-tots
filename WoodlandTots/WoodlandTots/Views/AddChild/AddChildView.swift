//
//  AddChildView.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 7/18/23.
//

import SwiftUI

struct AddChildView: View {

    @Environment(\.dismiss) private var dismiss
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        return NavigationStack() {
            VStack() {
                
                Button {
                    dismiss()
                } label: {
                    Text("Test Me")
                }
            }
            .navigationTitle("Add Child")
        }
        .padding(.horizontal, 20)
    }
}

struct AddChildView_Previews: PreviewProvider {
    static var previews: some View {
        AddChildView(viewModel: .init())
    }
}
