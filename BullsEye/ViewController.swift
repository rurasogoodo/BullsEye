//
//  ViewController.swift
//  BullsEye
//
//  Created by Nick_Romanenko on 2/2/19.
//  Copyright © 2019 Nick_Romanenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func showAlert() {
        // создаем сам алерт-контроллер
        let alert = UIAlertController(title: "Hello, World", message: "This is my first app!", preferredStyle: .alert)
        
        // создаем "действие" для алерт-контроллера (в данном случае кнопку "Awesome", которая просто закрывает уведомление)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        // добавляем в наш алерт-контроллер созданное ранее "действие"
        alert.addAction(action)
        
        // показываем(активируем на экране) наш созданный алерт-контроллер
        present(alert, animated: true, completion: nil)
        
        
    }
}

