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

class ToDoTableViewController: UITableViewController {
    
    var toDos : [ToDoCore] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getToDos()
    }
    
    func getToDos()//Fetches from data core
    {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        {
            if let coreDataToDos = try? context.fetch(ToDoCore.fetchRequest()) as? [ToDoCore]
            {
                //let theToDos = coreDataToDos
                //print(coreDataToDos.first?.name!)
                toDos = coreDataToDos
                tableView.reloadData()
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDos.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        
        let toDo = toDos[indexPath.row]
        
        if let name = toDo.name{
            
            if toDo.important
            {
                cell.textLabel?.text = "‼️" + name
            }
            else
            {
                cell.textLabel?.text = toDo.name
            }
            
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let toDo = toDos[indexPath.row]
        performSegue(withIdentifier: "moveToComplete", sender: toDo)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let addVC = segue.destination as? AddToDoViewController
        {
            addVC.previousVC = self
        }
        
        if let completeVC = segue.destination as? CompleteViewController
        {
            if let toDo = sender as? ToDoCore            {
                completeVC.selectedToDo = toDo
                completeVC.previousVC = self
            }
            
        }
    }
    
}
