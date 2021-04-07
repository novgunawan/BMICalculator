//
//  BMIViewController.swift
//  BMICalculator
//
//  Created by Novi Gunawan on 01/04/21.
//

import UIKit

class BMIViewController: UIViewController {

    //outlet berarti ngakses variabel
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var weightSlider: UISlider!
    @IBOutlet weak var heightSlider: UISlider!
    @IBOutlet weak var resultLabel : UILabel!
    @IBOutlet weak var bmiLabel : UILabel!
    
    @IBOutlet weak var resultsView: UIView!
    @IBAction func calculateButtonDidTap(_ sender: UIButton) {
        var bmiValue = 0.0
        //tinggi dalam satuan meter
        let height = heightSlider.value / 100
        let weight = weightSlider.value
        
        //Display bmi value
        bmiValue = Double (weight / pow(height, 2))
        bmiLabel.text = "\(String(format : "%.2f",bmiValue)) kg /m2"
        
        //Display status underweight atau overweight
        
        resultLabel.text = getBMIStatus(from: bmiValue)
    }
    
    @IBAction func heightSliderValueChanged(_ sender: UISlider) {
        heightLabel.text = String(format : "%.2f", sender.value)
    }
    
    
    @IBAction func weightSliderValueChanged(_ sender: UISlider) {
        weightLabel.text = String(format: "%.2f", sender.value)
    }
    
    func getBMIStatus(from bmiValue:Double) -> String {
        if bmiValue < 18.5 {
            return "Underweight"
        }
        else if bmiValue >= 18.5 && bmiValue <= 24.9{
            return "Normal"
        }
        else if bmiValue >= 25 && bmiValue <= 29.9{
            return "Overweight"
        }
        else {
            return "Obese"
        }
    }
    
    @IBAction func modeChanged(_ sender: UISegmentedControl) {
        
        switch sender.selectedSegmentIndex {
        case 1 :
            
            self.overrideUserInterfaceStyle = .dark
            resultsView.backgroundColor = #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)
        default:
            self.overrideUserInterfaceStyle = .light
            resultsView.backgroundColor = #colorLiteral(red: 1, green: 0.9392891526, blue: 0.765894115, alpha: 1)
        }
    }
    
    override func viewDidLoad() {
        //function di bawah viewDidload bakal langsung jalan pertama kali
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
//    struct DataModel {
//        var name = "",
//        var age = 0
//    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinationVC = segue.destination as? SecondViewController {
            destinationVC.message = "Hallo"
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
