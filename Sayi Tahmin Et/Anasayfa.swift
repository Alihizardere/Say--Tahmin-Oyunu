//
//  ViewController.swift
//  Sayi Tahmin Et
//
//  Created by alihizardere on 18.09.2023.
//

import UIKit

class Anasayfa: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func oyunaBasla(_ sender: Any) {
        performSegue(withIdentifier: "tahminEkraniGecis", sender: nil)
    }
    
}

