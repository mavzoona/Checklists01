//
//  ViewController.swift
//  Checklists01
//
//  Created by ASDiMac1 on 15/04/22.
//

import UIKit

class MainViewContriller: UITableViewController {
    
    let groups: [CheckListGroup] = [
        CheckListGroup (title: "Birthdays", imageName: "Birthdaypic"),
        CheckListGroup(title: "Groceries", imageName: "groceriespic"),
        CheckListGroup(title: "To do", imageName: "todotopic"),
        CheckListGroup(title: "Business Stuff", imageName: "pic")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groups.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let group: CheckListGroup = groups[indexPath.row]
        let cell = UITableViewCell()
        cell.textLabel?.text = group.title
        return cell
    }
}

