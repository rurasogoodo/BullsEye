//
//  ViewController.swift
//  BullsEye
//
//  Created by Nick_Romanenko on 2/2/19.
//  Copyright © 2019 Nick_Romanenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    
    var targetValue = 0
    var currentValue: Int = 50
    var score: Int = 0
    var round: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        startNewRound() //начальная установка рандомного значения и слайдера
    }

    @IBAction func showAlert() {
        
        // считаем, насколько близко пользователь "угадал" число
        let difference = abs(currentValue - targetValue)
        
        // считаем, сколько "очков" набрал пользователь
        let points = 100 - difference
        
        score += points
        
        // сообщение для пользователя
        let message = "You scored \(points) points!"
        
        // создаем сам алерт-контроллер и добавляем в него наше сообщение
        let alert = UIAlertController(title: "Hi...", message: message, preferredStyle: .alert)
        
        // создаем "действие" для алерт-контроллера (в данном случае кнопку "ok", которая просто закрывает уведомление)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        // добавляем в наш алерт-контроллер созданное ранее "действие"
        alert.addAction(action)
        
        // показываем(активируем на экране) наш созданный алерт-контроллер
        present(alert, animated: true, completion: nil)
        
        // начинаем новый раунд, устанавливая новые значения рандома и слайдера
        startNewRound()
    }
    
    // вызывается, когда пользователь "использует" слайдер
    @IBAction func sliderMoved(_ slider: UISlider) {
        // ловим значение слайдера и округляем его для нашей переменной
        currentValue = lroundf(slider.value)
    }
    
    // обновляем значения для нового раунда
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        
        updateLabels()
    }
    
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

