//
//  CompleteViewController.swift
//  ToDoListAssignment
//
//  Created by Jae Nigel Miranda on 2019-12-04.
//  Copyright © 2019 Jae Nigel Miranda. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {

    var previousVC = ToDoTableViewController()
    var selectedToDo = ToDo()
    
    @IBOutlet weak var titleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = selectedToDo.name
    }   

    @IBAction func completeTapped(_ sender: Any) {
        
        var index = 0
        
        for toDo in previousVC.toDos
        {
            if toDo.name == selectedToDo.name
            {
                previousVC.toDos.remove(at: index)
                previousVC.tableView.reloadData()
                navigationController?.popViewController(animated: true)
                break
            }
            index += 1
        }
        
    }
}
