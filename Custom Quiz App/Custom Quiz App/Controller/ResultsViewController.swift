//
//  ResultsViewController.swift
//  Custom Quiz App
//
//  Created by Brendan Tan on 19/2/23.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var totalScore: String?
    var questionDB = QuestionDB()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreLabel.text = totalScore
    }
    

    @IBAction func returnToQuizPressed(_ sender: Any) {
        NotificationCenter.default.post(name:NSNotification.Name(rawValue: "PerformAfterPresenting"), object: nil)
        self.dismiss(animated: true, completion: nil)
    }


}
