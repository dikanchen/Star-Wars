//
//  PlanetViewController.swift
//  LoginExample
//
//  Created by User on 2/12/18.
//  Copyright © 2018 dikan.chen. All rights reserved.
//

import UIKit
struct home:Decodable{
    let homeworld:String
}
struct planet:Decodable{
    let name:String
    let rotation_period:String
    let orbital_period:String
    let diameter:String
    let climate:String
    let gravity:String
    let terrain:String
    let surface_water:String
    let population:String
}

class PlanetViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var planetarr = [planet]()
    var apiURL = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if myIndex < 17{
            apiURL = "\(myIndex+1)"
        }else{
            apiURL = "\(myIndex+2)"
        }
        guard let url = URL(string:"https://swapi.co/api/people/\(apiURL)/") else{return}
        URLSession.shared.dataTask(with: url){(data,response,error) in
            guard let data = data else{return}
            do{if error == nil{
                let homesarray = try
                    JSONDecoder().decode(home.self, from: data)
                //for mainarr in self.weightarr{
                print(homesarray.homeworld)
                var url1 = ""
                url1 = homesarray.homeworld
                guard let newurl = URL(string:url1) else{return}
                URLSession.shared.dataTask(with: newurl){(data,response,error) in
                    guard let newdata = data else{return}
                    do{if error == nil{
                        self.planetarr = try
                            [JSONDecoder().decode(planet.self, from: newdata)]
                        //for mainarr in self.weightarr{
                        for mainarr in self.planetarr{
                            print(mainarr.name,";", mainarr.population)
                        }
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                            //}
                        }
                        
                    }catch let jsonErr{
                        print("Error",jsonErr)
                    }
                    }.resume()
                
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
        return self.planetarr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! thirdTableViewCell
        cell.name.text = "Name: \(planetarr[indexPath.row].name)"
        cell.rotation.text = "Rotation Period: \(planetarr[indexPath.row].rotation_period)"
        cell.orbital.text = "Orbital Period: \(planetarr[indexPath.row].orbital_period)"
        cell.diameter.text = "Diameter: \(planetarr[indexPath.row].diameter)"
        cell.climate.text = "Climate: \(planetarr[indexPath.row].climate)"
        cell.gravity.text = "Gravity: \(planetarr[indexPath.row].gravity)"
        cell.terrain.text = "Terrain: \(planetarr[indexPath.row].terrain)"
        cell.water.text = "Surface Water: \(planetarr[indexPath.row].surface_water)"
        cell.population.text = "Population: \(planetarr[indexPath.row].population)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
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
