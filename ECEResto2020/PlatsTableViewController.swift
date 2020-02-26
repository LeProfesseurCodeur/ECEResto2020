//
//  PlatsTableViewController.swift
//  ECEResto2020
//
//  Created by Administrateur on 13/01/2020.
//  Copyright © 2020 Dylan Luchmun. All rights reserved.
//

import UIKit

class PlatsTableViewController: UITableViewController {

    var arrayPlats = [[String:String]]()
    var parametre1 = [String:String]()
    var objDAO = DataBase()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        confNavBar()
        
        if let idCategorie = parametre1["id_categorie"]{
        let query = "SELECT * FROM plats_nourriture WHERE id_categorie = \(idCategorie)"
        print(query)
        arrayPlats = DataBase().executerSelect(query) as! [[String : String]]
        }
            
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func confNavBar(){
    self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "v2_barre_titre"), for: .default)
        let logo = UIImage(named: "v2_logo")
        self.navigationItem.titleView = UIImageView(image:logo)
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(title:"", style:.plain, target: nil, action: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayPlats.count
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if let idCategorie = parametre1["id_categorie"] {
        parsingWSAndSync(idcat: idCategorie)
        }
    }
    
    func parsingWSAndSync(idcat:String){
    OperationQueue().addOperation {
        let routeJson = "https://creagates.com/listeplatsfinal.php?idc=\(idcat)"
        let urlJson = URL(string: routeJson)
        do{
            let donneeJson = try Data(contentsOf: urlJson!)
            do {
                let arrayDonnee = try JSONSerialization.jsonObject(with: donneeJson, options: .mutableContainers) as! [[String:String]]
                
                print("arrayDatos: \(arrayDonnee)")
                let queryDelete = "DELETE FROM plats_nourriture WHERE id_categorie =\(idcat)"
                print("queryDelete : \(queryDelete)")
                
                self.objDAO.executerDelete(queryDelete)
                
                for objDonnee in arrayDonnee{
                    let nomP = objDonnee["nom"]
                    let descP = objDonnee["description"]
                    let prixP = objDonnee["prix"]
                    let imgP = objDonnee["archive"]
                    let idc = objDonnee["categorie"]
                    
                    let queryInsert = "INSERT INTO plats_nourriture ('nom_plat', 'description_plat', 'prix_plat', 'archive_plat', 'id_categorie') values ('\(nomP!)', '\(descP!)', '\(prixP!)', '\(imgP!)', '\(idc!)')"
                    print("queryInsert : \(queryInsert)")
                    
                    self.objDAO.executerInsert(queryInsert)
                }
                 }catch{
                print("error1")
            }
            OperationQueue.main.addOperation({
                let query = "SELECT * FROM plats_nourriture WHERE id_categorie = \(idcat)"
                print(query)
                self.arrayPlats = DataBase().executerSelect(query) as! [[String : String]]
                
                self.tableView.reloadData()
            })
            
        } catch {
            print("erreur2")
        }
        
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellPlats", for: indexPath) as! CustomCellPlatsTableViewCell
        
        let nomP = arrayPlats[indexPath.row]["nom_plat"]
        let descP = arrayPlats[indexPath.row]["description_plat"]
        let prixP = arrayPlats[indexPath.row]["prix_plat"]
        
        if let imgP = arrayPlats[indexPath.row]["archive_plat"] {
        cell.imageCell.image = UIImage(named: imgP)
        }
        
        cell.titreCell.text = nomP
        cell.descCell.text = descP
        cell.prixCell.text = prixP
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "desc2plats"{
            if let indexPath = self.tableView.indexPathForSelectedRow {
            let objetPlat = arrayPlats[indexPath.row]
            let objVDesc = segue.destination as! DescPlatTableViewController
            objVDesc.parametre2 = objetPlat
            }
        }
    }

}
