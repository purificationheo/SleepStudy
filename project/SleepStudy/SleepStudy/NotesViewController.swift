//
//  NotesViewController.swift
//  Notes Clone
//
//  Created by Filza Mazahir on 1/25/16.
//  Copyright © 2016 Filza Mazahir. All rights reserved.
//

import UIKit

class NotesViewController: UITableViewController, NoteDetailsViewControllerDelegate, BackButtonDelegate, UISearchBarDelegate, UISearchResultsUpdating {
    
    var searchController = UISearchController(searchResultsController: nil)
    var notes: [Note] = Note.all()
    var filteredNotes = [Note]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //MARK: Search bar functions
    func filterNotesForSearchText(_ searchText: String, scope: String = "All") {
        filteredNotes = notes.filter { note in
            return note.noteContent.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filterNotesForSearchText(searchController.searchBar.text!)
    }
    
    
    
       //MARK: Tableview overrides
       override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoteCell")!
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        // Filtering Notes 
        if searchController.isActive && searchController.searchBar.text != "" {
            cell.textLabel?.text = filteredNotes[indexPath.row].noteContent
            let filteredDateString = dateFormatter.string(from: filteredNotes[indexPath.row].createdAt as Date)
            cell.detailTextLabel?.text = filteredDateString
        }
        
        else {
            cell.textLabel?.text = notes[indexPath.row].noteContent
            
            let dateString = dateFormatter.string(from: notes[indexPath.row].createdAt as Date)
            cell.detailTextLabel?.text = dateString
        }
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // Filtering Notes
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredNotes.count
        }
        
        notes = Note.all()
        return notes.count
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "DetailsSegue", sender: tableView.cellForRow(at: indexPath))
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        // Filtering Notes
        if searchController.isActive && searchController.searchBar.text != "" {
            filteredNotes[indexPath.row].deleteobject()
        }
        else {
            notes[indexPath.row].deleteobject()
        }
       
        tableView.reloadData()
    }
    
    
    //MARK: Prepare for Segue
    
    @IBAction func composeNoteButtonPressed(_ sender: Any) {
    
    performSegue(withIdentifier: "DetailsSegue", sender: nil)
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "DetailsSegue" {
            
            let navigationController = segue.destination as! UINavigationController
            let controller = navigationController.topViewController as! NoteDetailsViewController
            controller.delegate = self
            controller.backButtonDelegate = self
            
            if sender != nil {
                 
                if let indexPath = tableView.indexPath(for: sender as! UITableViewCell) {
                    
                    //Filtering notes
                    if searchController.isActive && searchController.searchBar.text != "" {
                        controller.noteToEdit = filteredNotes[indexPath.row]
                        searchController.isActive = false
                        searchController.searchBar.text = ""
                    }
                    else {
                        controller.noteToEdit = notes[indexPath.row]
                    }
                    
                    
                    
                    
                }
            }
            
        }
        
    }
    
  
    
    //MARK : Delegate Functions
    func noteDetailsViewController(_ controller: NoteDetailsViewController, didFinishAddingNote noteContent: String) -> Note {
//        dismissViewControllerAnimated(true, completion: nil)
        print("in didFinishADDINGNote: \(noteContent)")
        let newNote = Note(content: noteContent)
        newNote.save()
        
        tableView.reloadData()
        
        return newNote
        
    }
    
    func noteDetailsViewController(_ controller: NoteDetailsViewController, didFinishEditingNote note: Note, editedNote: String) {
//        dismissViewControllerAnimated(true, completion: nil)
        print("in didFinishEDITINGNote: \(editedNote)")
        note.edit(editedNote)
        
        tableView.reloadData()
    }
    
    func backButtonPressedFrom(_ controller: UIViewController) {
        dismiss(animated: true, completion: nil)
        
    }



}

