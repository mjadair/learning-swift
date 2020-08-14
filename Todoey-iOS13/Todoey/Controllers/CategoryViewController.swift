//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Michael Adair on 14/08/2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {


    
    var categories = [Category]()
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
         let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath)
        
             cell.textLabel?.text = categories[indexPath.row].name

             return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "goToItems", sender: self)
        print("ARRRRGHH!")
        
    }
    
    
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           let destinationVC = segue.destination as! ToDoListViewController
           
           if let indexPath = tableView.indexPathForSelectedRow {
               destinationVC.selectedCategory = categories[indexPath.row]
           }
       }
    
    
    @IBAction func addButtonPressed(_ sender: Any) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new category", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            
            let newCategory = Category(context: self.context)
            newCategory.name = textField.text!
            
            self.categories.append(newCategory)
            self.saveCategories()
            
        }
        
        alert.addAction(action)
        
        alert.addTextField { (field) in
            textField = field
            textField.placeholder = "Add a new category"
        }
        
        present(alert, animated: true, completion: nil)
        
        
    }
    
    
    func saveCategories() {
        
        do {
            try context.save()
        } catch {
            print("Errors \(error)")
        }
        
        tableView.reloadData()
   
    }
        
        func loadCategories() {
            
            let request: NSFetchRequest<Category> = Category.fetchRequest()
            
            do {
                 categories = try context.fetch(request)
            } catch {
                print("Errors loading \(error)")
            }
            
            tableView.reloadData()
            
        }
    
    

        


}
