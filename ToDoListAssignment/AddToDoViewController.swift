//
//  AddToDoViewController.swift
//  ToDoListAssignment
//
//  Created by Jae Nigel Miranda on 2019-12-04.
//  Copyright © 2019 Jae Nigel Miranda. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {

    var previousVC = ToDoTableViewController()
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func addTapped(_ sender: Any) {
        /*
        let toDo = ToDo()
        
        if let titleText = titleTextField.text
        {
            toDo.name = titleText
                   toDo.important = importantSwitch.isOn
                   
                   previousVC.toDos.append(toDo)
                   previousVC.tableView.reloadData()
                   
                   navigationController?.popViewController(animated: true)
        }
       */
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        {
        
        let toDo =  ToDoCore(entity: ToDoCore.entity(), insertInto: context)
            
            if let titleText = titleTextField.text
            {
                toDo.name = titleText
                toDo.important = importantSwitch.isOn
            }
            
            try? context.save()
            
            navigationController?.popViewController(animated: true)
            
        }
    }
}