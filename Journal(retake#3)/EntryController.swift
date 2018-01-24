//
//  EntryController.swift
//  Journal(retake#3)
//
//  Created by Jacob Metcalf on 1/23/18.
//  Copyright © 2018 JfMetcalf. All rights reserved.
//

import Foundation

class EntryController {
    
    var entries: [Entry] = []
    
    static var shared = EntryController()
    
    func addEntryWith(title: String, text: String) {
        let newEntry = Entry(title: title, bodyText: text)
        entries.append(newEntry)
    }
    
    func remove(entry: Entry) {
        guard let index = EntryController.shared.entries.index(of: entry) else { return }
        entries.remove(at: index)
    }
    
    func update(entry: Entry, title: String, text: String) {
        let existingEntry = Entry(title: title, bodyText: text)
        entry.title = existingEntry.title
        entry.bodyText = existingEntry.bodyText
    }
    
}
