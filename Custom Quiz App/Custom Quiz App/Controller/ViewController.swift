//
//  ViewController.swift
//  Custom Quiz App
//
//  Created by Brendan Tan on 6/2/23.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var button1: UIButton!
    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button3: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    
    
    
    var customButton = ButtonsCSS()
    var questionDB = QuestionDB()
    var totalScore: String = "0"
    let b1 = 0
    let b2 = 1
    let b3 = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(restartUI), name: NSNotification.Name(rawValue: "PerformAfterPresenting"), object: nil)
        updateUI()
    }
    
    @objc func restartUI(){
        questionDB.restartQuiz()
        updateUI()
    }
    
    @objc func updateUI(){
        setupButtonConstraints()
        addActionToButton()
        
        questionLabel.text = questionDB.getQuestionText()
        button1.setTitle(questionDB.getButtonText()[b1], for: .normal)
        button2.setTitle(questionDB.getButtonText()[b2], for: .normal)
        button3.setTitle(questionDB.getButtonText()[b3], for: .normal)
        scoreLabel.text = "Score: \(questionDB.getScore())"
        progressBar.progress = questionDB.getProgress()
        button1.backgroundColor = UIColor.clear
        button2.backgroundColor = UIColor.clear
        button3.backgroundColor = UIColor.clear
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = questionDB.checkAnswerIfCorrect(userAnswer)
        if(userGotItRight){
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        if(questionDB.nextQuestion()){
            Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        }else{
            self.performSegue(withIdentifier: "goToResults", sender: self)
        }
        

        

        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults" {
            let destinationVC = segue.destination as! ResultsViewController
            if(questionDB.nextQuestion() == false){
                totalScore = String(questionDB.getScore())
                destinationVC.totalScore = totalScore
            }
            
        }
    }
    
    func setupButtonConstraints(){
//        view.addSubview(customButton)
//        customButton.translatesAutoresizingMaskIntoConstraints = false
//        customButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        customButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
//        customButton.centreXAnchor.constraint(equalTo: view.centreXAnchor).isActive = true
//        customButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200).isActive = true
    }
    func addActionToButton(){
        customButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped(){
        customButton.shake()
    }
    
}

