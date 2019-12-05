//
//  CompleteViewController.swift
//  ToDoListAssignment
//
//  Created by Jae Nigel Miranda on 2019-12-04.
//  Student ID: 301106338
//  Description: View Controller of the Complete To Do
//  Copyright © 2019 Jae Nigel Miranda. All rights reserved.
//

import UIKit

class CompleteViewController: UIViewController {

    var previousVC = ToDoTableViewController()
    var selectedToDo : ToDoCore?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var notesLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = selectedToDo?.name
        notesLabel.text = selectedToDo?.notes
    }   

    @IBAction func completeTapped(_ sender: Any) { //Deletes from Core Data
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        {
            if let theToDo = selectedToDo
            {
                context.delete(theToDo)
                try? context.save()
                navigationController?.popViewController(animated: true)
                
            }
            
        }
        
    }
}
