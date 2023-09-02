//
//  SellectSpellView.swift
//  Spell
//
//  Created by 황지우2 on 2023/08/23.
//

import SwiftUI

struct SelectSpellView: View {
    
    //vm - @EnvironmentObject로 App 파일에 생성된 ViewModel 인스턴스를 불러와서 사용.
    @Environment(\.presentationMode) private var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var vm: SelectSpellViewModel
    
    @State var showInputSheet = false
    @State var inputDatai: String? = nil
    @State var showSelectAlert = false
    
    var body: some View {
        ZStack {
            backgroundColorView()
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
            VStack(spacing: 0) {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    navigationBackButtonHeaderLabel()
                })
                Text("Select your spells")
                    .h5Font()
                    .foregroundColor(.white)
                Text("Choose 5 or less")
                    .cap2Font()
                    .foregroundColor(.g3Color)
                    .padding(.top, 6)
                List {
                    ForEach(Array(vm.spellList.enumerated()), id: \.offset) { index, defaultSpell in
                        if defaultSpell.isDefault {
                            showSpellListRow(spell: defaultSpell, index: index)
                        }
                    }
                    ForEach(Array(vm.spellList.enumerated()), id: \.offset) { index, customSpell in
                        if !customSpell.isDefault {
                            showSpellListRow(spell: customSpell, index: index)
                        }
                    }
                    .onDelete(perform: vm.deleteCustomSpell)
                    spellAddButton()
                        .onTapGesture {
                            withAnimation {
                                showInputSheet.toggle()
                            }
                        }
                }
            
                .scrollContentBackground(.hidden)
                .environment(\.defaultMinListRowHeight, 52)
                ctaGradientButton(title: "Select", isDisabled: vm.selectedSpellList.isEmpty) {
                    showSelectAlert = true
                }
                .disabled(vm.selectedSpellList.isEmpty)
                .padding(.horizontal, 20)
            }
        }
        .sheet(isPresented: $showInputSheet) {
            InputModalView(appendList: $vm.spellList)
                .presentationDetents([.height(239)])
                .presentationDragIndicator(.visible)
        }
        .alert("Want to save \(vm.selectedSpellList.count) spells?", isPresented: $showSelectAlert) {
            Button("Cancel", role: .destructive) {
                
            }
            Button("Yes", role: .cancel) {
                vm.sendFinalListData()
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
    
    private func spellListRow(title: String, isSelected: Bool) -> some View {
        Text("dfedfwefwedfdfdfdfdfdfdfdfdfdfdfdfdfd")
            .foregroundColor(.clear)
             .listRowBackground (
                 RoundedRectangle(cornerRadius: 20)
                    .fill(isSelected ? Color.white : Color.g1Color)
                     .frame(height: 52)
                     .overlay(
                         Text(title)
                            .foregroundColor(isSelected ? .bgColor : .g3Color)
                             .cap3Font()
                     )
             )
    }
    
    private func showSpellListRow(spell: Spell, index: Int) -> some View  {
        spellListRow(title: spell.message, isSelected: vm.spellList[index].isSelected)
            .padding(.vertical)
            .onTapGesture {
                vm.toggleSpellSelectedState(index: index)
            }
    }
    
    private func spellAddButton() -> some View {
        Text("dfedfwefwedfdfdfdfdfdfdfdfdfdfdfdfdfd")
            .foregroundColor(.clear)
            .listRowBackground (
                Rectangle()
                    .fill(Color.clear)
                    .frame(width: 350, height: 52)
                    .overlay(
                        spellAddButtonLabel()
                    )
            )
    }
    
    private func spellAddButtonLabel() -> some View {
        HStack(spacing: 0) {
            Circle()
                .fill(Color.g1Color)
                .frame(width: 28, height: 28)
                .overlay(
                    Image(systemName: "plus")
                        .foregroundColor(.g3Color)
                        .font(.system(size: 16, weight: .bold))
                )
            Text("Add your own")
                .b2Font()
                .foregroundColor(.white)
                .padding(.leading, 10)
        }
    }
    
}

struct SellectSpellView_Previews: PreviewProvider {
    static var previews: some View {
        SelectSpellView()
    }
}
