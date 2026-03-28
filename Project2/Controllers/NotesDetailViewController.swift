//
//  NotesDetailViewController.swift
//  Project2
//
//  Created by Bassir, Adrian on 3/27/26.
//

import UIKit

class NoteDetailViewController: UIViewController {
    
    var notes: [Note] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Note Detail"
    }
    
    func saveNotes() {
        if let data = try? JSONEncoder().encode(notes) {
            UserDefaults.standard.set(data, forKey: "notes")
        }
    }
    
    func loadNotes() {
        if let data = UserDefaults.standard.data(forKey: "notes") {
            if let savedNotes = try? JSONDecoder().decode([Note].self, from: data) {
                notes = savedNotes
            }
        }
    }
}
