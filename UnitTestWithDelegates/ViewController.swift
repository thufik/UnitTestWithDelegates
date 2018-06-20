//
//  ViewController.swift
//  UnitTestWithDelegates
//
//  Created by EquipeSuporteAplicacao on 5/30/18.
//  Copyright © 2018 Thufik. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func Access(_ sender: UIButton) {
        let requestManager = RequestManager()
        let loginManager = LoginManager(loginViewDelegate: self)
        
        loginManager.login(email: "teste", pass: "teste", requestManager: requestManager)
    }
}

extension ViewController : LoginViewProtocol{
    func showIndicatorView() {
        print("mostrando indicator")
    }
    
    func hideIndicatorView() {
        print("escondendo indicator")
    }
    
    func showAlertMessage(message: String) {
        print("mostrando mensagem \(message)")
    }
    
    func showWelcomeScreen() {
        print("Mostrando welcome screen")
    }
}

