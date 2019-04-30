//
//  ErgebnisVC.swift
//  Trashy
//
//  Created by HARDWARECOP on 4/26/19.
//  Copyright © 2019 Julia Lauten. All rights reserved.
//

import UIKit
import Hero
import Firebase
import FirebaseFirestore


class ErgebnisVC: UIViewController {
    
    var code: String!
    var image: String!
    var productName: String!
    var tonne: String!

    @IBOutlet weak var produktnameLabel: UILabel!
    @IBOutlet weak var produktImageView: UIImageView!
    @IBOutlet weak var tonnennameLabel: UILabel!
    @IBOutlet weak var tonnenImageView: UIImageView!
    @IBOutlet weak var ergebnisInformationButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setNavigationBarHidden(true, animated: false)
        ergebnisInformationButton.hero.id = "ergebnisInformationPopUp"
        
        tonnenImageView.image = UIImage(named: image)
        produktnameLabel.text = productName
        tonnennameLabel.text = tonne
        
        if (productName == "Vanish Gold") {
            produktImageView.image = UIImage(named: "vanish")
        }
    
    }
    
    @IBAction func ergebnisInformationButtonAction(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let ergebnisInformationPUVC = storyBoard.instantiateViewController(withIdentifier: "ErgebnisInformationPUVCSB") as! ErgebnisInformationPUVC
        ergebnisInformationPUVC.modalPresentationStyle = .overFullScreen
        ergebnisInformationPUVC.productName = self.productName
        
        
        self.present(ergebnisInformationPUVC, animated: true, completion: nil)
        
        ergebnisInformationPUVC.code = code
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
