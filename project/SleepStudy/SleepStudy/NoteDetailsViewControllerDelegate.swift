//
//  NoteDetailViewControllerDelegate.swift
//  Notes Clone
//
//  Created by Filza Mazahir on 1/25/16.
//  Copyright © 2016 Filza Mazahir. All rights reserved.
//

import Foundation
protocol NoteDetailsViewControllerDelegate: class {
    
    func noteDetailsViewController(_ controller: NoteDetailsViewController, didFinishAddingNote noteContent: String) -> Note
    
    func noteDetailsViewController(_ controller: NoteDetailsViewController, didFinishEditingNote note: Note, editedNote: String)
    
    
}
