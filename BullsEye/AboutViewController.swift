//
//  AboutViewController.swift
//  BullsEye
//
//  Created by Nick_Romanenko on 2/6/19.
//  Copyright © 2019 Nick_Romanenko. All rights reserved.
//

import UIKit
import WebKit

class AboutViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = Bundle.main.url(forResource: "BullsEye", withExtension: "html") {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    @IBAction func close() {
        // отклоняем текущий вью-контроллер, который представлен как "модальный"
        dismiss(animated: true, completion: nil)
    }

}
