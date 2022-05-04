//
//  AddItemTableViewController.swift
//  Checklists01
//
//  Created by ASDiMac1 on 25/04/22.
//

import UIKit

class AddItemTableViewController: UITableViewController {
    var item: ChecklistItem?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        if let item = item {
            if item.remindMe {
                return 3
        }else{
        return 2
    }
        }else{
            return 3
        }
        }
        override func tableView(_ tableView: UITableView,     numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TextFieldCell", for: indexPath) as! TextFieldTableViewCell
            if let item = item {
                cell.addTextField.text = item.name
            }
            return cell
        }
        if  indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SwitchCell", for: indexPath) as! SwitchTableViewCell
            cell.SwitchCell.setOn(item?.remindMe ?? false, animated: true)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DateCell", for: indexPath) as! DateTableViewCell
            if let item = item, let date = item.dueDate {
                cell.DateCell.setDate(date, animated: true)
            }
            return cell
        }
    }
}
