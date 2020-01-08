//
//  SecondViewController.swift
//  ECEResto2020
//
//  Created by Dylan Luchmun on 08/01/2020.
//  Copyright © 2020 Dylan Luchmun. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var arrayCategories = [[String:String]]()

    override func viewDidLoad() {
        super.viewDidLoad()
        let c1 = ["idc":"1","nomc":"Entrées"]
        let c2 = ["idc":"2","nomc":"Plats"]
        let c3 = ["idc":"3","nomc":"Desserts"]
        let c4 = ["idc":"4","nomc":"Menus"]
        let c5 = ["idc":"5","nomc":"Boisson"]
        
        arrayCategories = [c1, c2, c3, c4, c5]
    }
    
    func nombreDeSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCategories.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellule = tableView.dequeueReusableCell(withIdentifier: "cellCategorie", for: indexPath)
        let nomCategorie = arrayCategories[indexPath.row]["nomc"]
        
        cellule.textLabel?.text = nomCategorie
        
        return cellule
    }

}

