//
//  SecondViewController.swift
//  ECEResto2020
//
//  Created by Dylan Luchmun on 08/01/2020.
//  Copyright © 2020 Dylan Luchmun. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func nombreDeSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellule = tableView.dequeueReusableCell(withIdentifier: "cellCategorie", for: indexPath)
        
        cellule.textLabel?.text = "Item \(indexPath.row)"
        
        return cellule
    }

}

