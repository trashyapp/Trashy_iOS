//
//  ErgebnisInformationPUVC.swift
//  Trashy
//
//  Created by HARDWARECOP on 4/26/19.
//  Copyright © 2019 Julia Lauten. All rights reserved.
//

import UIKit
import Hero

class ErgebnisInformationPUVC: UIViewController {
    
    var code: String!
    var productName: String!

    @IBOutlet weak var produktnameView: RoundView!
    @IBOutlet weak var produktnameLabel: UILabel!
    @IBOutlet weak var produktInformationView: RoundView!
    @IBOutlet weak var produktImageView: UIImageView!
    @IBOutlet weak var produktInfoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(code)
        
        if (productName == "Vanish Gold") {
            produktImageView.image = UIImage(named: "vanish")
            produktInfoLabel.text = "enthält: PET und Farbmittel"
        }
        
        produktnameLabel.text = productName
        
        self.hero.isEnabled = true
        produktnameView.hero.id = "ergebnisInformationPopUp"
        produktInformationView.hero.modifiers = [.translate(x: -150)]
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        guard let location = touch?.location(in: self.view) else { return }
        if !produktnameView.frame.contains(location) && !produktInformationView.frame.contains(location) {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
