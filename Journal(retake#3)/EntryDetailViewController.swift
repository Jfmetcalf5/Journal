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
        guard let title = titleTextField.text,
            let text = bodyTextView.text else { return }
        
        guard let unwrappedEntry = entry else {
            // there is no entry
            // creat a new entry
            EntryController.shared.addEntryWith(title: title, text: text)
            navigationController?.popViewController(animated: true)
            return
        }
        // there is an entry
        // update the entry
        EntryController.shared.update(entry: unwrappedEntry, title: title, text: text)
        navigationController?.popViewController(animated: true)
    }
    //_______________________________/\_______________________________
    
    func updateUI() {
        bodyTextView.layer.borderWidth = 2
        bodyTextView.layer.borderColor = UIColor.lightGray.cgColor
        view.backgroundColor = .lightGray
    }
    
    //_________________\/_________________
    func updateViews() {
        guard let entry = entry else {
            return
        }
        titleTextField.text = entry.title
        bodyTextView.text = entry.bodyText
    }
    //_________________/\_________________
}
