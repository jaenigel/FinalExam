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

class AddRecordViewController: UIViewController {
    var persons : [PersonCore] = []
    var height = Double(0.0)
    var bmi = Double(0.0)
    @IBOutlet weak var weightTextField: UITextField!
    
    
    @IBAction func updatedTapped(_ sender: UIButton) {
        
        if let context1 = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        {
            if let coreDataPerson = try? context1.fetch(PersonCore.fetchRequest()) as? [PersonCore]
            {
                //let theToDos = coreDataToDos
                //print(coreDataToDos.first?.name!)
                //toDos = coreDataToDos
                //tableView.reloadData()
                
                persons = coreDataPerson
                
                //if(persons[0].name != nil)
                //{
                height = persons[0].height
                //}
            }
        }
        
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        {
        
        let rec =  RecordsCore(entity: RecordsCore.entity(), insertInto: context)
            
            if let weight = weightTextField.text
            {
                let date = Date()
                let formatter = DateFormatter()
                formatter.dateFormat = "dd.MM.yyyy"
                let result = formatter.string(from: date)
                
                rec.weight = Double(weight)!
                bmi = Double(weight)! / ((Double(height)) * Double(height))
                rec.bmi = bmi
                rec.date = result
                
            }
            
            try? context.save()
            
            navigationController?.popViewController(animated: true)
            
        }
    }
}
