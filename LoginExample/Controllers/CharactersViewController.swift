//
//  CharactersViewController.swift
//  LoginExample
//
//  Created by User on 2/11/18.
//  Copyright © 2018 dikan.chen. All rights reserved.
//

import UIKit
struct Feature:Decodable{
    let name:String
    let height:String
    let mass:String
    let hair_color:String
    let skin_color:String
    let eye_color:String
    let birth_year:String
    let gender:String
    let homeworld:String
}

class CharactersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var heroimg: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var characterarr = [Feature]()
    let url_img = URL(string:imgStr[myIndex])
    var apiURL = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let session = URLSession(configuration: .default)
        let getImageFromUrl = session.dataTask(with: url_img!){ (data, response, error) in
            if let e = error{
                print("Error:\(e)")
            }
            else{
                if (response as? HTTPURLResponse) != nil{
                    if let imageData = data{
                        let image = UIImage(data: imageData)
                        DispatchQueue.main.async {
                            self.heroimg.image = image
                        }
                    }else{
                        print("no image found")
                    }
                }else{
                    print("no response from server")
                }
            }
        }
        getImageFromUrl.resume()
        
        if myIndex < 17{
            apiURL = "\(myIndex+1)"
        }else{
            apiURL = "\(myIndex+2)"
        }
        guard let url = URL(string:"https://swapi.co/api/people/\(apiURL)/") else{return}
        URLSession.shared.dataTask(with: url){(data,response,error) in
            guard let data = data else{return}
            do{if error == nil{
                self.characterarr = try
                    [JSONDecoder().decode(Feature.self, from: data)]
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                //}
                }
                
            }catch let jsonErr{
                print("Error",jsonErr)
            }
            }.resume()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterarr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! mainTableViewCell
        cell.nameLabel.text = "Name: \(characterarr[indexPath.row].name)"
        cell.heightLabel.text = "Height: \(characterarr[indexPath.row].height)"
        cell.massLabel.text = "Height: \(characterarr[indexPath.row].mass)"
        cell.hairLabel.text = "Hair Color: \(characterarr[indexPath.row].hair_color)"
        cell.skinLabel.text = "Skin Color: \(characterarr[indexPath.row].skin_color)"
        cell.eyeLabel.text = "Eye Color: \(characterarr[indexPath.row].eye_color)"
        cell.birthLabel.text = "Birth year: \(characterarr[indexPath.row].birth_year)"
        cell.genderLabel.text = "Gender: \(characterarr[indexPath.row].gender)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
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
