//
//  ViewController.swift
//  BullsEye
//
//  Created by Nick_Romanenko on 2/2/19.
//  Copyright © 2019 Nick_Romanenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var currentValue: Int = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showAlert() {
        // сообщение для пользователя о том, какое значение сейчас имеет слайдер
        let message = "The value of the slider is: \(currentValue)"
        
        // создаем сам алерт-контроллер и добавляем в него наше сообщение
        let alert = UIAlertController(title: "Hi...", message: message, preferredStyle: .alert)
        
        // создаем "действие" для алерт-контроллера (в данном случае кнопку "Awesome", которая просто закрывает уведомление)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        // добавляем в наш алерт-контроллер созданное ранее "действие"
        alert.addAction(action)
        
        // показываем(активируем на экране) наш созданный алерт-контроллер
        present(alert, animated: true, completion: nil)
        
        
    }
    
    @IBAction func sliderMoved(_ slider: UISlider) {
        // ловим значение слайдера и округляем его для нашей переменной
        currentValue = lroundf(slider.value)
    }
}

