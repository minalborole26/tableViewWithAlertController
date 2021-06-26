//
//  ViewController.swift
//  tableViewWithAlertController
//
//  Created by minal borole on 26/06/21.
//

import UIKit

class ViewController: UIViewController {
    var cityArray = ["Nashik","jalgaon","salve","usmanabd","Agra"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func prepareAlert(){
        let alert = UIAlertController(title: "Edit Title", message: "Message send", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (act) in
            
        }))
        
        alert.addAction(UIAlertAction(title: "No", style: .destructive, handler: { act in
            
        }))
        
        self.present(alert, animated: true, completion: nil)
    }


}

extension ViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = cityArray[indexPath.row]
        return cell!
    }
    
    
    
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let editAction = UIContextualAction(style: .normal, title: "Edit") { (editAct, view, nil) in
            print("edit button tabbed")
           // self.prepareAlert()
            
            let ac = UIAlertController(title: "Edit City", message: "", preferredStyle: .alert)
            ac.addTextField(configurationHandler: nil)
            
            let submit = UIAlertAction(title: "Submit", style: .default) { act in
                let ans = ac.textFields?[0].text
                tableView.beginUpdates()
                self.cityArray[indexPath.row] = ans!
                tableView.reloadData()
                tableView.endUpdates()
            }
            ac.addAction(submit)
            
            self.present(ac, animated: true, completion: nil)
            
            
            
        }
        
        
        
        return UISwipeActionsConfiguration(actions: [editAction])
    }
    
    
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { (deletAct, view, nil) in
            print("delete button tabbed")
            tableView.beginUpdates()
            self.cityArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
    
}
