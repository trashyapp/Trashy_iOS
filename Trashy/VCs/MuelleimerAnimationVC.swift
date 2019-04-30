//
//  MuelleimerAnimationVC.swift
//  Trashy
//
//  Created by HARDWARECOP on 4/26/19.
//  Copyright © 2019 Julia Lauten. All rights reserved.
//

import UIKit
import Hero

class MuelleimerAnimationVC: UIViewController {
    
    var muelleimerZuordnung: String!
    var color: String!
    var image: String!
    var productName: String!
    var tonne: String!

    @IBOutlet weak var muelleimerImageView: UIImageView!
    @IBOutlet weak var muelleimerDeckelView: RoundView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        muelleimerDeckelView.backgroundColor = UIColor(named: color)
        
        self.hero.isEnabled = true
        muelleimerImageView.hero.id = "muelleimerZoom"
        muelleimerDeckelView.hero.modifiers = [.translate(x: -120)]
        
        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.25)
        
        self.muelleimerDeckelView.transform = self.muelleimerDeckelView.transform.rotated(by: CGFloat(0.349066))
        //self.muelleimerDeckelView.frame.origin.x += 3
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            UIView.animate(withDuration: 0.4, animations: {
                self.muelleimerImageView.frame.origin.y += 10
                //self.muelleimerDeckelView.frame.origin.x -= 3
                self.muelleimerDeckelView.transform = self.muelleimerDeckelView.transform.rotated(by: CGFloat(-0.349066))
            }, completion: { (finished: Bool) in
                UIView.animate(withDuration: 0.3, delay: 0.0, animations: {
                    self.muelleimerDeckelView.frame.origin.y -= 5
                }, completion: { (finished: Bool) in
                    UIView.animate(withDuration: 0.4, delay: 0.0, animations: {
                        //deckel schließen
                        self.muelleimerDeckelView.frame.origin.y += 35
                        //self.muelleimerDeckelView.frame.origin.x += 3
                        self.muelleimerDeckelView.transform = CGAffineTransform(scaleX: 1.0, y: 1.2)
                        
                        //self.muelleimerDeckelView.frame.origin.x += 15
                        
                        //self.muelleimerDeckelView.transform = self.muelleimerDeckelView.transform.rotated(by: CGFloat(0.349066))
                    }, completion: { (finished: Bool) in
                        UIView.animate(withDuration: 0.3, animations: {
                            self.muelleimerImageView.transform = CGAffineTransform(scaleX: 2, y: 2)
                            self.muelleimerDeckelView.transform = CGAffineTransform(scaleX: 2, y: 2)
                            self.muelleimerImageView.alpha = 0.0
                            self.muelleimerDeckelView.alpha = 0.0
                        }, completion: { (finished: Bool) in
                            self.performSegue(withIdentifier: "toErgebnisVC", sender: nil)
                        })
                    })
                })
            })
        }
        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ErgebnisVC {
            let ergebnisVC = segue.destination as? ErgebnisVC
            ergebnisVC?.image = self.image
            ergebnisVC?.productName = self.productName
            ergebnisVC?.tonne = self.tonne
        }
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
