//
//  SecondViewController.swift
//  ECEResto2020
//
//  Created by Dylan Luchmun on 08/01/2020.
//  Copyright © 2020 Dylan Luchmun. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableCategorie: UITableView!
    
    var arrayCategories = [[String:String]]()
    //var parametre1 = [String:String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        DataBase.checkAndCreateDatabase()
        
        arrayCategories = DataBase().executerSelect("SELECT * FROM categorie_plats") as! [[String : String]]
        
    }
    
    func nombreDeSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCategories.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellule = tableView.dequeueReusableCell(withIdentifier: "cellCategorie", for: indexPath) as! CategorieTableViewCell
        let nomCategorie = arrayCategories[indexPath.row]["nom_categorie"]
        
        cellule.nomCatCell?.text = nomCategorie
        return cellule
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "categorie2plats"{
            
            if let indexPath = self.tableCategorie.indexPathForSelectedRow {
            
            let categorieSelection = arrayCategories[indexPath.row]
            
            
            let objVDestination = segue.destination as! PlatsTableViewController
            objVDestination.parametre1 = categorieSelection
            }
        }
    }

}

