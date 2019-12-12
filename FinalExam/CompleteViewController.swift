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

    var persons : [PersonCore] = []
    var bmi = Double(0.0)
    
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var bmiLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getPersonalInfo()
    }
    
    func getPersonalInfo()//Fetches from data core
    {
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        {
            if let coreDataPerson = try? context.fetch(PersonCore.fetchRequest()) as? [PersonCore]
            {
                //let theToDos = coreDataToDos
                //print(coreDataToDos.first?.name!)
                //toDos = coreDataToDos
                //tableView.reloadData()
                
                persons = coreDataPerson
                
                if(persons[0].name != nil)
                {
                nameTextField.text = persons[0].name
                ageTextField.text = String(persons[0].age)
                genderTextField.text = persons[0].gender
                weightTextField.text = String(persons[0].weight)
                heightTextField.text = String(persons[0].height)
                }
            }
        }
    }
    
    @IBAction func saveTapped(_ sender: UIButton) {
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
            {
            
            let person =  PersonCore(entity: PersonCore.entity(), insertInto: context)
                
                if let titleText = nameTextField.text
                {
                    person.name = titleText
                    person.age = Int16(ageTextField.text!)!
                    person.gender = genderTextField.text
                    person.weight = Double(weightTextField.text!)!
                    person.height = Double(heightTextField.text!)!
                }
                
                
                let record =  RecordsCore(entity: RecordsCore.entity(), insertInto: context)
                
                
                let date = Date()
                let formatter = DateFormatter()
                formatter.dateFormat = "dd.MM.yyyy"
                let result = formatter.string(from: date)
                
                record.bmi = bmi
                record.weight = Double(weightTextField.text!)!
                record.date = result
                
            
                try? context.save()
            }
        }
    
    
    @IBAction func computeTapped(_ sender: Any) {
        var category = ""
        bmi = Double(weightTextField.text!)! / ((Double(heightTextField.text!)!) * Double(heightTextField.text!)!)
        if(bmi < 16){
            category = "Severe Thinness"}
        else if(bmi >= 16 && bmi <= 17){
            category = "Moderate Thinness"}
        else if(bmi >= 17 && bmi <= 18.5){
            category = "Mild Thinness"}
        else if(bmi >= 18.5 && bmi <= 25){
            category = "Normal"}
        else if(bmi >= 25 && bmi <= 30){
            category = "Overweight"}
        else if(bmi >= 30 && bmi <= 35 ){
            category = "Obese Class I"}
        else if(bmi >= 35 && bmi <= 40){
            category = "Obese Class II"}
        else if(bmi >= 40){
            category = "Obese Class III"}
        
        bmiLabel.text = String(bmi) + "Category:  " + category
        
    }
    
}
