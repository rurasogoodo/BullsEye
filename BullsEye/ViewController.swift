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
        
        startNewGame() //начальная установка рандомного значения и слайдера
        
        // устанавливаем изображение для ползунка слайдера для нормального состояния
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        // устанавливаем изображение для ползунка слайдера при нажатии
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMaximumTrackImage(trackRightResizable, for: .normal)
    }
    
    @IBAction func showAlert() {
        // считаем, насколько близко пользователь "угадал" число
        let difference = abs(currentValue - targetValue)
        
        // считаем, сколько "очков" набрал пользователь
        var points = 100 - difference
    
        let title: String
        
        if difference == 0 {
            title = "Perfect!"
            points += 100
        } else if difference < 5 {
            title = "You almost had it!"
            if difference == 1 {
                points += 50
            }
        } else if difference < 10 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        score += points
        
        // сообщение для пользователя
        let message = "You scored \(points) points!"
        
        // создаем сам алерт-контроллер и добавляем в него наше сообщение
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        // создаем "действие" для алерт-контроллера (в данном случае кнопку "ok", которая просто закрывает уведомление)
        let action = UIAlertAction(title: "OK", style: .default) { (action) in
            self.startNewRound()
        }
        
        // добавляем в наш алерт-контроллер созданное ранее "действие"
        alert.addAction(action)
        
        // показываем(активируем на экране) наш созданный алерт-контроллер
        present(alert, animated: true, completion: nil)
    }
    
    // вызывается, когда пользователь "использует" слайдер
    @IBAction func sliderMoved(_ slider: UISlider) {
        // ловим значение слайдера и округляем его для нашей переменной
        currentValue = lroundf(slider.value)
    }
    
    // начинаем игру с самого начала
    @IBAction func startNewGame() {
        score = 0
        round = 0
        startNewRound()
        
        // добавляем анимацию
        let transition = CATransition()
        transition.type = CATransitionType.fade
        transition.duration = 1
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeOut)
        view.layer.add(transition, forKey: nil)
    }
    
    // обновляем значения для нового раунда
    func startNewRound() {
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        
        updateLabels()
    }
    
    // обновляем все лейблы
    func updateLabels() {
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
    }
}

