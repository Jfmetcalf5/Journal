//
//  EntryDetailViewController.swift
//  Journal(retake#3)
//
//  Created by Jacob Metcalf on 1/23/18.
//  Copyright © 2018 JfMetcalf. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {

    var entry: Entry?
    
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateViews()
        updateUI()
    }
    
    //_______________________________\/_______________________________
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let title = titleTextField.text, title != "",
            let text = bodyTextView.text, text != "" else { return }
        guard let entry = entry else {
            EntryController.shared.addEntryWith(title: title, text: text)
            navigationController?.popViewController(animated: true)
            return }
        EntryController.shared.update(entry: entry, title: title, text: text)
        navigationController?.popViewController(animated: true)
        
    }
    // Make sure the title and text fields aren't empty
    
    // If there is an entry, update it
    


    //_______________________________/\_______________________________
    
    func updateUI() {
        bodyTextView.layer.borderWidth = 2
        bodyTextView.layer.borderColor = UIColor.lightGray.cgColor
        view.backgroundColor = .lightGray
    }
    
    //_________________\/_________________
    func updateViews() {
        // If an entry exists, then update views
        guard let entry = entry else { return }
            titleTextField.text = entry.title
            bodyTextView.text = entry.title
    }
    //_________________/\_________________
}
