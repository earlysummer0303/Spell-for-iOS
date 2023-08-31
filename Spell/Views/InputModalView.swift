//
//  InputModalView.swift
//  Spell
//
//  Created by 황지우2 on 2023/08/23.
//

import SwiftUI

struct InputModalView: View {
    
    @Environment(\.dismiss) var dismiss
    
    @State var textFieldText: String = ""
    @State var userInput: String = ""
    @Binding var appendList: [Spell]
    
    var body: some View {
        ZStack {
            Color.g1Color.ignoresSafeArea()
            VStack(spacing: 0) {
                Text("Add your own")
                    .foregroundColor(.white)
                    .cap1Font()
                TextField("30 characters or less", text: $textFieldText)
                    .padding(.horizontal, 12)
                    .padding(.vertical, 15)
                    .foregroundColor(.white)
                    .background(Color.g2Color)
                    .cornerRadius(10)
                    .padding(.top, 24)
                ctaGradientButton(title: "Add") {
                    // inputText Binding
                    userInput = textFieldText
                    appendList.append(Spell(message: userInput, isDefault: false, isSelected: false))
                    dismiss()
                }
                .padding(.top, 22)
                .disabled(textFieldText.isEmpty)
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.top, 24)
        }
    }
}


//struct InputModalView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        InputModalView()
//    }
//}
