//
//  ViewController.swift
//  Checklists01
//
//  Created by ASDiMac1 on 15/04/22.
//

import UIKit

class MainViewContriller: UITableViewController {
    
    let groups: [CheckListGroup] = [
        CheckListGroup (title: "Birthdays", imageName: "Birthdays", items: [ChecklistItem(isChecked: true, name: "My 20th birthday",remindMe: false, dueDate: nil)]),
        CheckListGroup(title: "Groceries", imageName: "Groceries", items: [//ChecklistItem(isChecked: true, name: "Shirchoy",remindMe:true, dueDate:Date())
                                                                          ]),
        CheckListGroup(title: "To do", imageName: "Chores", items: [ChecklistItem(isChecked: true, name: "See Parvina", remindMe:false, dueDate:Date())]),
        CheckListGroup(title: "Business Stuff", imageName: "Folder", items: [ChecklistItem(isChecked: true, name: "Eat chokolate", remindMe:false, dueDate:nil)])
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "MainToGroupDetails"{
            if let vc = segue.destination as? GroupDetailsTableViewController{
                if let indexPath = tableView.indexPathsForSelectedRows?.first {
                   vc.items = groups[indexPath.row].items
        }
    }
}

    }
}
