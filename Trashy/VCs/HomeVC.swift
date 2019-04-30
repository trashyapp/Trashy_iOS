//
//  HomeVC.swift
//  Trashy
//
//  Created by Julia Lauten on 26.04.19.
//  Copyright © 2019 Julia Lauten. All rights reserved.
//

import UIKit
import BarcodeScanner
import Hero
import Firebase
import FirebaseFirestore

class HomeVC: BarcodeScannerViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var code: String!
    var images = ["Muelleimer_Papier", "Muelltonne_Restmuell", "Muelleimer_Bio", "Muelltonne_Wertstoffe"]
    var productName = String()
    var trash = String()
    var muelleimerZuordnung: String!
    var color: String!
    var image: String = ""
    var tonne: String = ""
    
    @IBOutlet weak var muelleimerCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        muelleimerCollectionView.dataSource = self
        muelleimerCollectionView.delegate = self
        muelleimerCollectionView.layer.zPosition = 1
        
        self.codeDelegate = self as? BarcodeScannerCodeDelegate
        self.errorDelegate = self as? BarcodeScannerErrorDelegate
        self.dismissalDelegate = self as? BarcodeScannerDismissalDelegate
        
        //self.messageViewController.removeFromParent()
        //self.messageViewController.view.removeFromSuperview()
        self.messageViewController.view.isHidden = true
        self.messageViewController.view.layer.zPosition -= 1
        //self.cameraViewController.view.bottomAnchor.constraint(equalTo: self.cameraViewController.view.frame.maxY, constant: 0)
        //self.cameraViewController.focusView.bottomAnchor.constraint(equalTo: self.cameraViewController.view.frame., constant: 0)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MuelleimerCVC", for: indexPath) as! MuelleimerCVC
        
        cell.muelleimerImageView.image = UIImage(named: images[indexPath.row])
        
        if code != nil {
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let muelleimerAnimationVC = storyBoard.instantiateViewController(withIdentifier: "MuelleimerAnimationVCSB") as! MuelleimerAnimationVC
            
            UIView.animate(withDuration: 1.0, animations: {
                //cell.muelleimerImageView.image = UIImage(named: "")
            })
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                cell.muelleimerImageView.hero.id = "muelleimerZoom"
                
                muelleimerAnimationVC.modalPresentationStyle = .overFullScreen
                muelleimerAnimationVC.color = self.color
                muelleimerAnimationVC.image = self.image
                muelleimerAnimationVC.productName = self.productName
                muelleimerAnimationVC.tonne = self.tonne

                
                self.present(muelleimerAnimationVC, animated: true, completion: nil)
                
                muelleimerAnimationVC.muelleimerImageView.image = cell.muelleimerImageView.image
            }
        }
        
        return cell
    }
    
    func muelleimerAnimation(muelleimer: String) {
        switch muelleimer {
        case "Bio":
            muelleimerZuordnung = "Muelleimer_Bio"
            color = "brown"
            image = "Man_Biomuelleimer"
            tonne = "Biotonne"
        case "Papier":
            muelleimerZuordnung = "Muelleimer_Papier"
            color = "blue"
            image = "Man_Papiermuelleimer"
            tonne = "Papiertonne"
        case "Verpackung":
            muelleimerZuordnung = "Muelltonne_Wertstoffe"
            color = "yellow"
            image = "Man_Wertstoffemuelleimer"
            tonne = "Verpackungsmüll"
        case "Rest":
            muelleimerZuordnung = "Muelltonne_Restmuell"
            color = "greyTwo"
            image = "Man_Restmuelleimer"
            tonne = "Restmülltonne"
        default: break
        }
        
        for i in 0..<images.count {
            if muelleimerZuordnung == images[i] {
                let indexPath = IndexPath(item: i, section: 0)
                self.muelleimerCollectionView.reloadItems(at: [indexPath])
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is ErgebnisVC {
            let ergebnisVC = segue.destination as? ErgebnisVC
            ergebnisVC?.code = code
        }
    }
}

extension HomeVC: BarcodeScannerCodeDelegate {
    func scanner(_ controller: BarcodeScannerViewController, didCaptureCode code: String, type: String) {
        print("hirwer")
        print(code)
        
        self.code = code
        
        let db = Firestore.firestore()
        
        let docRef = db.collection("products").document(self.code)
        
        docRef.getDocument { (document, error) in
            if let document = document, document.exists {
                let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
                print("Document data: \(String(describing: dataDescription))")
                print(document.data()?["name"])
                if let pN = document.data()?["name"] {
                    self.productName = pN as! String
                }
                if let t = document.data()?["trash"] {
                    self.trash = t as! String
                    
                    self.muelleimerAnimation(muelleimer: self.trash)
                }
                
            } else {
                print("Document does not exist")
                self.muelleimerAnimation(muelleimer: "")
            }
        }
    }
}
