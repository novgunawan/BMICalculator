//
//  SecondViewController.swift
//  BMICalculator

//
//  Created by Novi Gunawan on 05/04/21.
//

import UIKit

class SecondViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
  
    
    var message = ""
    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var productCollection: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    func setupView(){
        labelTitle.text = message
    }
    
    //Perlu tahu jumlah data yang bakal ditampilkan
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    //Data yang muncul di cell ini data apa
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "productCellIdentifier", for: indexPath) as? ProductCollectionViewCell
        
        if indexPath.row % 2 == 0 {
            cell?.productName.text = "Product 1"
            cell?.productImage.image = UIImage(named: "aaa")
        }
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "detailSegue", sender: self)
        selectedItem = indexPath.row
    }
    
    //Kirim data
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //typesafe
        if let destinationVC = segue.destination as? ThirdViewController {
            destinationVC.title = selectedItem
        }
    }
}
