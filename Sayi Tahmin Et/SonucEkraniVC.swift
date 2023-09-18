//
//  SonucEkraniVC.swift
//  Sayi Tahmin Et
//
//  Created by alihizardere on 18.09.2023.
//

import UIKit

class SonucEkraniVC: UIViewController {
    
    
    @IBOutlet weak var imageViewSonuc: UIImageView!
    @IBOutlet weak var labelSonuc: UILabel!
    var sonuc:Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        self.navigationItem.hidesBackButton = true
        
        if sonuc! == true{
            labelSonuc.text = "KAZANDINIZ"
            imageViewSonuc.image = UIImage(named: "mutlu_resim")
        }else{
            labelSonuc.text = "KAYBETTİNİZ"
            imageViewSonuc.image = UIImage(named: "uzgun_resim")
        }
            
    }
    
    @IBAction func tekrarOyna(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)//Anasayfaya geri döner
    }
    
}
