//
//  InfoInhaltVC.swift
//  Trashy
//
//  Created by Julia Lauten on 27.04.19.
//  Copyright © 2019 Julia Lauten. All rights reserved.
//

import UIKit

class InfoInhaltVC: UIViewController {

    @IBOutlet weak var tonneImage: UIImageView!
    @IBOutlet weak var textField: UITextView!
    @IBOutlet weak var labelTitle: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        labelTitle.text = data[myIndex][0]
        labelTitle.backgroundColor = UIColor.init(named: colors[myIndex])
        labelTitle.textColor = UIColor.white
        
        textField.text = data[myIndex][1]
        
        tonneImage.image = UIImage(named: data[myIndex][0])
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
