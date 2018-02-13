//
//  FavoriteViewController.swift
//  LoginExample
//
//  Created by User on 2/11/18.
//  Copyright © 2018 dikan.chen. All rights reserved.
//

import UIKit
import CoreData

class FavoriteViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var listItems = [String]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        for i in 0..<selectedIndex.count{
            let number = selectedIndex[i]
            listItems.append(namStr[number])
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let newCharacter = NSEntityDescription.insertNewObject(forEntityName: "Characters", into: context)
            newCharacter.setValue(listItems[i], forKey: "Name")
            do{
                try context.save()
            }
            catch{
                print("Error")
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = listItems[indexPath.row]
        return cell
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
