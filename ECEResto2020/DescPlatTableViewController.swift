//
//  DescPlatTableViewController.swift
//  ECEResto2020
//
//  Created by Administrateur on 21/01/2020.
//  Copyright © 2020 Dylan Luchmun. All rights reserved.
//

import UIKit

class DescPlatTableViewController: UITableViewController {
    
    @IBOutlet var blurEffect: UIVisualEffectView!
    
    var qtePlat:Int!
    @IBOutlet var viewContainer: UIView!
    @IBOutlet var lblQtePlat: UILabel!
    
    let dao = DataBase()
    
    var arrayPlats2 = [[String:String]]()
    
    var parametre2 = [String:String]()
    
    @IBOutlet var imageP: UIImageView!
    @IBOutlet var nomP: UILabel!
    @IBOutlet var prixP: UILabel!
    @IBOutlet var descP: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let logo = UIImage(named: "v2_logo")
        self.navigationItem.titleView = UIImageView(image: logo)
        
        qtePlat = 1
        lblQtePlat.text = "\(qtePlat!)"
        
        nomP.text = parametre2["nom_plat"]
        descP.text = parametre2["description_plat"]
        prixP.text = parametre2["prix_plat"]
        
        if let nomImg = parametre2["archive_plat"] {
            imageP.image = UIImage(named: nomImg)
        }
        
//        quantitePlat = 1
//        quantitePlatsLabel.text = "\(quantitePlat)"
//
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    @IBAction func validerCom(_ sender: Any) {
        
        //blurEffect.removeFromSuperview()
        viewContainer.removeFromSuperview()
        
        let nomPlat = nomP.text
        let prixPlat = prixP.text
        if let qte = qtePlat {
        
        let insertComm = "INSERT INTO commande (nom_plat, prix_unit, qte_plat) values ('\(nomPlat!)', '\(prixPlat!)', '\(qte)')"
            dao.executerInsert(insertComm)
        }
        
        let dataComm = dao.executerSelect("SELECT * FROM commande")
        print(dataComm!)
    }
    
    @IBAction func diminuerQte(_ sender: Any) {
        if qtePlat > 0 {
            qtePlat -= 1
        }
        lblQtePlat.text = "\(qtePlat!)"
    }
    
    @IBAction func augmenterQte(_ sender: Any) {
        qtePlat += 1
        lblQtePlat.text = "\(qtePlat!)"
    }
    
    @IBAction func ajoutFavoris(_ sender: Any) {
    }
    
    @IBAction func commander(_ sender: Any) {
        // viewContainer.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        viewContainer.center = view.center
        self.view.addSubview(viewContainer)
    }
    
//    @IBAction func ajoutFav(_ sender: Any) {
//    }
//
//    @IBAction func diminuerQte(_ sender: Any) {
//        if qtePlat > 0 {
//        qtePlat -= 1
//        }
//        lblQtePlat.text = "\(qtePlat!)"
//    }
//    @IBAction func augmenterQte(_ sender: Any) {
//        qtePlat += 1
//        lblQtePlat.text = "\(qtePlat!)"
//    }
//
//    @IBAction func commander(_ sender: Any) {
//        //viewContainer.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
//        blurEffect.frame = view.frame
//        self.view.addSubview(blurEffect)
//        self.view.addSubview(viewContainer)
//        viewContainer.center = view.center
//
//    }

}
