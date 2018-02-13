//
//  CodexViewController.swift
//  LoginExample
//
//  Created by User on 2/10/18.
//  Copyright © 2018 dikan.chen. All rights reserved.
//

import UIKit

var selectedIndex = [Int]()
var myIndex = 0

class CodexViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var people:[Item]?
    var cache = NSCache<AnyObject, AnyObject>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let item = Item(name:"",img:"")
        people = item.makeItems()
        
        print(people)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (people?.count)!
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        let item = people?[indexPath.row]
        cell.name.text = item?.nameStr
        
        if let img = cache.object(forKey: item?.nameStr as AnyObject){
            cell.imgView.image = img as! UIImage
        }
        else{
            DispatchQueue.global().async {
                let data = NSData(contentsOf:URL(string:(item?.imageStr)!)!)
                DispatchQueue.main.async{
                    cell.imgView.image = UIImage(data: data as! Data)
                    self.cache.setObject(UIImage(data: data as! Data)!, forKey: item?.nameStr as AnyObject)
                }
            }
        }
        // Configure the cell...
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == UITableViewCellAccessoryType.checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.none
        }
        else{
            tableView.cellForRow(at: indexPath)?.accessoryType = UITableViewCellAccessoryType.checkmark
        }
        selectedIndex.append(indexPath.row)
        myIndex = indexPath.row
        performSegue(withIdentifier: "segue", sender: self)
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
