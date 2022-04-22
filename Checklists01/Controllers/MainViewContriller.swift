//
//  ViewController.swift
//  Checklists01
//
//  Created by ASDiMac1 on 15/04/22.
//

import UIKit

class MainViewContriller: UITableViewController {
    
    let groups: [CheckListGroup] = [
        CheckListGroup (title: "Birthdays", imageName: "Birthdays"),
        CheckListGroup(title: "Groceries", imageName: "Groceries"),
        CheckListGroup(title: "To do", imageName: "Chores"),
        CheckListGroup(title: "Business Stuff", imageName: "Folder")
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
      
        return cell
        
    }
}

