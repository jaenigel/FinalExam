//
//  AddToDoViewController.swift
//  ToDoListAssignment
//
//  Created by Jae Nigel Miranda on 2019-12-04.
//  Student ID: 301106338
//  Description: View Controller of the AddToDos
//  Copyright © 2019 Jae Nigel Miranda. All rights reserved.
//

import UIKit

class AddToDoViewController: UIViewController {

    var previousVC = ToDoTableViewController()
    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var importantSwitch: UISwitch!
    @IBOutlet weak var notesTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func addTapped(_ sender: Any) { //Saves new To Do
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        {
        
        let toDo =  ToDoCore(entity: ToDoCore.entity(), insertInto: context)
            
            if let titleText = titleTextField.text
            {
                toDo.name = titleText
                toDo.important = importantSwitch.isOn
                toDo.notes = notesTextField.text
            }
            
            try? context.save()
            
            navigationController?.popViewController(animated: true)
            
        }
    }
}
