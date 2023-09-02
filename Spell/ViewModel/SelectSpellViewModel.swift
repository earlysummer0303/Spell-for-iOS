

import SwiftUI

class SelectSpellViewModel : ObservableObject {
    
    // UserDefault Keys
    private let listKey = "global_spell_list"
    private let selectedListKey = "global_selected_spell_list"
    private let finalListKey = "global_final_selected_spell_list"
    
    @Published var spellList: [Spell] = [
        Spell(message: "I am an irreplaceable person", isDefault: true, isSelected: false),
        Spell(message: "I can overcome anything", isDefault: true, isSelected: false),
        Spell(message: "I am grateful for my life", isDefault: true, isSelected: false),
        Spell(message:  "I am an influential person", isDefault: true, isSelected: false),
        Spell(message:  "I have the choice of my work", isDefault: true, isSelected: false),
        Spell(message:  "I am not afraid of challenges", isDefault: true, isSelected: false),
    ] {
        didSet {
            saveSpellLists()
        }
    }
    
    @Published var selectedSpellList: [String] = [] {
        didSet {
            saveSelectedSpellList()
        }
    }
    
    @Published var finalSelectedSpellList: [String] = []
    
    init(){
        getList()
        print(selectedSpellList)
    }
    
    // get
    
    func getList() {
        // get spellList from UserDefault
        guard
            // get spellList from UserDefault
            let spellListData = UserDefaults.standard.data(forKey: listKey),
            let savedspellListData = try? JSONDecoder().decode([Spell].self, from: spellListData),
            // get selectedSpellList from UserDefault
            let savedSelectedSpellListData = UserDefaults.standard.array(forKey: selectedListKey) as? [String]
        else { return }
        
        self.spellList = savedspellListData
        self.selectedSpellList = savedSelectedSpellListData
    }
    
    // delete
    func deleteCustomSpell(indeset: IndexSet) {
        // 만약 지우려는 cell이 selected 된 경우, 이를 selectedList에서 먼저 지워줘야.
        for index in indeset {
            if let idx = selectedSpellList.lastIndex(of: spellList[index].message) {
                print("delete => \(idx)")
                selectedSpellList.remove(at: idx)
            }
        }
        spellList.remove(atOffsets: indeset)
        print(selectedSpellList)
    }
    
    // update
    func toggleSpellSelectedState(index: Int) {
        guard selectedSpellList.count < 5 || spellList[index].isSelected else { return }
            spellList[index].isSelected.toggle()
            if spellList[index].isSelected {
                selectedSpellList.append(spellList[index].message)
            } else { // !spellList[index].isSelected
                guard let idx = selectedSpellList.lastIndex(of: spellList[index].message) else { return }
                print("delete => \(idx)")
                selectedSpellList.remove(at: idx)
            }
    
        print(selectedSpellList)
    }
    
    // save - selectedSpellList와 spellList를 둘 다 한번에 UserDefault를 사용해 저장.
    func saveSpellLists() {
        // spellList - 커스텀 타입을 저장하므로, JSONEncoder를 활용해 Encode 해서 저장.
        if let encodedData = try? JSONEncoder().encode(spellList) {
            UserDefaults.standard.set(encodedData, forKey: listKey)
        }
    }
    
    func saveSelectedSpellList(){
        // selectedSpellList
        UserDefaults.standard.set(selectedSpellList, forKey: selectedListKey)
    }
    
    // send => MainView로 Send 하는 함수.
    func addFinalList() {
        self.finalSelectedSpellList = self.selectedSpellList
    }
    
    func saveFinalList() {
        UserDefaults.standard.set(finalSelectedSpellList, forKey: finalListKey)
    }
    
    func sendFinalListData() {
        addFinalList()
        saveFinalList()
        print("FinalListData Saved!")
        print(self.finalSelectedSpellList)
    }
    
    func getFinalList() {
        guard let savedFinalSelectedSpellListData = UserDefaults.standard.array(forKey: finalListKey) as? [String] else {return}
        self.finalSelectedSpellList = savedFinalSelectedSpellListData
    }
    
}
