//
//  ViewController.swift
//  Checklists01
//
//  Created by ASDiMac1 on 15/04/22.
//

import UIKit

class MainViewContriller: UITableViewController, GroupDetailsProtocol {
    
    //MARK: - GroupDetailsProtocol
    
    func didDeleteItem(at index: Int, with groupTitle: String) {
        for (groupIndex, group)  in groups.enumerated() {
            if group.title == groupTitle{
                groups[groupIndex].items.remove(at: index)
                tableView.reloadData()
            }
        }
    }
    
    
    //MARK: - Data lair
    
        var groups: [CheckListGroup] = [
        CheckListGroup (title: "Birthdays", imageName: "Birthdays", items: [ChecklistItem(isChecked: true, name: "My 20th birthday",remindMe: false, dueDate: nil)]),
        CheckListGroup(title: "Groceries", imageName: "Groceries", items: [//ChecklistItem(isChecked: true, name: "Shirchoy",remindMe:true, dueDate:Date())
                                                                          ]),
        CheckListGroup(title: "To do", imageName: "Chores", items: [ChecklistItem(isChecked: true, name: "See Parvina", remindMe:false, dueDate:Date())]),
        CheckListGroup(title: "Business Stuff", imageName: "Folder", items: [ChecklistItem(isChecked: true, name: "Eat chokolate", remindMe:false, dueDate:nil)])
    ]
    // MARK: - Life cycle View  controler-a
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //MARK: - the source of information for table
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let group = groups[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "GroupCell", for: indexPath) as! GroupTableViewCell
        cell.titleLabel.text = group.title
        
        cell.iconView.image = UIImage(named:group.imageName)
        cell.subtitleLabel.text = group.getRemainings()
        return cell
        
    }
    //MARK: - processng of  segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainToGroupDetails"{
            if let vc = segue.destination as? GroupDetailsTableViewController{
                if let indexPath = tableView.indexPathsForSelectedRows?.first {
                   vc.group = groups[indexPath.row]
                    vc.delegate = self
        }
    }
}
//        //MARK: - processing of delegation of table or UITableViewDelegate
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//            print("tap on cage \(indexPath.row)")
//        }
//    override func tableView(_ tableView : UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath0) {
//
//            // delete the info from array
//        groups.remove(at: indexPath.row)
//        // delet the cell from table
//        tableView.deleteRows(at: [indexPath], with: automatic )
//        }
  }
}
