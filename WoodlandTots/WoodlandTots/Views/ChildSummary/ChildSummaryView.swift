//
//  ChildSummaryView.swift
//  WoodlandTots
//
//  Created by Jayme Rutkoski on 8/20/23.
//

import SwiftUI
import MessageUI

struct ChildSummaryView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    @State var result: Result<MFMailComposeResult, Error>? = nil
    @State var isShowingMailView = false
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(viewModel.schedule.child.name)
                .font(FontHelper.fontHelveticaBold(32))
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("Activities")
                .font(FontHelper.fontHelvetica(24))
                .foregroundColor(.blue)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 20)
            ForEach(viewModel.schedule.activities) { item in
                Text(item.categoryType.rawValue)
                    .font(FontHelper.fontHelveticaBold(18))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 5)
                Text(item.description)
                    .font(FontHelper.fontHelvetica(14))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 1)
            }
            .padding(.leading, 10)
            
            Spacer()
            Button() {
                
            } label: {
                Text("Send Summary")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .font(.system(size: 22))
                    .padding()
            }
            .disabled(!MFMailComposeViewController.canSendMail())
            .sheet(isPresented: $isShowingMailView) {
                MailView(result: self.$result)
            }
            .buttonStyle(.plain)
            .padding(10)
            .background(.green)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: 60.0)
            .cornerRadius(12)
            .padding(.top, 5)
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .navigationTitle("Summary")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ChildSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        ChildSummaryView(viewModel: .init(schedule: .init(id: UUID().uuidString, date: .now, child: .init(id: UUID().uuidString, name: "Test Child", age: 5, ageUnits: .years, note: ""), activities: [.init(id: UUID().uuidString, name: "Test Activity", categoryType: .art, description: "Learned how to count to 10.")])))
    }
}
