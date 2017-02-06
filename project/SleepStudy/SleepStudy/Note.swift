//
//  Note.swift
//  Notes Clone
//
//  Created by Filza Mazahir on 1/25/16.
//  Copyright © 2016 Filza Mazahir. All rights reserved.
//

import Foundation

class Note: NSObject, NSCoding {
    static var key: String = "Notes"
    static var schema: String = "NotesList"
    var noteContent: String
    var createdAt: Date
    var updatedAt: Date
    

    init(content: String) {
        noteContent = content
        createdAt = Date()
        updatedAt = Date()
    }
    
    // MARK: - NSCoding protocol
    // used for encoding (saving) objects
    func encode(with aCoder: NSCoder) {
        aCoder.encode(noteContent, forKey: "noteContent")
        aCoder.encode(createdAt, forKey: "createdAt")
        aCoder.encode(createdAt, forKey: "updatedAt")
    }
    
    
    // used for decoding (loading) objects
    required init?(coder aDecoder: NSCoder) {
        noteContent = aDecoder.decodeObject(forKey: "noteContent") as! String
        createdAt = aDecoder.decodeObject(forKey: "createdAt") as! Date
        updatedAt = aDecoder.decodeObject(forKey: "updatedAt") as! Date
        super.init()
    }
    
    // MARK: - Queries
    static func all() -> [Note] {
        var notes = [Note]()
        let path = Database.dataFilePath("NotesList")
        if FileManager.default.fileExists(atPath: path) {
            if let data = try? Data(contentsOf: URL(fileURLWithPath: path)) {
                let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
                notes = unarchiver.decodeObject(forKey: Note.key) as! [Note]
                unarchiver.finishDecoding()
            }
        }
        if notes != [] {
            var noteListSorted = false
            while noteListSorted == false {
                noteListSorted = true // reset
                
                for  i in 0..<notes.count-1 {
              
                
                    print("First Date: \(notes[i].noteContent) updated at \(notes[i].updatedAt) and created at \(notes[i].createdAt), Second Date: \(notes[i+1].noteContent) updated at \(notes[i+1].updatedAt) and created at \(notes[i+1].createdAt)")
                    
//                if notes[i].createdAt.timeIntervalSinceReferenceDate <  notes[i+1].createdAt.timeIntervalSinceReferenceDate {
                
                    if notes[i].updatedAt.compare(notes[i+1].updatedAt) == ComparisonResult.orderedAscending {
                        print("date sorted: \(notes[i].noteContent) and \(notes[i+1].noteContent)")
                        let temp = notes[i]
                        notes[i] = notes[i+1]
                        notes[i+1] = temp
                        noteListSorted = false
                    }
                }
            }
        }
        
        return notes
    }
    
    func save() {
        var notesFromStorage = Note.all()
        var exists = false
        for i in 0..<notesFromStorage.count {
            if notesFromStorage[i].createdAt == self.createdAt {
                notesFromStorage[i] = self
                exists = true
            }
        }
        
        if !exists {
            notesFromStorage.append(self)
        }
        Database.save(notesFromStorage, toSchema: Note.schema, forKey: Note.key)
    }
    
    func edit(_ editedNote: String){
//        print (self.noteContent)
//        print (editedNote)
        var notesFromStorage = Note.all()
        for i in 0 ..< notesFromStorage.count {
            if notesFromStorage[i].createdAt == self.createdAt {
                notesFromStorage[i].noteContent = editedNote
                notesFromStorage[i].updatedAt = Date()
                print("\(notesFromStorage[i].noteContent) updated at \(notesFromStorage[i].updatedAt)")
                
            }
            Database.save(notesFromStorage, toSchema: Note.schema, forKey: Note.key)
        }
    }
    
    func deleteobject() {
        print("object deleted")
        var notesFromStorage = Note.all()
        for i in 0 ..< notesFromStorage.count {
            if notesFromStorage[i].createdAt == self.createdAt {
                notesFromStorage.remove(at: i)
                
            }
            Database.save(notesFromStorage, toSchema: Note.schema, forKey: Note.key)
        }
        
    }
    
    
}
