//
//  CheffViewController.swift
//  Proyecto-Restarurante
//
//  Created by Alejandro Sklar on 8/1/18.
//  Copyright © 2018 Alejandro Sklar. All rights reserved.
//
import UIKit

class CheffViewController: UIViewController {
    
    @IBOutlet weak var viewContainer: UIView!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        let rotation = -CGFloat.pi/30.0
        let transform = viewContainer.transform
        let rotated = transform.rotated(by: rotation)
        self.viewContainer.transform = rotated
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
