//
//  NoteDetailsViewController.swift
//  Notes Clone
//
//  Created by Filza Mazahir on 1/25/16.
//  Copyright © 2016 Filza Mazahir. All rights reserved.
//

import UIKit
class NoteDetailsViewController: UITableViewController, UITextViewDelegate {
    
    weak var delegate: NoteDetailsViewControllerDelegate?
    weak var backButtonDelegate: BackButtonDelegate?
    var noteToEdit: Note?
    
    @IBOutlet weak var NewNoteTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.NewNoteTextView.delegate = self
        
        if let currentNote = noteToEdit {
            NewNoteTextView.text = currentNote.noteContent
        }
 
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textViewDidChange(_ textView: UITextView) {

        if let note = noteToEdit {
            delegate?.noteDetailsViewController(self, didFinishEditingNote: note, editedNote: NewNoteTextView.text!)
            print("in editing mode: \(NewNoteTextView.text)")
            
        }
            
        else {
            noteToEdit = delegate?.noteDetailsViewController(self, didFinishAddingNote: NewNoteTextView.text!)
            print("in saving new note mode: \(NewNoteTextView.text)")
            
        }
        
    }
    

    
    @IBAction func backButtonPressed(_ sender: Any) {
        
        let memo:Memo = Memo(content: NewNoteTextView.text, type: "default", time: curTime)
        curRecord!.memos += [memo]
        backButtonDelegate?.backButtonPressedFrom(self)
    }
    

}
