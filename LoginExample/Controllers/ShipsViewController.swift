//
//  ShipsViewController.swift
//  LoginExample
//
//  Created by User on 2/11/18.
//  Copyright © 2018 dikan.chen. All rights reserved.
//

import UIKit
struct ships:Decodable{
    let starships:[String]
}
struct shipname:Decodable{
    let name:String
    let model:String
    let manufacturer:String
    let cost_in_credits:String
    let length:String
    let max_atmosphering_speed:String
    let crew:String
    let passengers:String
    let cargo_capacity:String
    let consumables:String
    let hyperdrive_rating:String
    let MGLT:String
    let starship_class:String
    //let pilots:[String]
}
class ShipsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var shiparr = [shipname]()
    var apiURL = ""
    var urlstring = URL(string:"")
    //var shipsarray = [ships]()
    
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
                let shipsarray = try
                    JSONDecoder().decode(ships.self, from: data)
                //for mainarr in self.weightarr{
                print(shipsarray.starships)
                var array = [String]()
                array = shipsarray.starships
                for i in 0..<array.count{
                    print(array[i])
                    guard let newurl = URL(string:array[i]) else{return}
                    URLSession.shared.dataTask(with: newurl){(data,response,error) in
                        guard let newdata = data else{return}
                        do{if error == nil{
                            self.shiparr = try
                                [JSONDecoder().decode(shipname.self, from: newdata)]
                            //for mainarr in self.weightarr{
                            for mainarr in self.shiparr{
                                print(mainarr.name,";", mainarr.length)
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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.shiparr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! secondTableViewCell
        cell.name.text = "Name: \(shiparr[indexPath.row].name)"
        cell.model.text = "Model: \(shiparr[indexPath.row].model)"
        cell.manufacturer.text = "Manufacturer: \(shiparr[indexPath.row].manufacturer)"
        cell.cost.text = "Cost: \(shiparr[indexPath.row].cost_in_credits)"
        cell.length.text = "Length: \(shiparr[indexPath.row].length)"
        cell.speed.text = "Max Speed: \(shiparr[indexPath.row].max_atmosphering_speed)"
        cell.crew.text = "Crew: \(shiparr[indexPath.row].crew)"
        cell.passenger.text = "Passengers: \(shiparr[indexPath.row].passengers)"
        cell.cargo.text = "Cargo Capacity: \(shiparr[indexPath.row].cargo_capacity)"
        cell.consumable.text = "Consumables: \(shiparr[indexPath.row].consumables)"
        cell.rating.text = "Hyperdrive Rating: \(shiparr[indexPath.row].hyperdrive_rating)"
        cell.mglt.text = "MGLT: \(shiparr[indexPath.row].MGLT)"
        cell.shipclass.text = "Class: \(shiparr[indexPath.row].starship_class)"
        if shiparr[indexPath.row].name == "CR90 corvette"{
            urlstring = URL(string:shipstr[0])
        }else if shiparr[indexPath.row].name == "Star Destroyer"{
            urlstring = URL(string:shipstr[1])
        }else if shiparr[indexPath.row].name == "Sentinel-class landing craft"{
            urlstring = URL(string:shipstr[2])
        }else if shiparr[indexPath.row].name == "Death Star"{
            urlstring = URL(string:shipstr[3])
        }else if shiparr[indexPath.row].name == "Millennium Falcon"{
            urlstring = URL(string:shipstr[4])
        }else if shiparr[indexPath.row].name == "Y-wing"{
            urlstring = URL(string:shipstr[5])
        }else if shiparr[indexPath.row].name == "X-wing"{
            urlstring = URL(string:shipstr[6])
        }else if shiparr[indexPath.row].name == "TIE Advanced x1"{
            urlstring = URL(string:shipstr[7])
        }else if shiparr[indexPath.row].name == "Executor"{
            urlstring = URL(string:shipstr[8])
        }else if shiparr[indexPath.row].name == "Rebel transport"{
            urlstring = URL(string:shipstr[9])
        }else if shiparr[indexPath.row].name == "Slave 1"{
            urlstring = URL(string:shipstr[10])
        }else if shiparr[indexPath.row].name == "Imperial shuttle"{
            urlstring = URL(string:shipstr[11])
        }else if shiparr[indexPath.row].name == "EF76 Nebulon-B escort frigate"{
            urlstring = URL(string:shipstr[12])
        }else if shiparr[indexPath.row].name == "Calamari Cruiser"{
            urlstring = URL(string:shipstr[13])
        }else if shiparr[indexPath.row].name == "A-wing"{
            urlstring = URL(string:shipstr[14])
        }else if shiparr[indexPath.row].name == "B-wing"{
            urlstring = URL(string:shipstr[15])
        }else if shiparr[indexPath.row].name == "Republic Cruiser"{
            urlstring = URL(string:shipstr[16])
        }else if shiparr[indexPath.row].name == "Droid control ship"{
            urlstring = URL(string:shipstr[17])
        }else if shiparr[indexPath.row].name == "Naboo fighter"{
            urlstring = URL(string:shipstr[18])
        }else if shiparr[indexPath.row].name == "Naboo Royal Starship"{
            urlstring = URL(string:shipstr[19])
        }else if shiparr[indexPath.row].name == "Scimitar"{
            urlstring = URL(string:shipstr[20])
        }else if shiparr[indexPath.row].name == "J-type diplomatic barge"{
            urlstring = URL(string:shipstr[21])
        }else if shiparr[indexPath.row].name == "AA-9 Coruscant freighter"{
            urlstring = URL(string:shipstr[22])
        }else if shiparr[indexPath.row].name == "Jedi starfighter"{
            urlstring = URL(string:shipstr[23])
        }else if shiparr[indexPath.row].name == "H-type Nubian yacht"{
            urlstring = URL(string:shipstr[24])
        }else if shiparr[indexPath.row].name == "Republic Assault ship"{
            urlstring = URL(string:shipstr[25])
        }else if shiparr[indexPath.row].name == "Solar Sailer"{
            urlstring = URL(string:shipstr[26])
        }else if shiparr[indexPath.row].name == "Trade Federation cruiser"{
            urlstring = URL(string:shipstr[27])
        }else if shiparr[indexPath.row].name == "Theta-class T-2c shuttle"{
            urlstring = URL(string:shipstr[28])
        }else if shiparr[indexPath.row].name == "Republic attack cruiser"{
            urlstring = URL(string:shipstr[29])
        }else if shiparr[indexPath.row].name == "Naboo star skiff"{
            urlstring = URL(string:shipstr[30])
        }else if shiparr[indexPath.row].name == "Jedi Interceptor"{
            urlstring = URL(string:shipstr[31])
        }else if shiparr[indexPath.row].name == "arc-170"{
            urlstring = URL(string:shipstr[32])
        }else if shiparr[indexPath.row].name == "Banking clan frigate"{
            urlstring = URL(string:shipstr[33])
        }else if shiparr[indexPath.row].name == "Belbullab-22 starfighter"{
            urlstring = URL(string:shipstr[34])
        }else if shiparr[indexPath.row].name == "V-wing"{
            urlstring = URL(string:shipstr[35])
        }else if shiparr[indexPath.row].name == "T-70 X-wing fighter"{
            urlstring = URL(string:shipstr[36])
        }
        let session = URLSession(configuration: .default)
        let getImageFromUrl = session.dataTask(with: urlstring!){ (data, response, error) in
            if let e = error{
                print("Error:\(e)")
            }
            else{
                if (response as? HTTPURLResponse) != nil{
                    if let imageData = data{
                        let image = UIImage(data: imageData)
                        DispatchQueue.main.async {
                            cell.shipsimg.image = image
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
