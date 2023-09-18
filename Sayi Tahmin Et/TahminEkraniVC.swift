//
//  TahminEkraniVC.swift
//  Sayi Tahmin Et
//
//  Created by alihizardere on 18.09.2023.
//

import UIKit

class TahminEkraniVC: UIViewController {

    @IBOutlet weak var labelKalanHak: UILabel!
    @IBOutlet weak var labelYardim: UILabel!
    @IBOutlet weak var textFieldGirdi: UITextField!
    
    var rastgeleSayi:Int?
    var kalanHak = 5
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        rastgeleSayi = Int.random(in: 0...100)//Rastgele Sayı
        print("Rastgele Sayı : \(rastgeleSayi!)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let gelenVeri = sender as? Bool{//gelen veri downcasting ile Bool türüne dönüştürüldü
            
            let gidilecekVC = segue.destination as! SonucEkraniVC
            gidilecekVC.sonuc = gelenVeri
            
        }
    }

    @IBAction func tahminEt(_ sender: Any) {
        labelYardim.isHidden = false
        kalanHak-=1//Her tahminde bir azalacak
        
        if let veri = textFieldGirdi.text {//Textfield üzerinden veri kontrol edilerek alınır
            
            if let tahmin = Int(veri) {//String ifadeyi kontrol ederek int ifadeye dönüştürürüz.
                
                if tahmin == rastgeleSayi! {//Tahmin rasgele sayıya eşitse kazanılır.
                    let sonuc = true
                    performSegue(withIdentifier: "sonucEkraniGecis", sender: sonuc)//Kazanılırsa sayfa geçişi ve veri transferi
                    return//Kazandıktan işlem yapmaması için return kullandık.
                    //return buttonun çalışmasını durdurur ve return ifadesinin yer aldığı satırdan sonraki kodlamalar çalışmaz.
                }
                
                if tahmin > rastgeleSayi! {//Tahmin edilen sayı büyük ise
                    labelYardim.text = "Azalt"
                    labelKalanHak.text = "Kalan Hak : \(kalanHak)"
                }
               
                if tahmin < rastgeleSayi! {//Tahmin edilen sayı küçük ise
                    labelYardim.text = "Arttır"
                    labelKalanHak.text = "Kalan Hak : \(kalanHak)"
                }
                
                if(kalanHak == 0){//Tahmin hakkı kalmaz ise
                    let sonuc = false
                    performSegue(withIdentifier: "sonucEkraniGecis", sender: sonuc)
                    //Haklar bitince sayfa geçişi ve veri transferi
                }
                
                textFieldGirdi.text = ""//tekrar veri girmemiz için her butona tıklandıktan sonra textfield "" eşitlendi
            }
            
        }

        
    }
    
}
