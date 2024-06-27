//
//  ViewController.swift
//  RandomGenerator
//
//  Created by Ozan Can Sarı on 24.04.2024.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var minValue: UITextField!
    @IBOutlet weak var maxValue: UITextField!
    @IBOutlet weak var numberRepeat: UISwitch!
    @IBOutlet weak var numberCount: UITextField!
    var list : [Int] = []
    
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func makeAlert(title : String, message : String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Tamam", style: .default)
        alertController.addAction(alertAction)
        present(alertController, animated: true)
    }


    @IBAction func generateNumber(_ sender: Any) {
        let maxValueInt : Int = Int(maxValue.text!)!
        let minValueInt : Int = Int(minValue.text!)!
        let numberCountInt : Int = Int(numberCount.text!)!
        let difference = maxValueInt - minValueInt + 1
        
        if minValueInt >= maxValueInt {
            makeAlert(title: "HATA!", message: "Minimum maksimuma eşit ya da büyük olamaz!")
            return
        }
        if !numberRepeat.isOn && numberCountInt > difference {
            makeAlert(title: "HATA!", message: "Bu kadar tekrarsız sayı üretilemez")
            return
        }
        list.removeAll()
        for _ in 0..<numberCountInt {
            var myRandomNumber : Int = Int.random(in: minValueInt...maxValueInt)
            if(!numberRepeat.isOn) {
                while(list.contains(myRandomNumber)) {
                    myRandomNumber = Int.random(in: minValueInt...maxValueInt)
                }
                list.append(myRandomNumber)
                continue
            }
            list.append(myRandomNumber)
        }
        //textView.text = list.map { String($0) }.joined(separator: "  ")
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ozansegue") {
            let secondView = segue.destination as! ShowResultViewController
            secondView.results = list.map { String($0) }.joined(separator: "  ")
        }
    }
}

