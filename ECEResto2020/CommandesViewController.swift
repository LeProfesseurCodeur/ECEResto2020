//
//  CommandesViewController.swift
//  ECEResto2020
//
//  Created by Administrateur on 03/02/2020.
//  Copyright © 2020 Dylan Luchmun. All rights reserved.
//

import UIKit

class CommandesViewController: UIViewController {

    
    @IBOutlet var tableViewCommandes: UITableView!
    @IBOutlet var lblMontantTotal: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func passerCommande(_ sender: Any) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
