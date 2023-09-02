//
//  InputModalView.swift
//  Spell
//
//  Created by 황지우2 on 2023/08/23.
//

import SwiftUI

struct InputModalView: View {
    
    @Environment(\.dismiss) var dismiss
    
    private let placeHolder = "30 characters or less"
    private let letterLimit = 30
    @State private var isOverLetterLimit = false
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
                ZStack(alignment: .leading) {
                    TextField("", text: $textFieldText)
                        .padding(.horizontal, 12)
                        .padding(.vertical, 15)
                        .foregroundColor(.white)
                        .background(Color.g2Color)
                        .cornerRadius(10)
                        .onReceive(textFieldText.publisher.collect()) { collectionText in
                            let trimmedText = String(collectionText.prefix(letterLimit))
                            if textFieldText != trimmedText {
                                isOverLetterLimit = textFieldText.count > letterLimit ? true : false
                                textFieldText = trimmedText
                            }
                        }
                    Text(placeHolder)
                        .cap3Font()
                        .foregroundColor(.g3Color)
                        .opacity(textFieldText.isEmpty ? 1 : 0)
                        .padding(.leading, 12)
                }
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

extension InputModalView {
    
    // placeHolder 색상을 커스텀하게 바꾸기 위한 extension
    func placeholder<Content: View>(
         when shouldShow: Bool,
         alignment: Alignment = .leading,
         @ViewBuilder placeholder: () -> Content) -> some View {

         ZStack(alignment: alignment) {
             placeholder().opacity(shouldShow ? 1 : 0)
             self
         }
     }
}


//struct InputModalView_Previews: PreviewProvider {
//    
//    static var previews: some View {
//        InputModalView()
//    }
//}
