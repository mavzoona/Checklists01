//
//  CheckListGroup.swift
//  Checklists01
//
//  Created by ASDiMac1 on 18/04/22.
//

import Foundation

struct CheckListGroup {
    let  title: String
    let imageName: String
    var items: [ChecklistItem]
    func getRemainings() -> String {
        // To Do
        //1.All done
        var isAllDone = true
        for item in items {
            if item.isChecked == false {
                isAllDone = false
            }
        }
        //2.(no items)
        if items.isEmpty{
            return "(No items)"
        } else if !isAllDone, items.count != 0 {
            return "\(items.count) Remaining"
        }
    if isAllDone {
        return "All Done"
    } else {
        return "Incorrect data"
    }
  }
}
