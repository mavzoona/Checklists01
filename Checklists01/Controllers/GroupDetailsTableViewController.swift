//
//  GroupDetailsTableViewController.swift
//  Checklists01
//
//  Created by ASDiMac1 on 22/04/22.
//

import UIKit

class GroupDetailsTableViewController: UITableViewController {
    var group: CheckListGroup!
    var delegate: GroupDetailsProtocol? 
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return group.items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItemCell", for: indexPath) as! ItemsTableViewCell
        let item = group.items[indexPath.row]
        cell.ItemLabel.text = item.name
        cell.CheckMark.isHidden = item.isChecked

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GroupDetailsToAddItem",
             let vc = segue.destination as? AddItemTableViewController,
           let indexPath = tableView.indexPathsForSelectedRows?.first {
            vc.title = "Edit item"
            vc.item = group.items[indexPath.row]
            //items[indexPath.row].name
        }
    }

        //MARK: - processing of delegation of table or UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("tap on cage \(indexPath.row)")
        }
    
    override func tableView(_ tableView : UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            
            // delete the info from array
        group.items.remove(at: indexPath.row)
        // delet the cell from table
        tableView.deleteRows(at: [indexPath], with: .automatic )
        //
        delegate?.didDeleteItem(at: indexPath.row, with: group.title)
    }
   

}
