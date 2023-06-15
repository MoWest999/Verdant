//
//  TrackerViewModel.swift
//  Verdant
//
//  Created by Mason Christeerfield on 6/12/23.
//

import Foundation

class TrackerViewModel: ObservableObject {
    @Published var compostEntries = [CompostEntry]()
    @Published var isShowingAddCompostView = false
    @Published var isShowingCommpostEntriesListView = false
    
    @Published var isShowingFaqView = false
    @Published var isShowingSettingsView = false
    @Published var isShowingChangeCompostAlert = false
    
    func addCompostEntry(amount: Double) {
        let newCompostEntry = CompostEntry(amount: amount)
        compostEntries.append(newCompostEntry)
        saveCompostEntries()
    }
    
    func saveCompostEntries() {
        DirectoryService.writeModelToDisk(compostEntries)
    }
    
    func loadCompostEntry() {
        do {
            self.compostEntries = try DirectoryService.readModelFromDisk()
        } catch {
            self.compostEntries = compostEntries
        }
    }
    
    init() {
        loadCompostEntry()
    }
}


