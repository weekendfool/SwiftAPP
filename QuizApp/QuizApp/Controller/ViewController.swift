//
//  ViewController.swift
//  QuizApp
//
//  Created by 尾原徳泰 on 2020/03/14.
//  Copyright © 2020 尾原徳泰. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NowScoreDelegate{
   
    
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var maxScoreLabel: UILabel!
    
    var correctCount = 0
    
    var wrongCount = 0
    
    var maxScore = 0
    
    var questionNumber = 0
    
    let imagesList = ImagesList()
    
    var pickdAnswer = false
    
    var soundFile = SoundFile()
    
    var changeColor = ChangeColor()
    
    var gradientLayer = CAGradientLayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imageView.layer.cornerRadius = 20.0
        
        gradientLayer = changeColor.changeColor(topR: 0.07, topG: 0.13, topB: 0.26, topAlpha: 1.0, bottomR: 1.0, bottomG: 0.54, bottomB: 0.74, bottomAlpha: 1.0)
        
        gradientLayer.frame = view.bounds
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        correctCount = 0
        
        wrongCount = 0
        
        questionNumber = 0
        
        imageView.image = UIImage(named: imagesList.list[0].imageText)
        
        if UserDefaults.standard.object(forKey: "beforeCount") != nil {
            
            maxScore = UserDefaults.standard.object(forKey: "beforeCount") as! Int
        }
        
        maxScoreLabel.text = String(maxScore)

    }

    @IBAction func answerButton(_ sender: Any) {
        
        if (sender as AnyObject).tag == 1 {
            
            soundFile.playSound(fileName: "maruSound", extensionName: "mp3")
            
            pickdAnswer = true
            
        } else if (sender as AnyObject).tag == 2 {
            
            soundFile.playSound(fileName: "batsuSound", extensionName: "mp3")
            
            pickdAnswer = false
            
        }
        
        
        
        
    }
    
    func check() {
        
        let correctAnswer = imagesList.list[0].answer
        
        if correctAnswer == pickdAnswer {
            
            print("正解")
            correctCount += 1
            
        } else {
            
            print("不正解")
            wrongCount += 1
        }
        
    }
    
    func nextQuestions() {
        
        if questionNumber <= 9 {
            
            questionNumber += 1
            
            imageView.image = UIImage(named: imagesList.list[questionNumber].imageText)
            
        } else {
            print("問題終了")
            
            performSegue(withIdentifier: "next", sender: nil)
        }
    }
    
    func nowScore(score: Int) {
        
        soundFile.playSound(fileName: "Sound", extensionName: "mp3")
        
        maxScoreLabel.text = String(score)
       }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "next" {
            
            let nextVC = segue.destination as! NextViewController
            
            nextVC.correctedCount = correctCount
            
            nextVC.wrongCount = wrongCount
            
            nextVC.delegate = self
        }
    }
    
}

