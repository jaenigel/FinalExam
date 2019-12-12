//
//  ToDoTableViewController.swift
//  ToDoListAssignment
//
//  Created by Jae Nigel Miranda on 2019-12-04.
//  Student ID: 301106338
//  Description: Table View of list of to dos
//  Copyright © 2019 Jae Nigel Miranda. All rights reserved.
//

import UIKit

class PersonalViewController: UITableViewController {
    
    var records : [RecordsCore] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getRecords()
    }
    
    func getRecords()//Fetches from data core
    {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        {
            if let coreDatarecords = try? context.fetch(RecordsCore.fetchRequest()) as? [RecordsCore]
            {
               
                records = coreDatarecords
                tableView.reloadData()
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return records.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let record = records[indexPath.row]
        
        cell.textLabel?.text = "BMI: " +  String(record.bmi) + "   Weight: " + String(record.weight) + "   Date: " + record.date!
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = records[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: toDo)
    }
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddToDoViewController
        {
            addVC.previousVC = self
        }
        
        if let completeVC = segue.destination as? CompleteViewController
        {
            if let toDo = sender as? RecordsCore            {
                completeVC.selectedToDo = toDo
                completeVC.previousVC = self
            }
            
        }
    }*/
    
}
