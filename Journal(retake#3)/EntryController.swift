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
    
    init() {
        loadFromPersistentStorage()
    }
    
    static var shared = EntryController()
    
    func addEntryWith(title: String, text: String) {
        let newEntry = Entry(title: title, bodyText: text)
        entries.append(newEntry)
        saveToPersistentStorage()
    }
    
    func remove(entry: Entry) {
        guard let index = entries.index(of: entry) else { return }
        entries.remove(at: index)
        saveToPersistentStorage()
    }
    //__________________________\/__________________________
    func update(entry: Entry, title: String, text: String) {
        let existingEntry = Entry(title: title, bodyText: text)
        guard let index = entries.index(of: entry) else { return }
        entries[index] = existingEntry
        saveToPersistentStorage()
    }
    //__________________________/\__________________________
    
//    private func fileURL() -> URL {
//        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        let fileName = "journal.json"
//        let documentsDirectoryURL = urls[0].appendingPathComponent(fileName)
//        return documentsDirectoryURL
//    }
    
    // NOT SURE IF THESE COMMENTS ARE THE CORRECT WAY OF EXPLAINING THE STEPS...
    private func fileURL() -> URL {
        // Get the default way of looking for the file/URL
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        // Create the file
        let fileName = "journal.json"
        // Add the file name to the documents URL directory
        let documentsDirectoryURL = urls[0].appendingPathComponent(fileName)
        // Return the URL
        return documentsDirectoryURL
    }
    
    
    func saveToPersistentStorage() {
        let jsonEncoder = JSONEncoder()
        do {
            let data = try jsonEncoder.encode(entries)
            try data.write(to: fileURL())
        } catch {
            let e = error
            print("Error encoding the entry: \(e)")
        }
    }
    
    func loadFromPersistentStorage() {
        let jsonDecoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let entries = try jsonDecoder.decode([Entry].self, from: data)
            self.entries = entries
        } catch {
            let e = error
            print("Error decoding the entry : \(e)")
        }
    }
}


