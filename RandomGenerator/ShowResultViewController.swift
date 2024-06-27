//
//  ShowResultViewController.swift
//  RandomGenerator
//
//  Created by Ozan Can Sarı on 24.04.2024.
//

import UIKit

class ShowResultViewController: UIViewController {

    @IBOutlet weak var showResultTextView: UITextView!
    var results : String?
    override func viewDidLoad() {
        super.viewDidLoad()
        showResultTextView.text = results!
        // Do any additional setup after loading the view.
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
