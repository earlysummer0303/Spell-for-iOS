//
//  SellectSpellView.swift
//  Spell
//
//  Created by 황지우2 on 2023/08/23.
//

import SwiftUI

struct Spell {
    let message: String
    let isDefault: Bool
    var isSelected: Bool
}

struct SellectSpellView: View {
    
    @State var showInputSheet = false
    @State var inputData : String? = nil
    
    @State var spellList = [
        Spell(message: "I am an irreplaceable person", isDefault: true, isSelected: false),
        Spell(message: "I can overcome anything", isDefault: true, isSelected: false),
        Spell(message:  "I am an influential person", isDefault: true, isSelected: false),
        Spell(message:  "I have the choice of my work", isDefault: true, isSelected: false),
        Spell(message:  "I am not afraid of challenges", isDefault: true, isSelected: false),
        Spell(message:  "An added one is here", isDefault: true, isSelected: false)
]
    @State var selectedSpellList: [String] = []
    
    var body: some View {
        ZStack {
            backgroundColorView()
            VStack(spacing: 0) {
                Text("Select your spells")
                    .h5Font()
                    .foregroundColor(.white)
                Text("Choose 5 or less")
                    .cap2Font()
                    .foregroundColor(.g3Color)
                    .padding(.top, 6)
                List {
                    ForEach(Array(spellList.enumerated()), id: \.offset) { index, defaultSpell in
                        if defaultSpell.isDefault {
                            spellListRow(title: defaultSpell.message, isSelected: spellList[index].isSelected)
                                .padding(.vertical)
                                .onTapGesture {
                                    toggleSpellSelectedState(index: index)
                                }
                        }
                    }
                    ForEach(Array(spellList.enumerated()), id: \.offset) { index, customSpell in
                        if !customSpell.isDefault {
                            spellListRow(title: customSpell.message, isSelected: spellList[index].isSelected)
                                .padding(.vertical)
                                .onTapGesture {
                                    toggleSpellSelectedState(index: index)
                                }
                        }
                    }
                    .onDelete(perform: deleteCustomSpell)
                    spellAddButton()
                        .onTapGesture {
                            withAnimation {
                                showInputSheet.toggle()
                            }
                        }
                }
                .scrollContentBackground(.hidden)
                .environment(\.defaultMinListRowHeight, 52)
            }
        }
        .sheet(isPresented: $showInputSheet) {
            InputModalView(appendList: $spellList)
                .presentationDetents([.height(239)])
                .presentationDragIndicator(.visible)
        }
    }
    
    private func spellListRow(title: String, isSelected: Bool) -> some View {
        Text("dfedfwefwedfdfdfdfdfdfdfdfdfdfdfdfdfd")
            .foregroundColor(.clear)
             .listRowBackground (
                 RoundedRectangle(cornerRadius: 20)
                    .fill(isSelected ? Color.white : Color.g1Color)
                     .frame(width: 350, height: 52)
                     .overlay(
                         Text(title)
                            .foregroundColor(isSelected ? .bgColor : .white)
                             .cap3Font()
                     )
             )
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
    // ✅ functions for custom delete button of the List Items
    private func onChange(value: DragGesture.Value) {
        
    }
    private func onEnd(value: DragGesture.Value) {
        
    }
    
    //vm
    private func deleteCustomSpell(index: IndexSet) {
        spellList.remove(atOffsets: index)
    }
    
    private func toggleSpellSelectedState(index: Int) {
        guard selectedSpellList.count < 5 || spellList[index].isSelected else { return }
            spellList[index].isSelected.toggle()
            if spellList[index].isSelected {
                selectedSpellList.append(spellList[index].message)
            } else { // !spellList[index].isSelected
                let idx = selectedSpellList.lastIndex(of: spellList[index].message) ?? 0
                print("delete => \(idx)")
                selectedSpellList.remove(at: idx)
            }
    
        print(selectedSpellList)
    }
}

struct SellectSpellView_Previews: PreviewProvider {
    static var previews: some View {
        SellectSpellView()
    }
}
