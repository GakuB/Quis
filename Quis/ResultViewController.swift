//
//  ResultViewController.swift
//  Quis
//
//  Created by 馬鳥慎吾 on 2021/01/05.
//

import UIKit

class ResultViewController: UIViewController {
    var correctAnswer: Int = 0
    @IBOutlet var resultLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = String(correctAnswer)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    @IBAction func back() {
        self.presentingViewController?.presentingViewController?
            .dismiss(animated: true, completion: nil)
        
    }
    // Do any additional setup after loading the view.



/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */

}
