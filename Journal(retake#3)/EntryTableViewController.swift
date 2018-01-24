//
//  EntryTableViewController.swift
//  Journal(retake#3)
//
//  Created by Jacob Metcalf on 1/23/18.
//  Copyright © 2018 JfMetcalf. All rights reserved.
//

import UIKit

class EntryTableViewController: UITableViewController {

    @IBOutlet var entryTableView: UITableView!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        entryTableView.reloadData()
    }
    
    //____________________________\/____________________________
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        entryTableView.reloadData()
    }
    //____________________________/\____________________________
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EntryController.shared.entries.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "entryCell", for: indexPath)
        // Configure the cell...
        // Select the item the user presses
        let selectedEntry = EntryController.shared.entries[indexPath.row]
        // “Configure the cell…”
        cell.textLabel?.text = selectedEntry.title
        // Return the cell
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
//        var entryPath = EntryController.shared.entries[indexPath.row]
//        if editingStyle == .delete {
//            tableView.deleteRows(at: [indexPath], with: .fade)
////            entryTableView.deleteSections(editingStyle, with: .fade)
//        }              NEED HELP!!!
//    }

    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toUpdateEntry" {
            // CHECK the destination
            guard let detailVC = segue.destination as? EntryDetailViewController else { return }
            // CHECK the selected item
            guard let IndexPath = entryTableView.indexPathForSelectedRow else { return }
            // Get the item[indexPath]
            let selectedEntry = EntryController.shared.entries[IndexPath.row]
            // Pass the selected item to detailVC
            detailVC.entry = selectedEntry
        }
    }

}
