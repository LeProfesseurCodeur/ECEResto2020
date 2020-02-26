//
//  CommandesViewController.swift
//  EceResto2020v2
//
//  Created by Gian on 03/02/2020.
//  Copyright © 2020 Gian. All rights reserved.
//

import UIKit

class CommandesViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    var dao = DataBase()
    var arrayPlatsCommandes = [[String:String]]()
    @IBOutlet weak var tableViewCommandes: UITableView!
    @IBOutlet weak var montantTotalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        arrayPlatsCommandes = dao.executerSelect("select * from commande order by id_commande desc") as! [[String:String]]
        tableViewCommandes.reloadData()
        print(arrayPlatsCommandes)
        // print(dataCommande!)
    }
    override func viewDidAppear(_ animated: Bool) {
        let montantTotal = calculTotal()
        montantTotalLabel.text = "€/ \(montantTotal) "
    }
    
    @IBAction func passerCommande(_ sender: Any) {
        // envoi des données au serveur
    }
    func calculTotal()->Float{
        var total:Float = 0.0
        for obj in arrayPlatsCommandes{
            let qte = obj["quantite_plat"]
            let qteNum = Float(qte!)
            let prixUnit = obj["prix_unit"]
            let prixNum = Float(prixUnit!)
            let soustotal = qteNum! * prixNum!
            total = total + soustotal
            }
            return total
        }
}

    extension CommandesViewController{
        
        // nombre de sections dans mon tableView
        func numberOfSections(in tableView: UITableView) -> Int{
        return 1
        }
        
        // nombre de lignes dans mon tableView
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
            return arrayPlatsCommandes.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
            let cell = tableView.dequeueReusableCell(withIdentifier: "cellCommande", for: indexPath) as! CommandesTableViewCell
            
            cell.nomCell.text = arrayPlatsCommandes[indexPath.row]["nom_plat"]
            cell.quantiteCell.text = arrayPlatsCommandes[indexPath.row]["quantite_plat"]
            cell.prixUnitCell.text = arrayPlatsCommandes[indexPath.row]["prix_plat"]
            let semitot = cell.calculSousTotal()
            cell.prixTotalCell.text = "\(semitot)"
            return cell
        }
    }
    

